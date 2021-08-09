library feature_country_impl;

import 'package:feature_country_api/feature_country_api.dart';
import 'package:feature_country_impl/src/repository/country_repository.dart';
import 'package:localization_api/localization_api.dart';

import 'src/screen/factory/choose_country_screen_factory.dart';

class CountryFeatureApi implements ICountryFeatureApi {
  CountryFeatureApi({required CountryFeatureDependencies dependencies})
      : _dependencies = dependencies;

  final CountryFeatureDependencies _dependencies;

  ChooseCountryScreenFactory? _chooseCountryScreenFactory;
  CountryRepository? _countryRepository;

  @override
  IChooseCountryScreenFactory get chooseCountryScreenFactory =>
      _chooseCountryScreenFactory ??= ChooseCountryScreenFactory(
        dependencies: _dependencies,
      );

  @override
  ICountryRepository get countryRepository =>
      _countryRepository ??= const CountryRepository();
}

class CountryFeatureDependencies {
  CountryFeatureDependencies({required this.localizationManager});

  final ILocalizationManager localizationManager;
}
