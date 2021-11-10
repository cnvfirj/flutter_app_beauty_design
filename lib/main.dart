import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/ui/MainWindow.dart';
import 'package:flutter_app_beauty_design/ui/common/InteractionFile.dart';
import 'package:flutter_app_beauty_design/ui/common/di/init.dart';

void main() {
  InjectPreparationWork.instance().ready((){
    runApp(MainApp());
  });
  // WidgetsFlutterBinding.ensureInitialized();
  // CommonProvider.inst().init((){
  //   runApp(MainApp());
  // });
}

