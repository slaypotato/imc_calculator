import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData? icon;
  final void Function() onPressed;

  const RoundIconButton({Key? key, required this.icon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton (
      onPressed: onPressed,
      child: Icon(icon),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(56, 56),
        primary: const Color(0xFF4C4F5E),
        shape: const CircleBorder(),
        elevation: 6.0,
      ),
    );
  }
}