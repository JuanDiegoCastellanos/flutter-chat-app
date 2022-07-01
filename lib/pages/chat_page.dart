import 'package:chat_socket_mongodb/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  final List<ChatMessage> _messages = <ChatMessage>[
    // const ChatMessage(text: 'Cómo estás?', uid: '12'),
    // const ChatMessage(text: 'Donde estás?', uid: '123'),
    // const ChatMessage(text: 'Hoy toca full flutter', uid: '123'),
    // const ChatMessage(text: 'Hoy sjkasjflkjas', uid: '123'),
    // const ChatMessage(text: 'Hoy toca ', uid: '13'),
    // const ChatMessage(text: 'Hoy toca full ', uid: '123'),
  ];

  bool _itIsWriting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        title: Column(
          children: const <Widget>[
            CircleAvatar(
              maxRadius: 12,
              backgroundColor: Colors.blueAccent,
              child: Text(
                'Te',
                style: TextStyle(fontSize: 12),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              'Test Testecito',
              style: TextStyle(color: Colors.black, fontSize: 12),
            )
          ],
        ),
      ),
      body: SizedBox(
        child: Column(children: <Widget>[
          Flexible(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: _messages.length,
              itemBuilder: (_, index) => _messages[index],
              reverse: true,
            ),
          ),
          const Divider(height: 1, color: Colors.lightBlue),
          Container(
            color: Colors.white,
            child: _inputChat(),
          ),
        ]),
      ),
    );
  }

  Widget _inputChat() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                autocorrect: false,
                controller: _textController,
                onSubmitted: _handleSubmit,
                onChanged: (String text) {
                  // Cuando hay un valor, para poder enviar el msj
                  setState(() {
                    if (text.trim().isNotEmpty) {
                      _itIsWriting = true;
                    } else {
                      _itIsWriting = false;
                    }
                  });
                },
                focusNode: _focusNode,
                decoration:
                    const InputDecoration.collapsed(hintText: 'Message'),
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: /*Platform.isIOS
                    ? CupertinoButton(
                        child: Icon(Icons.send_rounded),
                        onPressed: () {},
                      )
                    : */
                    Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconTheme(
                    data: IconThemeData(color: Colors.blue[400]),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: const Icon(
                        Icons.send_rounded,
                      ),
                      onPressed: _itIsWriting
                          ? () => _handleSubmit(_textController.text.trim())
                          : null,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  _handleSubmit(String text) {
    if (text.isEmpty) return;
    debugPrint(text);
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(
      text: text,
      uid: '123',
      animationController: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 400)),
    );
    _messages.insert(0, newMessage);
    newMessage.animationController.forward();

    setState(() {
      _itIsWriting = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //Off del socket
    _messages.forEach((ChatMessage message) {
      message.animationController.dispose();
    });
    super.dispose();
  }
}
