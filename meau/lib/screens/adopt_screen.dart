import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meau/api/pet_functions.dart';
import 'package:meau/widgets/screen_template.dart';

class AdoptScreen extends StatefulWidget {
  const AdoptScreen({super.key});

  @override
  State<AdoptScreen> createState() => _AdoptScreenState();
}

class _AdoptScreenState extends State<AdoptScreen> {
  @override
  Widget build(BuildContext context) {
    getAllPetsForAdoption();
    return ScreenTemplate(children: <Widget>[Text("opa")]);
  }
}
