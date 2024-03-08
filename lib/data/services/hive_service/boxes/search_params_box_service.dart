part of '../hive_service.dart';

@immutable
final class _SearchParamsBoxService extends IHiveBoxService<SearchParamsModel> {
  _SearchParamsBoxService({required super.boxKey});

  @override
  Box<SearchParamsModel> get box => Hive.box<SearchParamsModel>(boxKey);

  List<SearchParamsModel> get searchedParamList => box.values.toList()..sort((a, b) => (a.savedTime ?? _veryOldDate).compareTo(b.savedTime ?? _veryOldDate));

  bool isAlreadyAdded(SearchParamsModel searchParamsModel) {
    return searchedParamList.any(
      (element) => element.amount == searchParamsModel.amount && element.expiry == searchParamsModel.expiry && element.loanType == searchParamsModel.loanType,
    );
  }

  Future<void> addNewSearchParam(SearchParamsModel searchParamsModel) async {
    try {
      if (isAlreadyAdded(searchParamsModel)) {
        ///
        /// If the search param is already added, then delete the old one and add the new one
        /// This is to make sure that the search param is always at the top of the list
        ///
        await _deleteWithQuery(searchParamsModel);
        final updated = searchParamsModel.copyWith(savedTime: DateTime.now().toUtc());
        await box.put(
          searchParamsModel.id,
          updated,
        );
        return;
      } else {
        /// If the list has more than 10 items, then delete the oldest item
        if (searchedParamList.length >= 10) {
          await deleteSearchParamById(searchedParamList.first.id);
        }

        ///
        /// Save the search param with the current time
        /// so that we can sort the search params based on the time
        ///
        final updated = searchParamsModel.copyWith(savedTime: DateTime.now().toUtc());
        await box.put(searchParamsModel.id, updated);
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> deleteSearchParamById(String id) async {
    try {
      await box.delete(id);
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  Future<void> _deleteWithQuery(SearchParamsModel model) async {
    try {
      final toDelete = searchedParamList.firstWhereOrNull(
        (element) => element.amount == model.amount && element.expiry == model.expiry && element.loanType == model.loanType,
      );
      if (toDelete != null) {
        await deleteSearchParamById(toDelete.id);
      }
    } catch (e, s) {
      LoggerService.instance.catchLog(e, s);
    }
  }

  DateTime get _veryOldDate => DateTime(1900);
}
