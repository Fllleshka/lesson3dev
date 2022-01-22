import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// Инициализация firebase
void initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyACKi9BpgezG19ldzTIY5nB1GHYrtWO_dc",
      appId: "1:422545292955:web:fa2084bdc64c2e2e4ed03e",
      messagingSenderId: "422545292955",
      projectId: "lesson-3-ece36",
      authDomain: "lesson-3-ece36.firebaseapp.com",
      storageBucket: "lesson-3-ece36.appspot.com",
      measurementId: "G-6SCB9NHSE2"
    ),
  );

}

// Добавление новых данных в farebase
void addinfo(username, lastname, firstname, phone){
  print("Username: " + username);
  print("Lastname: " + lastname);
  print("Firstname: " + firstname);
  print("Phone: " + phone);
  //initFirebase();
  FirebaseFirestore.instance.collection('items').add({
    'username': username,
    'lastname': lastname,
    'firstname': firstname,
    'phone': phone
  });
}

// Удаление данных в farebase
void deleteinfo(username, lastname, firstname, phone){
  print("Username: " + username);
  print("Lastname: " + lastname);
  print("Firstname: " + firstname);
  print("Phone: " + phone);
  initFirebase();
  FirebaseFirestore.instance.collection('items').doc();
}

// Тестовый выод данных
void output(text){
  print(text);
}