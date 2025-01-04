// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../common/navigation/navigation_service.dart' as _i5;
import '../src/module/authentication/data/repository/authentication_repository_impl.dart'
    as _i4;
import '../src/module/authentication/domain/service/authentication_repository.dart'
    as _i3;
import '../src/module/authentication/presentation/sign_in/controller/sign_in_controller.dart'
    as _i6;
import '../src/module/authentication/presentation/sign_up/controller/sign_up_controller.dart'
    as _i7;

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
  gh.lazySingleton<_i3.AuthenticationRepository>(
      () => _i4.AuthenticationRepositoryImpl());
  gh.lazySingleton<_i5.NavigationService>(() => _i5.NavigationServiceImpl());
  gh.factory<_i6.SignInController>(() => _i6.SignInController(
        gh<_i5.NavigationService>(),
        gh<_i3.AuthenticationRepository>(),
      ));
  gh.factory<_i7.SignUpController>(() => _i7.SignUpController(
        gh<_i5.NavigationService>(),
        gh<_i3.AuthenticationRepository>(),
      ));
  return getIt;
}
