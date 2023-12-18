import 'package:flutter/material.dart';
import 'package:flutter_admin/components/sidebar/sidebar.dart';
import 'package:flutter_admin/view/home/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Admin",
      theme: _buildTheme(Brightness.light),
      home: AdminNavigation(
        body: Home(),
      ),
    );
  }
}

ThemeData _buildTheme(brightness){
  var baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(baseTheme.textTheme),
    scaffoldBackgroundColor: Color(0xFFF3F3F3)
  );
}

class AdminNavigation extends StatelessWidget {
  final Widget? body;
  const AdminNavigation({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Title", style: TextStyle(color: Colors.blueGrey),),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return Sidebar(body: body);
          } else if (constraints.maxWidth < 900) {
            return Sidebar(body: body);
          } else if (constraints.maxWidth < 1200) {
            return Sidebar(body: body);
          } else if (constraints.maxWidth < 1536) {
            return Sidebar(body: body, expanded: true,);
          } else {
            return Sidebar(body: body, expanded: true, width: 320,);
          }
        },
      ),
    );
  }
}
