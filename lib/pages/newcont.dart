import 'package:flutter/material.dart';

class AddNewCont extends StatefulWidget {
  const AddNewCont({Key? key}) : super(key: key);

  @override
  _AddNewContState createState() => _AddNewContState();
}

class _AddNewContState extends State<AddNewCont> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new contact"),
      ),
    );
  }
}
