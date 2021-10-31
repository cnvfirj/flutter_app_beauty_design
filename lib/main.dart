import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/ui/MainWindow.dart';
import 'package:flutter_app_beauty_design/ui/common/InteractionFile.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CommonProvider.inst().init((){
    runApp(MainApp());
  });
}

