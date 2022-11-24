import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'App.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: new MediaQueryData.fromWindow(ui.window),
      child: new Directionality(
          textDirection: TextDirection.ltr, child: new MyApp()),
    );
  }
}
