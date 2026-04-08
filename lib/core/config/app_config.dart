import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor { dev, prod }

class FlavorConfig {
  final Flavor flavor;
  final String baseUrl;

  static late FlavorConfig _instance;

  FlavorConfig._internal(this.flavor, this.baseUrl);

  static void initialize({required Flavor flavor}) {
    final baseUrl = flavor == Flavor.dev
        ? dotenv.env['BASE_URL_DEV']
        : dotenv.env['BASE_URL_PROD'];

    if (baseUrl == null) {
      throw Exception("BASE_URL for $flavor not found in .env");
    }

    _instance = FlavorConfig._internal(flavor, baseUrl);
  }

  static FlavorConfig get instance => _instance;
}
