import 'package:flutter/material.dart';
import 'package:lesson3/services/services.dart';

class AddNewCont extends StatefulWidget {
  const AddNewCont({Key? key}) : super(key: key);

  @override
  _AddNewContState createState() => _AddNewContState();
}

class _AddNewContState extends State<AddNewCont> {
  static const _username = "Username";
  static const _lastname = "Фамилия";
  static const _firstname = "Имя";
  static const _phone = "Телефон";
  TextEditingController userNameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add new contact"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: userNameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: _username,
              ),
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please enter some ' + _username;
                }
                else
                  if (value.length < 6) {
                    return 'Please enter more than 6 characters';
                  }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: lastnameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: _lastname,
              ),
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please enter some ' + _lastname;
                }
                else
                if (value.length < 6) {
                  return 'Please enter more than 6 characters';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: firstnameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: _firstname,
              ),
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please enter some ' + _firstname;
                }
                else
                if (value.length < 6) {
                  return 'Please enter more than 6 characters';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              controller: phoneController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: _phone,
              ),
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please enter some ' + _phone;
                }
                else
                if (value.length < 6) {
                  return 'Please enter more than 6 characters';
                }
                return null;
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          // Левая кнопка сохранить
          Positioned(
            left: 30,
            bottom: 20,
            child: FloatingActionButton(
              onPressed: () {
                editinfo(userNameController.text, lastnameController.text, firstnameController.text, phoneController.text);
              },
              child: const Icon(
                Icons.save,
                size: 40,
              ),
            ),
          ),
          // Правая кнопка отмены
          Positioned(
            bottom: 20,
            right: 30,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
              },
              child: const Icon(
                Icons.cancel,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
