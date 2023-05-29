import 'package:flutter/widgets.dart';
import 'package:ventfit/presentation/bmi/bmi_page.dart';

class Routes {
  static const String bmiPath = "/";

  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {bmiPath: _bmiRoute()};
  }

  static _bmiRoute() {
    return (BuildContext context) => const BMIPage();
  }
}
