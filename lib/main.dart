import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/ui/mainWindow.dart';
import 'package:flutter_app_beauty_design/ui/common/di/init.dart';

void main() {
  InjectPreparationWork.instance().ready((){
    runApp(MainApp());
  });
}

