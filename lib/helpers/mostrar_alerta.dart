import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

mostrarAlerta(BuildContext context, String titulo, String subtitulo) {
  /*showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text(titulo),
            content: Text(subtitulo),
            actions: <Widget>[
              MaterialButton(
                elevation: 5,
                child: Text('Ok'),
                textColor: Colors.blue,
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ));*/
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: Text(titulo),
      content: Text(subtitulo),
      actions: <Widget>[
        MaterialButton(
          onPressed: () => Navigator.pop(context),
          color: Colors.orange[900],
          elevation: 5,
          child: const Text('OK'),
        )
      ],
    ),
  );
}
