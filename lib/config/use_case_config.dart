import 'package:cats_gif/infraestructure/repository/random_cat_api.dart';

import '../domain/use_cases/get_random_cat.dart';

class UseCaseConfig {
  late GetRandomCatUseCase getRandomCatUseCase;
  late RandomCatApi _randomCatApi;

  UseCaseConfig() {
    _randomCatApi = RandomCatApi();
    getRandomCatUseCase = GetRandomCatUseCase(_randomCatApi);
  }
}
