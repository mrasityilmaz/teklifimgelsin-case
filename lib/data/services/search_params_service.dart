import 'package:injectable/injectable.dart';
import 'package:my_coding_setup/data/enums/credit_type_enum.dart';
import 'package:my_coding_setup/data/models/search_params_model/search_params_model.dart';
import 'package:my_coding_setup/data/services/hive_service/hive_service.dart';
import 'package:stacked/stacked.dart';
import 'package:uuid/uuid.dart';

@lazySingleton
final class SearchParamsService with ListenableServiceMixin {
  ///
  /// This service is used to store the search parameters for the loan offers
  /// and its listen every changes in the search parameters
  ///
  /// If the search parameters are changed, the view model will be notified which listens to this service
  ///
  SearchParamsService() {
    _searchParamsReactive = ReactiveValue<SearchParamsModel>(_lastSearchParams ?? SearchParamsModel(amount: 100000, expiry: 12, loanType: LoanTypeEnum.personalFinanceLoan, id: const Uuid().v4()));
    listenToReactiveValues([_searchParamsReactive]);
  }

  ///
  /// Dependencies
  ///
  final _searchParamsBoxService = HiveService.instance.searchParamsBoxService;

  ///
  /// Reactive value for the search parameters
  ///
  late final ReactiveValue<SearchParamsModel> _searchParamsReactive;

  SearchParamsModel get activeSearchParams => _searchParamsReactive.value;

  List<SearchParamsModel> get lastSearchedParamList => _searchParamsBoxService.searchedParamList;

  SearchParamsModel? get _lastSearchParams => lastSearchedParamList.isNotEmpty ? lastSearchedParamList.last : null;

  ///
  /// Methods
  ///
  Future<void> updateSearchParams(SearchParamsModel searchParams) async {
    final SearchParamsModel newSearchParam = _searchParamsReactive.value.copyWith(
      amount: searchParams.amount,
      expiry: searchParams.expiry,
      loanType: searchParams.loanType,
      savedTime: DateTime.now().toUtc(),
      id: const Uuid().v4(),
    );

    await _searchParamsBoxService.addNewSearchParam(newSearchParam);

    _searchParamsReactive.value = newSearchParam;

    notifyListeners();
  }

  Future<void> deleteSearchParams(SearchParamsModel searchParams) async {
    await _searchParamsBoxService.deleteSearchParamById(searchParams.id);

    notifyListeners();
  }

  Future<void> deleteAllSearchParams() async {
    await _searchParamsBoxService.clearBox();

    notifyListeners();
  }

  DateTime get _veryOldDate => DateTime(1900);
}
