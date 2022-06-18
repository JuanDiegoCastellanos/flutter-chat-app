import 'package:chat_socket_mongodb/widgets/blue_button.dart';
import 'package:chat_socket_mongodb/widgets/custom_input.dart';
import 'package:flutter/material.dart';

import '../widgets/labels.dart';
import '../widgets/logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffccdbfd),
      body: SafeArea(
        child: SingleChildScrollView(
          //efecto como de rebote
          physics: const BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Logo(titulo: 'Register'),
                _Form(),
                Labels(
                    route: 'login',
                    mensajes: <String>['Ya tienes cuenta?', 'Ingresa acá']),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.mail_outline,
            placeHolder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeHolder: 'Password',
            isPassword: true,
            textController: passwordCtrl,
          ),
          CustomInput(
            icon: Icons.supervised_user_circle,
            placeHolder: 'Nombre',
            textController: nameCtrl,
          ),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(elevation: 2,),
          //   onPressed: () {},
          //   child: const Text('Press here'),
          // ),
          BlueButton(
              textButton: 'Ingresar',
              onPressed: () {
                debugPrint(emailCtrl.text + passwordCtrl.text);
              })
        ],
      ),
    );
  }
}
