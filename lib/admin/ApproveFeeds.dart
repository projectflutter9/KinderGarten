import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Approve_Feedback extends StatelessWidget {
  @override

  var id;
  var collection = FirebaseFirestore.instance.collection("All Feedback");
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        title: Text(
          "Approve Feedback",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: FutureBuilder(
            future: FirebaseFirestore.instance.collection("All Feedback").get(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData == false) {
                return Text(
                  "connection Error",
                  style: TextStyle(fontSize: 40),
                );
              } else {
                return ListView.separated(
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, i) {
                      return Material(
                        elevation: 20,
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "E-mail: ",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Text(
                                    snapshot.data.docs[i]["Email"],
                                    style: TextStyle(fontSize: 22),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Title: ",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.red),
                                  ),
                                  Text(
                                    snapshot.data.docs[i]["Title"],
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.red),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data.docs[i]["Message"],
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 110,
                                    child: MaterialButton(
                                      onPressed: () async {
                                        String email =
                                            snapshot.data.docs[i]["Email"];
                                        String title =
                                            snapshot.data.docs[i]["Title"];
                                        String message =
                                            snapshot.data.docs[i]["Message"];
                                        FirebaseFirestore.instance
                                            .collection("Approved Feedback")
                                            .add(<String, dynamic>{
                                          "Email": email,
                                          "Title": title,
                                          "Message": message,
                                        });

                                        var querySnapshot =
                                        await collection.get();
                                        for (var queryDocumentSnapshot
                                        in querySnapshot.docs) {
                                          Map<String, dynamic> data =
                                          queryDocumentSnapshot.data();
                                          if (
                                          data["Email"].toString() ==snapshot.data.docs[i]["Email"]&&
                                              data["Title"].toString() ==snapshot.data.docs[i]["Title"]&&
                                              data["Message"].toString() ==snapshot.data.docs[i]["Message"]) {
                                            id = queryDocumentSnapshot.id;
                                            collection.doc(id).delete();
                                          }
                                        }
                                      },
                                      height: 30,
                                      child: Text(
                                        "Approve",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Container(
                                    width: 110,
                                    child: MaterialButton(
                                      onPressed: () async {
                                        var querySnapshot =
                                            await collection.get();
                                        for (var queryDocumentSnapshot
                                            in querySnapshot.docs) {
                                          Map<String, dynamic> data =
                                              queryDocumentSnapshot.data();
                                          if (
                                          data["Email"].toString() ==snapshot.data.docs[i]["Email"]&&
                                              data["Title"].toString() ==snapshot.data.docs[i]["Title"]&&
                                              data["Message"].toString() ==snapshot.data.docs[i]["Message"]) {
                                            id = queryDocumentSnapshot.id;
                                            collection.doc(id).delete();
                                          }
                                        }
                                      },
                                      height: 30,
                                      child: Text(
                                        "Delete",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, i) {
                      return Divider(
                        color: Colors.white,
                        thickness: 2,
                      );
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}
