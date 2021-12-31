import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Feeds extends StatefulWidget {
  const Feeds({Key? key}) : super(key: key);

  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        title: Text("New Feeds"),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance.collection("Feeds").get(),
          builder: (context,AsyncSnapshot snapshot) {
            if (snapshot.hasData == false) {
              return Center(child: CircularProgressIndicator());
            }
           else {
              return ListView.separated(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      SizedBox(height: 10,),
                      Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.mail),
                                  Text(
                                    " ${snapshot.data.docs[i]["Teacher Name"]} :",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                                  ),

                                ],
                              ),
                              SizedBox(height: 10,),
                              Text(
                                " ${snapshot.data.docs[i]["Title"]}",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  child: Text(
                                    "Description : ${snapshot.data.docs[i]["Description"]}",
                                    style: TextStyle( fontSize: 20),

                                  )
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 10,
                  );
                },
              );
            }
          }
      ),
    );
  }
}
