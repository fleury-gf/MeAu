import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meau/screens/intro_screen.dart';
import 'package:meau/screens/register_screen.dart';
import 'package:meau/widgets/main_title.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RegisterScreen();
  }
}
