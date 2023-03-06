// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_meridian_group_app/core/factory/view_model_factory.dart'
    as _i5;
import 'package:flutter_meridian_group_app/views/list_movies/view_model/list_movies_view_model.dart'
    as _i3;
import 'package:flutter_meridian_group_app/views/splash/view_model/splash_view_model.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart'
    as _i2; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.ListMoviesViewModel>(() => _i3.ListMoviesViewModel());
    gh.factory<_i4.SplashViewModel>(() => _i4.SplashViewModel());
    gh.singleton<_i5.ViewModelFactory>(_i5.ViewModelFactoryImpl());
    return this;
  }
}
