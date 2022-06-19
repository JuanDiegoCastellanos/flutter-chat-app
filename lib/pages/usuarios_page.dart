import 'package:flutter/material.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat_socket_mongodb/models/usuario.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final usuarios = [
    Usuario(
        uid: '1',
        email: 'juan.castellanosj@gmail.com',
        nombre: 'Juan Diego Castellanos',
        online: true),
    Usuario(
        uid: '2',
        email: 'test@test.com',
        nombre: 'Test test testico',
        online: false),
    Usuario(
        uid: '3',
        email: 'desarrollador@desarrollador.com',
        nombre: 'Desarrollador desarrollo',
        online: true),
    Usuario(
        uid: '4',
        email: 'flutter@flutter.com',
        nombre: 'flutter flutter-life',
        online: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Mi Nombre',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.exit_to_app, color: Colors.black),
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 10),
            //  Icon(Icons.check_cicle, color: Colors.green),
            child: Icon(Icons.offline_bolt, color: Colors.redAccent[700]),
          ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(
          refresh: const CircularProgressIndicator(
            color: Colors.lightGreen,
            strokeWidth: 1.5,
          ),
          complete: const Icon(
            Icons.check,
            color: Colors.lightGreen,
          ),
          waterDropColor: Colors.lightGreen.shade400,
        ),
        onRefresh: _cargarUsuarios,
        child: _listViewUsuarios(),
      ),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
      separatorBuilder: (_, i) => const Divider(),
      itemCount: usuarios.length,
    );
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
      leading: CircleAvatar(
        //usuarios[i].nombre.substring(0,2)
        backgroundColor: Colors.lightBlue[300],
        //usuarios[i].nombre.substring(0,2)
        child: Text(usuario.nombre[0],
            style: const TextStyle(color: Colors.black)),
      ),
      title: Text(
        usuario.nombre,
      ),
      subtitle: Text(usuario.email),
      trailing: Container(
        child: usuario.online
            ? Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const <Widget>[
                  Text(
                    'online',
                    style: TextStyle(
                        color: Colors.lightGreen,
                        fontSize: 10,
                        fontStyle: FontStyle.italic),
                  ),
                  Icon(
                    Icons.check_circle,
                    color: Colors.lightGreen,
                    size: 10,
                  )
                ],
              )
            : Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const <Widget>[
                  Text(
                    'offline',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                        fontStyle: FontStyle.italic),
                  ),
                  Icon(
                    Icons.do_not_disturb_alt,
                    color: Colors.red,
                    size: 10,
                  )
                ],
              ),
      ),
    );
  }

  _cargarUsuarios() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }
}
