
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kindergarten/user/Customs.dart';


class ViewClass extends StatefulWidget {
  const ViewClass({Key? key}) : super(key: key);

  @override
  _ClassAState createState() => _ClassAState();
}

class _ClassAState extends State<ViewClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CLASSES"),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
      ),
      drawer: drawer(),
      body: Container(
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection("users").where('rule', isEqualTo: "user").get(),
          builder: (context, AsyncSnapshot snapshots) {
            if (snapshots.hasData == false)
              return Text('No Students To View');
            else {
              return ListView.separated(
                  itemCount: snapshots.data.docs.length,
                  itemBuilder: (context, i) {
                    return Card(
                        child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.grey, width: 2),
                              boxShadow: [
                                //background color of box
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 15.0, // soften the shadow
                                  spreadRadius: 5.0, //extend the shadow
                                  offset: Offset(
                                    5.0, // Move to right 10  horizontally
                                    5.0, // Move to bottom 10 Vertically
                                  ),
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "ChildName :",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      snapshots.data.docs[i]["Child Name"],
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Class :",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text(
                                      snapshots.data.docs[i]["Class"],
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                              ],
                            )));
                  },
                  separatorBuilder: (context, i) {
                    return Divider(
                      color: Colors.grey,
                      thickness: 3,
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
