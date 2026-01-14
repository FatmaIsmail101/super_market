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
import '../../features/navigation_layout/tabs/categories/data/data_source/get_all_cat_ds.dart'
    as _i1014;
import '../../features/navigation_layout/tabs/categories/data/data_source/get_all_cat_ds_impl.dart'
    as _i381;
import '../../features/navigation_layout/tabs/categories/data/data_source/spacific_product/spacific_product_ds.dart'
    as _i661;
import '../../features/navigation_layout/tabs/categories/data/data_source/subcat_ds/subcat_ds.dart'
    as _i140;
import '../../features/navigation_layout/tabs/categories/data/data_source/subcat_ds/subcat_ds_impl.dart'
    as _i640;
import '../../features/navigation_layout/tabs/categories/data/repo/get_all_cat_repo_impl.dart'
    as _i355;
import '../../features/navigation_layout/tabs/categories/data/repo/get_spacific_product_repo/get_spacific_product_repo.dart'
    as _i29;
import '../../features/navigation_layout/tabs/categories/data/repo/subcat_repo/subcat_repo_impl.dart'
    as _i418;
import '../../features/navigation_layout/tabs/categories/domain/repo/get_all_cat_repo.dart'
    as _i502;
import '../../features/navigation_layout/tabs/categories/domain/repo/get_product_repo/get_product_repo.dart'
    as _i801;
import '../../features/navigation_layout/tabs/categories/domain/repo/subcat_repo/subcat_repo.dart'
    as _i703;
import '../../features/navigation_layout/tabs/categories/domain/usecase/get_all_cat_usecase.dart'
    as _i500;
import '../../features/navigation_layout/tabs/categories/domain/usecase/spacific_product_usecse/spacific_product_usecase.dart'
    as _i351;
import '../../features/navigation_layout/tabs/categories/domain/usecase/subcat_usecase/subcat_usecase.dart'
    as _i391;
import '../../features/navigation_layout/tabs/categories/presentation/bloc/get_all_categories_bloc.dart'
    as _i257;
import '../../features/navigation_layout/tabs/categories/presentation/bloc/spacific_product/spacific_product_bloc.dart'
    as _i805;
import '../../features/navigation_layout/tabs/home/data/data_source/get_all_products_data_source.dart'
    as _i276;
import '../../features/navigation_layout/tabs/home/data/data_source/get_all_products_data_source_impl.dart'
    as _i889;
import '../../features/navigation_layout/tabs/home/data/repo/get_all_products_repo_impl.dart'
    as _i1056;
import '../../features/navigation_layout/tabs/home/domain/repo/get_all_products_repo.dart'
    as _i691;
import '../../features/navigation_layout/tabs/home/domain/usecase/get_all_products_usecase.dart'
    as _i120;
import '../../features/navigation_layout/tabs/home/presentation/bloc/get_all_products_bloc.dart'
    as _i118;
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
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.factory<_i1014.GetAllCategoriesDs>(() => _i381.GetAllCategoriesDsImpl());
    gh.factory<_i811.SignUpDS>(() => _i833.SignUpDSImpl());
    gh.factory<_i573.VerifyEmailDS>(() => _i84.VerifyEmailDSImpl());
    gh.factory<_i661.SpacificProductDs>(() => _i661.SpacificProductDsImpl());
    gh.singleton<_i406.EcommerceClient>(
        () => dioModule.provideCommerceClient(gh<_i361.Dio>()));
    gh.factory<_i90.UpdatePasswordDs>(() => _i955.UpdatePasswordDSImpl());
    gh.factory<_i276.GetAllProductsDataSource>(
        () => _i889.GetAllProductsDataSourceImpl());
    gh.factory<_i557.ResetCodeDS>(() => _i196.ResetCodeDSImpl());
    gh.factory<_i85.LoginDataSource>(() => _i592.LoginDSImpl());
    gh.factory<_i140.SubcatDs>(() => _i640.SubcatDsImpl());
    gh.factory<_i70.UpdatePasswordRepository>(
        () => _i656.UpdatePasswordRepositoryImpl(gh<_i90.UpdatePasswordDs>()));
    gh.factory<_i502.GetAllCategoriesRepo>(
        () => _i355.GetAllCategoriesRepoImpl(gh<_i1014.GetAllCategoriesDs>()));
    gh.factory<_i415.VerifyEmailRepository>(
        () => _i183.VerifyEmailRepositoryImpl(gh<_i573.VerifyEmailDS>()));
    gh.factory<_i988.SignUpRepository>(
        () => _i826.SignUpRepositoryImpl(gh<_i811.SignUpDS>()));
    gh.factory<_i347.LoginRepository>(
        () => _i580.LoginRepositroyImpl(gh<_i85.LoginDataSource>()));
    gh.factory<_i691.GetAllProductsRepo>(() =>
        _i1056.GetAllProductsRepoImpl(gh<_i276.GetAllProductsDataSource>()));
    gh.factory<_i725.UpdatePasswordUsecase>(
        () => _i725.UpdatePasswordUsecase(gh<_i70.UpdatePasswordRepository>()));
    gh.factory<_i801.GetProductRepo>(
        () => _i29.GetSpacificProductRepo(gh<_i661.SpacificProductDs>()));
    gh.factory<_i105.VerifyEmailUsecas>(
        () => _i105.VerifyEmailUsecas(gh<_i415.VerifyEmailRepository>()));
    gh.factory<_i703.SubcatRepo>(
        () => _i418.SubcatRepoImpl(gh<_i140.SubcatDs>()));
    gh.factory<_i44.LoginUseCase>(
        () => _i44.LoginUseCase(gh<_i347.LoginRepository>()));
    gh.factory<_i711.ResetCodeRepo>(
        () => _i907.ResetCodeRepositoryImpl(gh<_i557.ResetCodeDS>()));
    gh.factory<_i232.SignUpUseCase>(
        () => _i232.SignUpUseCase(gh<_i988.SignUpRepository>()));
    gh.factory<_i500.GetAllCategoriesUsecase>(
        () => _i500.GetAllCategoriesUsecase(gh<_i502.GetAllCategoriesRepo>()));
    gh.factory<_i120.GetAllProductsUsecase>(
        () => _i120.GetAllProductsUsecase(gh<_i691.GetAllProductsRepo>()));
    gh.factory<_i351.SpacificProductUsecase>(
        () => _i351.SpacificProductUsecase(gh<_i801.GetProductRepo>()));
    gh.factory<_i805.SpacificProductBloc>(
        () => _i805.SpacificProductBloc(gh<_i351.SpacificProductUsecase>()));
    gh.factory<_i118.GetAllProductsBloc>(
        () => _i118.GetAllProductsBloc(gh<_i120.GetAllProductsUsecase>()));
    gh.factory<_i885.LoginBloc>(() => _i885.LoginBloc(gh<_i44.LoginUseCase>()));
    gh.factory<_i130.SignUpBloc>(
        () => _i130.SignUpBloc(gh<_i232.SignUpUseCase>()));
    gh.factory<_i561.ResetCodeUseCase>(
        () => _i561.ResetCodeUseCase(gh<_i711.ResetCodeRepo>()));
    gh.factory<_i391.SubcatUsecase>(
        () => _i391.SubcatUsecase(gh<_i703.SubcatRepo>()));
    gh.factory<_i257.GetAllCategoriesBloc>(() => _i257.GetAllCategoriesBloc(
          gh<_i500.GetAllCategoriesUsecase>(),
          gh<_i391.SubcatUsecase>(),
        ));
    gh.factory<_i1028.ForgetPasswordBloc>(() => _i1028.ForgetPasswordBloc(
          gh<_i105.VerifyEmailUsecas>(),
          gh<_i561.ResetCodeUseCase>(),
          gh<_i725.UpdatePasswordUsecase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i406.DioModule {}
