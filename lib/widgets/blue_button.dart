import 'package:flutter/material.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({
    Key? key,
    required this.textButton,
    required this.onPressed,
  }) : super(key: key);

  final String textButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 2,
      highlightElevation: 5,
      color: Colors.blue,
      shape: const StadiumBorder(),
      onPressed: onPressed,
      child: SizedBox(
        width: double.maxFinite,
        height: 40,
        child: Center(
          child: Text(
            textButton,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
