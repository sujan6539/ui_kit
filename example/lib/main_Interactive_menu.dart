import 'package:flutter/material.dart';
import 'package:ui_kit/interactive_menu.dart';

void main() {
  runApp(const InteractiveMenuMain());
}

class InteractiveMenuMain extends StatelessWidget {
  const InteractiveMenuMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: InteractiveMenu(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.phone,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share,
                    color: Colors.black,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
