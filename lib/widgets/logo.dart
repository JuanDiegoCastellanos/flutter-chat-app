import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, required this.titulo}) : super(key: key);

  final String titulo;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Image(
              width: 150,
              image: AssetImage('assets/tag-logo.png'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              titulo,
              style: const TextStyle(
                  color: Color.fromARGB(255, 21, 101, 121),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
