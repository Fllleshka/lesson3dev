import 'package:flutter/material.dart';

class DeleteCont extends StatefulWidget {
  const DeleteCont({Key? key}) : super(key: key);

  @override
  _DeleteContState createState() => _DeleteContState();
}

class _DeleteContState extends State<DeleteCont> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Delete contact"),
      ),
    );
  }
}
