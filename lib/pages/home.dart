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

  // Инициализация firebase
  void initFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  }

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
                    margin: EdgeInsets.all(5),
                    child: InkWell(
                      onTap: (){
                        TextEditingController userNameController = TextEditingController(text: snapshot.data!.docs[index].get('username'));
                        TextEditingController lastnameController = TextEditingController(text: snapshot.data!.docs[index].get('lastname'));
                        TextEditingController firstnameController = TextEditingController(text: snapshot.data!.docs[index].get('firstname'));
                        TextEditingController phoneController = TextEditingController(text: snapshot.data!.docs[index].get('phone'));
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                AlertDialog(
                                  title: Text("Редактирование данных"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      TextFormField(
                                        controller: userNameController,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.person),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: lastnameController,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.assignment_ind_sharp),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: firstnameController,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.account_circle),
                                        ),
                                      ),
                                      TextFormField(
                                        controller: phoneController,
                                        decoration: const InputDecoration(
                                          icon: Icon(Icons.local_phone ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: (){
                                          changedates(snapshot.data!.docs[index].id, userNameController.text, lastnameController.text, firstnameController.text, phoneController.text);
                                          Navigator.pop(context);
                                          },
                                        child: Text("Сохранить"),
                                    ),
                                  ],
                                ),
                        );
                      },
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          size: 50.0,
                          color: Colors.deepOrangeAccent,
                        ),
                        title: Text(snapshot.data!.docs[index].get('username')),
                        //subtitle: Text(snapshot.data!.docs[index].get('lastname') + " " + snapshot.data!.docs[index].get('firstname')),
                      ),
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
            // Кнопка по центру
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/chat');
                  },
                  child: const Icon(
                    Icons.chat,
                    size: 40,
                  ),
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