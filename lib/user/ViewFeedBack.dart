import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kindergarten/Constants.dart';

class ViewFeedback extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    return Scaffold(

      drawer: Drawer(),
      body: Stack(
        children: [
          Positioned(
            width: width/1.9,
            bottom: height/2.7,
            child: Image.asset('assets/images/feedback.jpg'),
            height: height,
          ),

          Positioned(

            bottom: 0,
            child: Container(height: height/1.39,width: width,color: Colors.white,),
          ),
          Scaffold(
            backgroundColor: Colors.black12,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.white),
            ),
            drawer: Drawer(),

            body: FutureBuilder(
                future: FirebaseFirestore.instance.collection("Approved Feedback").get(),
                builder: (context,AsyncSnapshot snapshot) {
                  if (snapshot.hasData == false) {
                    return Center(child: CircularProgressIndicator());
                  }

                 else{
                    return ListView.separated(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, i) {
                        return Material(
                          color: Colors.white,
                          elevation: 5,
                          borderRadius: BorderRadius.circular(20),
                          shadowColor:Color.fromRGBO(143, 148, 251, 1),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children:[
                                Row(
                                  children: [
                                    FutureBuilder(
                                        future : GetImageFromFireBasefeedback(snapshot.data.docs[0]["Email"]),
                                      builder: (context, AsyncSnapshot<dynamic> snapshot) {
                                        if (snapshot.hasData == false) {
                                          return Center(child: CircularProgressIndicator());
                                        }
                                        else{
                                          return CircleAvatar(
                                            radius: 25,
                                            backgroundImage: NetworkImage(snapshot.data),
                                          );
                                        }

                                      }
                                    ),
                                    SizedBox(width: 20,),
                                    Text(
                                      " ${snapshot.data.docs[i]["Email"]} ",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                                    ),
                                    SizedBox(width: 40,),
                                    IconButton(icon: Icon(Icons.more_vert), onPressed: (){},color: Colors.black, ),

                                    SizedBox(height: 20,),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  " ${snapshot.data.docs[i]["Title"]}",
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                                ),
                                SizedBox(height: 10,),

                                Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                    child: Text(
                                      "Description : ${snapshot.data.docs[i]["Message"]}",
                                      style: TextStyle( fontSize: 21),

                                    )
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 20,
                        );
                      },
                    );
                  }
                }
            ),
          ),
        ],

      ),
    );
  }
}
GetImageFromFireBasefeedback(String email) async{
  if (email == ""){
    return "http://www.markuslaforsch.org/wp-content/plugins/lightbox/images/No-image-found.jpg";
  }
  else {
    final ref = FirebaseStorage.instance.ref("folderName/${email}");
// no need of the file extension, the name will do fine.
    var url = await ref.getDownloadURL();
    return url;
  }
}