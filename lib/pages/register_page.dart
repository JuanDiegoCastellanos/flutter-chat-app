import 'package:chat_socket_mongodb/helpers/mostrar_alerta.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chat_socket_mongodb/services/auth_service.dart';
import 'package:chat_socket_mongodb/widgets/blue_button.dart';
import 'package:chat_socket_mongodb/widgets/custom_input.dart';
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
            //height: MediaQuery.of(context).size.height * 0.9,
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
    final authService = Provider.of<AuthService>(context);

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
              textButton: 'Crear cuenta',
              onPressed: authService.autenticando
                  ? null
                  : () async {
                      print(emailCtrl.text);
                      print(passwordCtrl.text);
                      print(nameCtrl.text);
                      final registroOk = await authService.register(
                          nameCtrl.text.trim(),
                          emailCtrl.text.trim(),
                          passwordCtrl.text.trim());

                      if (registroOk == true) {
                        Navigator.pushReplacementNamed(context, 'usuarios');
                      } else {
                        mostrarAlerta(
                            context, 'Registro incorrecto', registroOk);
                      }
                    })
        ],
      ),
    );
  }
}
