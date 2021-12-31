import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kindergarten/admin/AdminDashboard.dart';

class Tab2 extends StatefulWidget {
  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  bool fold=true;

  TextEditingController FatherNameController = new TextEditingController();

  TextEditingController FatherName = new TextEditingController();

  TextEditingController ChildName = new TextEditingController();

  TextEditingController Age = new TextEditingController();

  TextEditingController Address = new TextEditingController();

  TextEditingController Email = new TextEditingController();

  TextEditingController Phone = new TextEditingController();

  late String Class;

  bool found = false;

  var id;
  final formKey = GlobalKey<FormState>();
  var collection = FirebaseFirestore.instance.collection("users");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Form(
        key: formKey,
        child: ListView(
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
                            child: fold ? TextFormField(
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Please Enter Father Name";
                                }
                              },
                              decoration: InputDecoration(hintText: "Enter father name to edit " , hintStyle: TextStyle(color: Colors.white),
                                border: InputBorder.none,
                              ),
                              controller: FatherNameController,
                            ) : null ,
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
                  width: 200,
                  child: MaterialButton(
                    onPressed: ()async{
    if(formKey.currentState!.validate()){
                      var querySnapshot = await collection.where('rule', isEqualTo: "user").get();

                      for (var queryDocumentSnapshot in querySnapshot.docs){
                        Map<String ,dynamic> data = queryDocumentSnapshot.data();
                        if(data['Father Name'].toString() == FatherNameController.text){
                          setState(() {
                            found =true;
                          });
                          id = queryDocumentSnapshot.id;
                        }
                      }
                      }
                    },
                    height: 30 ,
                    child: Text("Search",style: TextStyle(color: Colors.white,fontSize: 20),),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(143, 148, 251, 1),

                  ),
                ),

                SizedBox(height: 30,),
                found? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 380,

                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Father Name";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "FatherName",
                            hintStyle: TextStyle(fontSize: 20),
                            fillColor: Colors.white60,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),
                          ),
                          controller: FatherName,
                        )
                    ),
                    SizedBox(height: 20,),
                    Container(
                        width: 380,

                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Child Name";
                            }
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "ChildName",
                            hintStyle: TextStyle(fontSize: 20),
                            fillColor: Colors.white60,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),
                          ),
                          controller:ChildName ,
                        )
                    ),
                    SizedBox(height: 20,),
                    Container(
                        width: 380,

                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Age";
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Age",
                            hintStyle: TextStyle(fontSize: 20),
                            fillColor: Colors.white60,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),
                          ),
                          controller:Age ,
                        )
                    ),
                    SizedBox(height: 20,),
                    Container(
                        width: 380,

                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Address";
                            }
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "address",
                            hintStyle: TextStyle(fontSize: 20),
                            fillColor: Colors.white60,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),
                          ),
                          controller:Address ,
                        )
                    ),
                    SizedBox(height: 20,),
                    Container(
                        width: 380,

                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Email";
                            }
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "E-mail",
                            hintStyle: TextStyle(fontSize: 20),
                            fillColor: Colors.white60,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),
                          ),
                          controller:Email ,
                        )
                    ),
                    SizedBox(height: 20,),
                    Container(
                        width: 380,

                        child: TextFormField(
                          validator: (value){
                            if(value!.isEmpty){
                              return "Please Enter Phone Number";
                            }
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Phone",
                            hintStyle: TextStyle(fontSize: 20),
                            fillColor: Colors.white60,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)
                            ),
                          ),
                          controller:Phone ,
                        )
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 5, top: 40),
                      color: Color.fromRGBO(143, 148, 251, 1),
                      height: 60,
                      width: 300,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.school,
                              color: Colors.white,
                            ),
                            labelText: "Class",
                            labelStyle: TextStyle( color: Colors.white ,)),
                        items: ["A", "B", "C"]
                            .map((label) => DropdownMenuItem(
                          child: Text(label),
                          value: label,
                        ))
                            .toList(),
                        onChanged: (value) {
                          Class = value.toString();
                        },
                      ),
                    ),
                    SizedBox(height: 20,),

                    Container(
                      width: 380 ,
                      height: 50,
                      child: ElevatedButton(

                          style: ElevatedButton.styleFrom(

                            primary: Colors.green[600],

                          ),
                          child: Text("Save New Data",style: TextStyle(color: Colors.white,fontSize: 17 ),),
                          onPressed: () {
          if(formKey.currentState!.validate()){
                            String fathername = FatherName.text;
                            String childname = ChildName.text;
                            String age =Age.text;
                            String address = Address.text;
                            String phone = Phone.text;
                            String email = Email.text;

                            collection.doc(id).update(<String ,dynamic>{
                              "Father Name": "$fathername",
                              "Child Name": "$childname",
                              "Age": "$age",
                              "Address" : "$address",
                              "Email" : "$email",
                              "Phone Number" : "$phone",
                              "Class" : Class,
                            });
                          }
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomePage()));
                          }
                      ),
                    ),
                  ],
                )

                    :Text("Please Enter right Father Name"),
                SizedBox(height: 10,),

              ],
            ),

          ],
        ),
      ),

    );
  }
}