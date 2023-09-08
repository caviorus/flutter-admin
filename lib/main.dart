import 'package:flutter/material.dart';
import 'package:flutter_admin/view/home/home.dart';

void main(){
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Admin",
      home: AdminNavigation(
        body: Home(),
      ),
    );
  }
}

class AdminNavigation extends StatelessWidget {
  final Widget? body;
  const AdminNavigation({super.key, this.body});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Title"),),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if(constraints.maxWidth < 600){
            return Container(child: Text("xs"));
          }
          else if(constraints.maxWidth < 900){
            return Container(child: Text("sm"));
          }
          else if(constraints.maxWidth < 1200){
            return Container(child: Text("md"));
          }
          else if(constraints.maxWidth < 1536){
            return Container(child: Text("lg"));
          }
          else{
            return Container(child: Text("xl"));
          }
        },
      ),
    );
  }
}