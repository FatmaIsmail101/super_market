// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/login/data/login_data_source/login_data_source.dart'
    as _i85;
import '../../features/auth/login/data/login_data_source/login_data_source_impl.dart'
    as _i592;
import '../../features/auth/login/data/repositroy/login_repository_impl.dart'
    as _i580;
import '../../features/auth/login/domain/login_usecase/login_usecase.dart'
    as _i44;
import '../../features/auth/login/domain/repository/login_repositroy.dart'
    as _i347;
import '../../features/auth/login/presentation/bloc/login_bloc.dart' as _i885;
import '../../features/auth/sign_up/data/data_source/sign_up_data_source.dart'
    as _i811;
import '../../features/auth/sign_up/data/data_source/sign_up_data_source_impl.dart'
    as _i833;
import '../../features/auth/sign_up/data/sign_up_repository_impl/sign_up_repository_impl.dart'
    as _i826;
import '../../features/auth/sign_up/domain/repository/sign_up_repository.dart'
    as _i988;
import '../../features/auth/sign_up/domain/sign_up_usecase/sign_up_usecase.dart'
    as _i232;
import '../../features/auth/sign_up/presentation/bloc/sign_up_bloc.dart'
    as _i130;
import '../networking/ecommerce_client.dart' as _i406;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.factory<_i361.Dio>(() => dioModule.dio);
    gh.factory<_i811.SignUpDS>(() => _i833.SignUpDSImpl());
    gh.lazySingleton<_i406.EcommerceClient>(
        () => dioModule.provideCommerceClient(gh<_i361.Dio>()));
    gh.factory<_i85.LoginDataSource>(() => _i592.LoginDSImpl());
    gh.factory<_i988.SignUpRepository>(
        () => _i826.SignUpRepositoryImpl(gh<_i811.SignUpDS>()));
    gh.factory<_i347.LoginRepository>(
        () => _i580.LoginRepositroyImpl(gh<_i85.LoginDataSource>()));
    gh.factory<_i44.LoginUseCase>(
        () => _i44.LoginUseCase(gh<_i347.LoginRepository>()));
    gh.factory<_i232.SignUpUseCase>(
        () => _i232.SignUpUseCase(gh<_i988.SignUpRepository>()));
    gh.factory<_i885.LoginBloc>(() => _i885.LoginBloc(gh<_i44.LoginUseCase>()));
    gh.factory<_i130.SignUpBloc>(
        () => _i130.SignUpBloc(gh<_i232.SignUpUseCase>()));
    return this;
  }
}

class _$DioModule extends _i406.DioModule {}
