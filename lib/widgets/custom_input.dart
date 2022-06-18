import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  const CustomInput(
      {Key? key,
      required this.icon,
      required this.placeHolder,
      required this.textController,
      this.keyboardType = TextInputType.text,
      this.isPassword = false})
      : super(key: key);

  final IconData icon;
  final String placeHolder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 10),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: const Color(0xff1b4965).withOpacity(0.05),
              offset: const Offset(0, 5),
            )
          ]),
      child: TextField(
        obscureText: isPassword,
        controller: textController,
        autocorrect: false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: placeHolder),
      ),
    );
  }
}
