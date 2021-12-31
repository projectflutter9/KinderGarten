import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

  class Tab3 extends StatefulWidget{

  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
    TextEditingController FatherNameController = new TextEditingController();

    var id;

    var collection = FirebaseFirestore.instance.collection("users");

    bool result=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 30,),
              Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromRGBO(143, 148, 251, 1),
                  boxShadow: kElevationToShadow[6],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.only(left: 16),
                          child: TextField(
                            decoration: InputDecoration(hintText: "Enter father name to delete " , hintStyle: TextStyle(color: Colors.white),
                              border: InputBorder.none,
                            ),
                            controller: FatherNameController,
                          ) ,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search,color: Colors.white,),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30,),
              Container(
                constraints: BoxConstraints( maxWidth: 300),
                width: 200,
                child: MaterialButton(
                  onPressed: ()async{
                    var querySnapshot = await collection.get();

                    for (var queryDocumentSnapshot in querySnapshot.docs){
                      Map<String ,dynamic> data = queryDocumentSnapshot.data();
                      if(data['Father Name'].toString() == FatherNameController.text){
                        setState(() {
                          id = queryDocumentSnapshot.id;
                          FirebaseFirestore.instance.collection("users").doc(id).delete();
                          setState(() {
                            result = true;
                          });

                        });
                      }
                    }

                  },
                  height: 30 ,
                  child: Text("Delete",style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,

                ),
              ),
        result ? Text(" successfully Deleted",style: TextStyle(color: Colors.black,fontSize: 20),) : Text(" nothing Deleted",style: TextStyle(color: Colors.black,fontSize: 20),)

      ],
          ),

        ],
      ),

    );
  }
}
