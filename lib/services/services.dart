import 'dart:math';
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

// Генерация тестовых данных пользователей
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

// Добавление сообщения в базу данных
void addnewmessage(username, text){
  //Username указываем как Kuroiyami
  //Text это сообщение которые мы ввели в TextField
  DateTime time = DateTime.now();
  FirebaseFirestore.instance.collection('chatdata').add({
    'addtime' : time,
    'text' : text,
    'username' : username
  });
}

void outputmessages() async{
  var hours = DateTime.now().hour;
  var minute = DateTime.now().minute;
  var seconds = DateTime.now().second;
  var colleciondates = [];
  var times;
  var colleciontimes = [];

  CollectionReference items = FirebaseFirestore.instance.collection('chatdata');
  QuerySnapshot querySnapshot = await items.get();
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  for(int i=0;i<allData.length;i++){
    colleciondates.add(allData.elementAt(i));
    times = colleciondates[i]['addtime'].toDate();
    colleciontimes.add(times);
  }
  colleciontimes.sort((a, b) => a.compareTo(b));
  print("Отсортированный массив времён выглядит так: ");
  print(colleciontimes);

}

// Генерация тестовых данных сообщений
void addtestdateschat() async{
  var listnames = [];
  var name;
  var collectionmessages = ['Всем привет!', 'Всем пока, я пошёл.', 'Тут как то пусто.', 'А мы тусим...', 'Мир не так уж и плох, как нам кажется)', 'Может быть ты и прав...', 'Дурь каких поискать', 'Земляне, сдавайтесь!', 'Тут должно прозвучать чтото умное, но не сегодня)', 'Мы не будем РАБАМИ!'];
  var colleciondates = [];
  var listmessages = [];
  var rng = new Random();
  var hours;
  var mins;
  var sec;
  var time1;
  DateTime time;
  CollectionReference items = FirebaseFirestore.instance.collection('items');
  QuerySnapshot querySnapshot = await items.get();
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  for(int i=0;i<allData.length;i++){
    colleciondates.add(allData.elementAt(i));
    name = colleciondates[i]['username'];
    listnames.add(name);
    listmessages.add(collectionmessages[rng.nextInt(collectionmessages.length)]);

    hours = rng.nextInt(24);
    if(hours > -1 && hours < 10){
      hours = '0' + hours.toString();
    }
    mins = rng.nextInt(60);
    if(mins > -1 && mins < 10){
      mins = '0' + mins.toString();
    }
    sec = rng.nextInt(60);
    if(sec > -1 && sec < 10){
      sec = '0' + sec.toString();
    }
    time1 = "2022-01-25 " + hours.toString() + ":" + mins.toString() + ":" + sec.toString() + ".000";
    time = DateTime.parse(time1);
    FirebaseFirestore.instance.collection('chatdata').add({
      'addtime': time,
      'username': listnames[i],
      'text': listmessages[i]
    });
  }
}

String timemessage(timemessage){
  var date = timemessage.toDate().toString().substring(11,16);
  return date;
}