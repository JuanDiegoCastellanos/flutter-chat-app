import 'package:chat_socket_mongodb/pages/login_page.dart';
import 'package:chat_socket_mongodb/pages/usuarios_page.dart';
import 'package:chat_socket_mongodb/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return const Center(
            child: Text('Espere...'),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);

    final autenticado = await authService.isLogIn();

    if (autenticado == true) {
      // conectar al sokcet
      // Navigator.pushReplacementNamed(context, 'usuarios');
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (
            _,
            __,
            ___,
          ) =>
                  UsuariosPage()));
    } else {
      // Navigator.pushReplacementNamed(context, 'login');
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (
            _,
            __,
            ___,
          ) =>
                  LoginPage()));
    }
  }
}
