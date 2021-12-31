import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewTeacher extends StatelessWidget {
  @override
  var id;
  var collection = FirebaseFirestore.instance.collection("teachers");

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View And Delete Teacher"),
      ),
      body: Container(
        child: FutureBuilder(
          future: FirebaseFirestore.instance.collection("teachers").get(),
          builder: (context, AsyncSnapshot snapshots) {
            if (snapshots.hasData == false)
              return Center(child: CircularProgressIndicator());
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
                                "CLASS",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Center(
                              child: Text(
                                "Email",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Center(
                              child: Text(
                                "",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ]),
                      TableRow(children: [
                        Center(
                          child: Text(
                            snapshots.data.docs[i]["username"],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Center(
                          child: Text(
                            snapshots.data.docs[i]["class"],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text(
                          snapshots.data.docs[i]["email"],
                          style: TextStyle(fontSize: 20),
                        ),
                        GestureDetector(
                          child: Text(
                            "Tab her To Delete teacher",
                            style: TextStyle(color: Colors.red),
                          ),
                          onTap: () async {
                            var querySnapshot = await collection.get();
                            for (var queryDocumentSnapshot
                                in querySnapshot.docs) {
                              Map<String, dynamic> data =
                                  queryDocumentSnapshot.data();
                              if (data["username"].toString() ==
                                      snapshots.data.docs[i]["username"] &&
                                  data["class"].toString() ==
                                      snapshots.data.docs[i]["class"] &&
                                  data["email"].toString() ==
                                      snapshots.data.docs[i]["email"]) {
                                id = queryDocumentSnapshot.id;
                                collection.doc(id).delete();
                              }
                            }
                          },
                        )
                      ]),
                    ]);
                  },
                  separatorBuilder: (context, i) {
                    return Divider(
                      color: Colors.grey,
                      thickness: 5,
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
