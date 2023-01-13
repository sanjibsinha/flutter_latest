class Text {
  String? text;
  TextStyle? style;
  Text(this.text, {this.style});
}

class TextStyle {
  double? fontSize;
  TextStyle({this.fontSize});
}

main() {
  TextStyle size = TextStyle(fontSize: 30.0);
  Text iAmTextWithStyle = Text(
    'I am Text',
    style: size,
  );

  print('${iAmTextWithStyle.text} with size ${size.fontSize}');
}

/**
 * Connecting to VM Service at ws://127.0.0.1:41687/yomntXxSybU=/ws
flutter: I am Text with size 30.0
 */
