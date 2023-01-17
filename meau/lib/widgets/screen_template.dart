import 'package:flutter/material.dart';
import 'package:meau/widgets/custom_drawer.dart';

class ScreenTemplate extends StatelessWidget {
  const ScreenTemplate({super.key, this.title = "", required this.children});
  final String title;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
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
                  children: children,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
