import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

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
void deleteinfo(id){
  FirebaseFirestore.instance.collection('items').doc(id).delete();
}

// Тестовый вывод данных
void output(text){
  print(text);
}

// Генерация тестовых данных
void addtestdates(){
  var listusernames = ['Abhilasha', 'Kiryll1', 'Pular', 'Kenal', 'luliponis', 'Reven?nt', 'Grimmozzy', 'FEEL3', 'FLAVIYS', 'Kuroiyami'];
  var listlastnames = ['Лукина', 'Филатова', 'Потапова', 'Кузнецова', 'Ермаков', 'Иванов', 'Александров', 'Майорова', 'Лебедева', 'Макаров'];
  var listfirstnames = ['Анна', 'Елизавета', 'Варвара', 'Фатима', 'Марк', 'Владимир', 'Виктор', 'Ева', 'Алёна', 'Дмитрий'];
  var listphones = ['+7(913)836-39-86', '+7(913)995-71-70', '+7(913)540-12-74', '+7(913)540-12-74', '+7(913)717-79-42', '+7(913)486-56-70', '+7(913)113-48-86', '+7(913)059-69-50', '+7(913)784-72-76', '+7(913)532-20-34'];
  for(var i=0; i < 10; i++) {
    FirebaseFirestore.instance.collection('items').add({
      'username': listusernames[i],
      'lastname': listlastnames[i],
      'firstname': listfirstnames[i],
      'phone': listphones[i]
    });
  }
}

// Изменение существующих данных
void changedates(id, username, lastname, firstname, phone){
  print("Id: " + id);
  print("Username: " + username);
  print("Lastname: " + lastname);
  print("Firstname: " + firstname);
  print("Phone: " + phone);
  FirebaseFirestore.instance.collection('items').doc(id).update({
    'username': username,
    'lastname': lastname,
    'firstname': firstname,
    'phone': phone,
  });
}