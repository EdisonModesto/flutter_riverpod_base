import '../utils/config.dart';

/// The class `BasePaths` contains static constants for various asset paths and URLs.
class BasePaths {
  static const baseImagePath = "assets/images";
  static const baseAnimationPath = "assets/animations";
  static const basePlaceholderPath = "assets/placeholders";
  static const baseVideoPath = "assets/videos";
  static const baseSoundPath = "assets/sounds";
  static const baseOtherPath = "assets/others";

  static const baseProdUrl = "http://productionURL.com";
  static const baseTestUrl = "https://dummyjson.com";
  static const baseUrl = AppConfig.devMode ? baseTestUrl : baseProdUrl;
}
