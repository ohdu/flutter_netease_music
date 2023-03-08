import 'dart:io';

class Util {
  static bool isPhone() =>
      Platform.isIOS || Platform.isAndroid || Platform.isFuchsia;
}
