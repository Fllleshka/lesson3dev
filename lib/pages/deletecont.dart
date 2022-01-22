import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lesson3/services/services.dart';

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
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 50.0,
                        color: Colors.deepOrangeAccent,
                      ),
                      title:  Text(snapshot.data!.docs[index].get('lastname') + " " + snapshot.data!.docs[index].get('firstname')),
                      subtitle:  Text(snapshot.data!.docs[index].get('phone')),
                      trailing: IconButton(
                          onPressed: (){
                            deleteinfo(snapshot.data!.docs[index].id);
                          },
                          icon: Icon(
                            Icons.delete,
                            size: 25.0,
                            color: Colors.lightBlueAccent,
                          ),
                      ),
                    ),
                  ),
                );
              }
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addtestdates();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.support_agent),
      ),
    );
  }
}
