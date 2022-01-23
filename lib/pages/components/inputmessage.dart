import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lesson3/services/services.dart';

class Bodychat extends StatelessWidget {
  const Bodychat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Вывод истории сообщений
        Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 5.0,
              ),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('chatdata').snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if(!snapshot.hasData) return Text('Нет истории для отображения');
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index){
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                    child: Container(
                                        constraints: BoxConstraints(
                                            minWidth: 150,
                                            maxWidth: 300
                                        ),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5.0,
                                          vertical: 10.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Text(snapshot.data!.docs[index].get('text'))
                                    ),
                                  ),
                                  Positioned(
                                    top: 3,
                                    right: 0,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Text(snapshot.data!.docs[index].get('username'))
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 0,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.lightBlueAccent.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Text(timemessage(snapshot.data!.docs[index].get('addtime'))),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                    );
                  }
              ),
            ),
        ),
        // Отправка сообещения
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0
          ),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SafeArea(
            child: Row(
              children: [
                IconButton(
                  onPressed: (){
                    addtestdateschat();
                  },
                  icon: Icon(
                    Icons.mic,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(width: 20.0),
                Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.sentiment_satisfied_alt_outlined,
                            color: Colors.lightBlueAccent,
                          ),
                          SizedBox(width: 20.0),
                          Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Введите сообщение",
                                  border: InputBorder.none,
                                ),
                              ),
                          ),
                          IconButton(
                            onPressed: (){
                              addnewmessage("Kuroiyami", "Тестовый текст");
                            },
                            icon: Icon(
                              Icons.send,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ],
                      ),
                    ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Message extends StatelessWidget {
  const Message({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    //outputmessages();
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child:
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('chatdata').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if(!snapshot.hasData) return Text('Нет истории для отображения');
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index){
                      return Dismissible(
                        key: Key(snapshot.data!.docs[index].id),
                        child: Card(

                        ),
                      );
                    }
                );
              }
            ),
        ),
      ],
    );
  }
}
