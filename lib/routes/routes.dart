import 'package:flutter/material.dart';
import 'package:flutter_admin/view/home/home.dart';
import 'package:flutter_admin/view/profile/profile.dart';

class Routes {

  BuildContext? context;

  Routes({this.context});

  Map<String, Function(dynamic)> get(){
    return {
      '/' : (context) => Home(),
      '/profile' : (context) => Profile(),
    };
  }
}