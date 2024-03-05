// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../core/platform/network_info.dart' as _i7;
import '../core/services/mock_reader_service.dart' as _i6;
import '../data/repositories/offer_repository/data_sources/offer_http_repository.dart'
    as _i4;
import '../data/repositories/offer_repository/data_sources/offer_mock_repository.dart'
    as _i5;
import '../data/repositories/offer_repository/offer_repository.dart' as _i9;
import '../domain/repositories/offer_repository/data_sources/ilocal_repository.dart'
    as _i10;
import '../domain/repositories/offer_repository/data_sources/iremote_repository.dart'
    as _i3;
import '../domain/repositories/offer_repository/i_offer_repository.dart' as _i8;

const String _real = 'real';
const String _mock = 'mock';

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.IOfferRemoteRepository>(
    () => _i4.OfferHttpRepository(),
    registerFor: {_real},
  );
  gh.lazySingleton<_i3.IOfferRemoteRepository>(
    () => _i5.OfferMockRepository(),
    registerFor: {_mock},
  );
  gh.lazySingleton<_i6.MockReaderService>(() => _i6.MockReaderService());
  gh.lazySingleton<_i7.NetworkInfo>(() => _i7.NetworkInfoImpl());
  gh.lazySingleton<_i8.IOfferRepository>(() => _i9.OfferRepository(
        remoteDataSource: gh<_i3.IOfferRemoteRepository>(),
        localDataSource: gh<_i10.IOfferLocalRepository>(),
        networkInfo: gh<_i7.NetworkInfo>(),
      ));
  return getIt;
}
