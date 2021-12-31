import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewGrades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("View Grades"),
          backgroundColor: Color.fromRGBO(143, 148, 251, 1)),
      body: Container(
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection("Grades").get(),
          builder: (context, AsyncSnapshot snapshots) {
            if (snapshots.hasData == false)
              return Text('No Grades To View, Please Enter valid Data!!');
            else {
              return ListView.separated(
                  itemCount: snapshots.data.docs.length,
                  itemBuilder: (context, i) {
                    return Table(border: TableBorder.all(), children: [
                      TableRow(
                          decoration: new BoxDecoration(
                              color: Color.fromRGBO(143, 148, 251, 1)),
                          children: [
                            Center(
                              child: Text(
                                "NAME",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Center(
                              child: Text(
                                "SUBJECT",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Center(
                              child: Text(
                                "DATE",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Center(
                              child: Text(
                                "GRADE",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ]),
                      TableRow(children: [
                        Center(
                          child: Text(
                            snapshots.data.docs[i]["name"],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Center(
                          child: Text(
                            snapshots.data.docs[i]["subject"],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Center(
                          child: Text(
                            snapshots.data.docs[i]["date"],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Center(
                          child: Text(
                            snapshots.data.docs[i]["grade"],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ]),
                    ]);
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