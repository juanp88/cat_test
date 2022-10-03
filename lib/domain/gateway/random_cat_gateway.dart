import 'package:dartz/dartz.dart';

abstract class CatGateway {
  Future<Either<Error, String>> getRandomCat();
}
