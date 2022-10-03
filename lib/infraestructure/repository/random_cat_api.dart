import 'package:cats_gif/domain/gateway/random_cat_gateway.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:cats_gif/config/endpoints.dart' as api_config;

class RandomCatApi implements CatGateway {
  @override
  Future<Either<Error, String>> getRandomCat() async {
    final response =
        await http.get(Uri.parse(api_config.baseUrl + api_config.gifEndpoint));

    if (response.statusCode == 200) {
      var imageString = response.body;
      return Right<Error, String>(imageString);
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
      return Left<Error, String>(Error());
    }
  }
}
