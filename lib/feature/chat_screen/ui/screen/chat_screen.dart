import 'package:chat_me/core/helper/spaces.dart';
import 'package:chat_me/feature/chat_screen/data/models/message.dart';
import 'package:chat_me/feature/chat_screen/ui/widget/chat_buple.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference massages =
      FirebaseFirestore.instance.collection('massages');
  TextEditingController massageController = TextEditingController();
  final controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: massages.orderBy("createAt", descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Massage> massagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            massagesList.add(Massage.fromJson(snapshot.data!.docs[i]));
          }

          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title: Text(
                  'Health Assistant',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                centerTitle: true,
                elevation: 0.2,
                shadowColor: Colors.grey,
                scrolledUnderElevation: 0.2,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: controller,
                        itemCount: massagesList.length,
                        itemBuilder: (context, index) {
                          return massagesList[index].id == email
                              ? ChatBuble(
                                  message: massagesList[index].massage,
                                )
                              : ChatBubleFriend(
                                  message: massagesList[index].massage);
                        }),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: massageController,
                                    onSubmitted: (val) {
                                      massages.add({
                                        'massages': val,
                                        "createAt": DateTime.now(),
                                        "id": email
                                      });
                                      massageController.clear();
                                      controller.animateTo(0,
                                          duration: Duration(seconds: 1),
                                          curve: Curves.fastOutSlowIn);
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Type your message...',
                                      hintStyle: TextStyle(
                                          color: Colors.blueGrey, fontSize: 14),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Transform.rotate(
                                    angle: 35 * 3.1415926535 / 180,
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Icon(Icons.attach_file,
                                            color: Colors.blueGrey, size: 25)),
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        horizontalSpace(5),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: IconButton(
                            alignment: Alignment.topRight,
                            icon: Transform.rotate(
                              angle: -35 * 3.1415926535 / 180,
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Icon(Icons.send,
                                      color: Colors.white, size: 25)),
                            ),
                            onPressed: () {
                              if (massageController.text.isNotEmpty) {
                                massages.add({
                                  'massages': massageController.text,
                                  "createAt": DateTime.now(),
                                  "id": email
                                });

                                massageController.clear();
                                controller.animateTo(
                                  0,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
