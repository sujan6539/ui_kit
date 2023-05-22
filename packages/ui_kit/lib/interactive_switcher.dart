import 'package:flutter/material.dart';

class InteractiveSwitcher extends StatefulWidget {
  const InteractiveSwitcher({Key? key}) : super(key: key);

  @override
  State<InteractiveSwitcher> createState() => _InteractiveSwitcherState();
}

class _InteractiveSwitcherState extends State<InteractiveSwitcher> {
  bool switchState = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: switchState,
      onChanged: (bool value) {
        setState(() {
          switchState = !switchState;
        });
      },
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (switchState) {
          return Colors.green;
        } else {
          return Colors.red;
        }
      }),
      activeColor: Colors.green,
      activeTrackColor: Colors.green,
      inactiveThumbColor: Colors.red,
      inactiveTrackColor: Colors.red,
      trackOutlineColor: MaterialStateProperty.resolveWith((states) {
        return Colors.transparent;
      }),
      thumbIcon: MaterialStateProperty.resolveWith((states) {
        if (switchState) {
          return const Icon(
            Icons.lens_outlined,
            color: Colors.white,
            size: 10,
          );
        } else {
          return const Icon(Icons.adjust_outlined, color: Colors.white, size: 20);
        }
      }),
    );
  }
}
