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

import '../../features/auth/forget_password/data/data_source/reset_code/reset_code_ds.dart'
    as _i557;
import '../../features/auth/forget_password/data/data_source/reset_code/reset_code_ds_impl.dart'
    as _i196;
import '../../features/auth/forget_password/data/data_source/update_password/update_password_data_source.dart'
    as _i90;
import '../../features/auth/forget_password/data/data_source/update_password/update_password_ds_impl.dart'
    as _i955;
import '../../features/auth/forget_password/data/data_source/verify_email/verify_email_data_source.dart'
    as _i573;
import '../../features/auth/forget_password/data/data_source/verify_email/verify_email_ds_impl.dart'
    as _i84;
import '../../features/auth/forget_password/data/repository/reset_code_repo/reset_code_repositroy_impl.dart'
    as _i907;
import '../../features/auth/forget_password/data/repository/update_password_repo/update_password_repo_impl.dart'
    as _i656;
import '../../features/auth/forget_password/data/repository/verify_email/verify_email_repo_impl.dart'
    as _i183;
import '../../features/auth/forget_password/domain/repository/reset_code/reset_code_repo.dart'
    as _i711;
import '../../features/auth/forget_password/domain/repository/update_password_repo/update_password_repository.dart'
    as _i70;
import '../../features/auth/forget_password/domain/repository/verify_email/verify_email_repo.dart'
    as _i415;
import '../../features/auth/forget_password/domain/usecase/reset_code/reset_code_usecase.dart'
    as _i561;
import '../../features/auth/forget_password/domain/usecase/update_password_usecase/update_password_usecase.dart'
    as _i725;
import '../../features/auth/forget_password/domain/usecase/verify_email/verify_email_usecase.dart'
    as _i105;
import '../../features/auth/forget_password/presentation/bloc/forget_password_bloc.dart'
    as _i1028;
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
    gh.factory<_i573.VerifyEmailDS>(() => _i84.VerifyEmailDSImpl());
    gh.lazySingleton<_i406.EcommerceClient>(
        () => dioModule.provideCommerceClient(gh<_i361.Dio>()));
    gh.factory<_i90.UpdatePasswordDs>(() => _i955.UpdatePasswordDSImpl());
    gh.factory<_i557.ResetCodeDS>(() => _i196.ResetCodeDSImpl());
    gh.factory<_i85.LoginDataSource>(() => _i592.LoginDSImpl());
    gh.factory<_i70.UpdatePasswordRepository>(
        () => _i656.UpdatePasswordRepositoryImpl(gh<_i90.UpdatePasswordDs>()));
    gh.factory<_i415.VerifyEmailRepository>(
        () => _i183.VerifyEmailRepositoryImpl(gh<_i573.VerifyEmailDS>()));
    gh.factory<_i988.SignUpRepository>(
        () => _i826.SignUpRepositoryImpl(gh<_i811.SignUpDS>()));
    gh.factory<_i347.LoginRepository>(
        () => _i580.LoginRepositroyImpl(gh<_i85.LoginDataSource>()));
    gh.factory<_i725.UpdatePasswordUsecase>(
        () => _i725.UpdatePasswordUsecase(gh<_i70.UpdatePasswordRepository>()));
    gh.factory<_i105.VerifyEmailUsecas>(
        () => _i105.VerifyEmailUsecas(gh<_i415.VerifyEmailRepository>()));
    gh.factory<_i44.LoginUseCase>(
        () => _i44.LoginUseCase(gh<_i347.LoginRepository>()));
    gh.factory<_i711.ResetCodeRepo>(
        () => _i907.ResetCodeRepositoryImpl(gh<_i557.ResetCodeDS>()));
    gh.factory<_i232.SignUpUseCase>(
        () => _i232.SignUpUseCase(gh<_i988.SignUpRepository>()));
    gh.factory<_i885.LoginBloc>(() => _i885.LoginBloc(gh<_i44.LoginUseCase>()));
    gh.factory<_i130.SignUpBloc>(
        () => _i130.SignUpBloc(gh<_i232.SignUpUseCase>()));
    gh.factory<_i561.ResetCodeUseCase>(
        () => _i561.ResetCodeUseCase(gh<_i711.ResetCodeRepo>()));
    gh.factory<_i1028.ForgetPasswordBloc>(() => _i1028.ForgetPasswordBloc(
          gh<_i105.VerifyEmailUsecas>(),
          gh<_i561.ResetCodeUseCase>(),
          gh<_i725.UpdatePasswordUsecase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i406.DioModule {}
