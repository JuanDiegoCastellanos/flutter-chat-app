import 'package:flutter/material.dart';

import 'package:chat_socket_mongodb/pages/chat_page.dart';
import 'package:chat_socket_mongodb/pages/loading_page.dart';
import 'package:chat_socket_mongodb/pages/login_page.dart';
import 'package:chat_socket_mongodb/pages/register_page.dart';
import 'package:chat_socket_mongodb/pages/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (_) => const UsuariosPage(),
  'chat': (_) => const ChatPage(),
  'login': (_) => const LoginPage(),
  'register': (_) => const RegisterPage(),
  'loading': (_) => const LoadingPage(),
};
