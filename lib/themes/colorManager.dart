import 'abstractTheme.dart';

enum MYTHEME { DARK, LIGHT }

class ColorManager {
  static DarkTheme _dark = new DarkTheme();
  static LightTheme _light = new LightTheme();
  static MYTHEME mYTHEME = MYTHEME.DARK;
  static final ColorManager _instance = ColorManager._internal();
  AbstractTheme theme;

  factory ColorManager() {
    switch (ColorManager.mYTHEME) {
      case MYTHEME.DARK:
        _instance.theme = _dark;
        break;
      case MYTHEME.LIGHT:
        _instance.theme = _light;
        break;
      default:
    }
    return _instance;
  }
  ColorManager._internal();
}
