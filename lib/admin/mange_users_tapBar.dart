
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:kindergarten/admin/tab1_admin_mange_users.dart';
import 'package:kindergarten/admin/tab2_admin_mange_users.dart';
import 'package:kindergarten/admin/tab3_admin_mange_users.dart';


class mange_users extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: ("view Users"),icon: Icon(Icons.view_headline_sharp),),
              Tab(text: ("edit Users"),icon: Icon(Icons.edit),),
              Tab(text: ("delete Users"),icon: Icon(Icons.delete_forever),),

            ],
          ),
          backgroundColor: Color.fromRGBO(143, 148, 251, 1),


          title: Text("Mange Users Profiles",style: TextStyle(fontSize: 25),),


        ),
        body: TabBarView(
          children:[
            Tab1(),
            Tab2(),
            Tab3(),

          ],
        ),

      ),
    );  }
}
