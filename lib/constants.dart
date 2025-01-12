class Ui {
  Ui._();

  static const double actionBarHeight = 75.0;
  static const double padding = 8.0;
  static const double borderRadius = 8.0;
  static const double padding2 = padding * 2;
  static const double fontSize = 14.0;
  static const int animationDuration = 200;

  static double getPadding(double times) => padding * times;
  static double getRadius(double times) => borderRadius * times;
  static double getFontSize(double times) => fontSize * times;
}
