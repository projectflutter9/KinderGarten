import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Tab1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
                padding: const EdgeInsets.all(20.0),
                  child: FutureBuilder(
                    future: FirebaseFirestore.instance.collection("users").where('rule', isEqualTo: "user").get(),

                    builder: (context , AsyncSnapshot snapshot){
                      if(snapshot.hasData == false){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      else{
                        return ListView.separated(
                            itemCount: snapshot.data.docs.length,
                            itemBuilder:(context , i){
                              return Material(
                                elevation: 20,
                                borderRadius: BorderRadius.circular(20),
                                shadowColor:Colors.grey,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Father Name : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                          Text(snapshot.data.docs[i]["Father Name"],style: TextStyle(fontSize: 20),),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Child Name : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                          Text(snapshot.data.docs[i]["Child Name"],style: TextStyle(fontSize: 20),),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Age : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                          Text(snapshot.data.docs[i]["Age"],style: TextStyle(fontSize: 20),),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Address : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                          Text(snapshot.data.docs[i]["Address"],style: TextStyle(fontSize: 20),),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Phone Number : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                          Text(snapshot.data.docs[i]["Phone Number"],style: TextStyle(fontSize: 20),),
                                        ],
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("E-mail : ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                            Text(snapshot.data.docs[i]["Email"],style: TextStyle(fontSize: 20),),
                                          ],
                                        ),
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
                        }
                        );

                      }
                    },

                  ),

              ),





    );
  }
}
