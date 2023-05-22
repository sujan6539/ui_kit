import 'package:flutter/material.dart';
import 'package:ui_kit/interactive_switcher.dart';

void main() {
  runApp(const InteractiveSwitcherMain());
}

class InteractiveSwitcherMain extends StatelessWidget {
  const InteractiveSwitcherMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Scaffold(
        body: SafeArea(
          child: SizedBox(height: 150, width: 220, child: FittedBox(fit: BoxFit.fill, child: InteractiveSwitcher()))
        ),
      ),
    );
  }
}
