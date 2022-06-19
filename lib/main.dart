import 'package:flutter/material.dart';

import 'package:chat_socket_mongodb/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      initialRoute: 'usuarios',
      routes: appRoutes,
    );
  }
}
