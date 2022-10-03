import 'package:cats_gif/domain/gateway/random_cat_gateway.dart';
import 'package:dartz/dartz.dart';

class GetRandomCatUseCase {
  final CatGateway _catGateway;
  GetRandomCatUseCase(this._catGateway);

  Future<Either<Error, String>> getRandomCat() async {
    return _catGateway.getRandomCat();
  }
}
