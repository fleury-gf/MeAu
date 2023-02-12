import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:meau/widgets/custom_drawer.dart';
import 'dart:async';
import '../screens/login_screen.dart';

class ScreenTemplate extends StatefulWidget {
  const ScreenTemplate({super.key, this.title = "", required this.children});
  final String title;
  final List<Widget> children;

  @override
  State<ScreenTemplate> createState() => _ScreenTemplateState();
}

class _ScreenTemplateState extends State<ScreenTemplate> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(seconds: 5), (Timer t) => AdoptionNotification(context));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      drawer: CustomDrawer(),
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: widget.children,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
