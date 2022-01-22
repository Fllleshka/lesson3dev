import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lesson3/services/services.dart';

class StlWidget extends StatefulWidget {
  const StlWidget({Key? key}) : super(key: key);

  @override
  _StlWidgetState createState() => _StlWidgetState();
}

class _StlWidgetState extends State<StlWidget> {

  @override
  void initState(){
    super.initState();
    initFirebase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('items').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) return Text('Нет данных для отображения');
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index){
              return Dismissible(
                  key: Key(snapshot.data!.docs[index].id),
                  child: Card(
                    child: ListTile(
                      title: Text(snapshot.data!.docs[index].get('username')),
                    ),
                  ),
              );
            }
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
        Stack(
          fit: StackFit.expand,
          children: [
            // Левая кнопка удаление
            Positioned(
              left: 30,
              bottom: 20,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/deletecont');
                },
                child: const Icon(
                  Icons.delete_outline,
                  size: 40,
                ),
              ),
            ),
            // Правая кнопка добавление
            Positioned(
              bottom: 20,
              right: 30,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addcont');
                },
                child: const Icon(
                  Icons.add_circle_outline,
                  size: 40,
                ),
              ),
            ),
          ],
      ),
    );
  }
}