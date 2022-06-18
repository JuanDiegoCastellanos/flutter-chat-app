import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
  const Labels({Key? key, required this.route, required this.mensajes})
      : super(key: key);
  final List<String> mensajes;
  final String route;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(children: <Widget>[
          Text(
            mensajes[0],
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Text(
              mensajes[1],
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, route);
            },
          ),
          const Text(
            'Términos y condiciones de uso',
            style: TextStyle(fontWeight: FontWeight.w200),
          )
        ]),
      ),
    );
  }
}
