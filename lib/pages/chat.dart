import 'package:flutter/material.dart';
import 'package:lesson3/pages/components/inputmessage.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){

            },
            icon: Icon(Icons.water_damage)
        ),
        centerTitle: true,
        title: Text("Общий чат"),
      ),
      body: Bodychat(),
    );
  }
}
