import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key, required this.titulo}) : super(key: key);

  final String titulo;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Image(
              image: AssetImage('assets/tag-logo.png'),
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
