// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../Features/home/data/data_sources/home_local_data_source.dart'
    as _i151;
import '../../Features/home/data/data_sources/home_local_data_source_impl.dart'
    as _i402;
import '../../Features/home/data/data_sources/home_remote_data_source.dart'
    as _i173;
import '../../Features/home/data/data_sources/home_remote_data_source_impl.dart'
    as _i682;
import '../../Features/home/data/repositories/home_repo_impl.dart' as _i198;
import '../../Features/home/domain/repositories/home_repo.dart' as _i143;
import '../../Features/home/domain/use_cases/fetch_featured_books_use_case.dart'
    as _i315;
import '../../Features/home/domain/use_cases/fetch_newest_books_use_case.dart'
    as _i996;
import '../../Features/home/presentation/maneger/fetch_featured_books/featured_books_cubit.dart'
    as _i784;
import '../../Features/home/presentation/maneger/fetch_newest_books/newest_books_cubit.dart'
    as _i271;
import '../../Features/Network/api_client/api_client.dart' as _i287;
import '../cashe/shared_pref_utils.dart' as _i119;
import '../utils/api_server.dart' as _i719;
import 'git_it_module.dart' as _i710;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final gitItModule = _$GitItModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => gitItModule.prefs,
      preResolve: true,
    );
    gh.singleton<_i895.Connectivity>(() => gitItModule.creatConnectivity());
    gh.singleton<_i361.Dio>(() => gitItModule.createDio());
    gh.lazySingleton<_i119.SharedPrefUtils>(
      () => _i119.SharedPrefUtils(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i719.ApiServer>(() => _i719.ApiServer(dio: gh<_i361.Dio>()));
    gh.factory<_i151.HomeLocalDataSource>(
      () => _i402.HomeLocalDataSourceImpl(gh<_i119.SharedPrefUtils>()),
    );
    gh.factory<_i287.ApiClient>(() => _i287.ApiClient(gh<_i719.ApiServer>()));
    gh.factory<_i173.HomeRemoteDataSource>(
      () => _i682.HomeRemoteDataSourceImpl(gh<_i287.ApiClient>()),
    );
    gh.factory<_i143.HomeRepo>(
      () => _i198.HomeRepoImpl(
        gh<_i173.HomeRemoteDataSource>(),
        gh<_i151.HomeLocalDataSource>(),
      ),
    );
    gh.factory<_i315.FetchFeaturedBooksUseCase>(
      () => _i315.FetchFeaturedBooksUseCase(gh<_i143.HomeRepo>()),
    );
    gh.factory<_i996.FetchNewestBooksUseCase>(
      () => _i996.FetchNewestBooksUseCase(gh<_i143.HomeRepo>()),
    );
    gh.factory<_i271.NewestBooksCubit>(
      () => _i271.NewestBooksCubit(gh<_i996.FetchNewestBooksUseCase>()),
    );
    gh.factory<_i784.FeaturedBooksCubit>(
      () => _i784.FeaturedBooksCubit(gh<_i315.FetchFeaturedBooksUseCase>()),
    );
    return this;
  }
}

class _$GitItModule extends _i710.GitItModule {}
