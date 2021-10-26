import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/MainWindow.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LoadParams.inst().reed((){
    runApp(MainApp());
  });
}

