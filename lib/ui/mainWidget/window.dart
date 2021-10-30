import 'package:dart_numerics/dart_numerics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';
import 'package:flutter_app_beauty_design/ui/common/CommonWidget.dart';
import 'package:provider/provider.dart';

import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as grad;

/*подробнее о кастомных апп барах
* https://stackoverflow.com/questions/52678469/the-appbardesign-cant-be-assigned-to-the-parameter-type-preferredsizewidget*/
typedef ActionButton = Function(int index);

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  final Pair<double, double> _pair;
  final ActionButton _actionButton;

  MainAppBar({required Pair<double, double>pair,required ActionButton actionButton}):
  _pair = pair,
  _actionButton = actionButton;

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonObservable>(builder:(_, CommonObservable observable, Widget? child){
      return AppBar(
        backgroundColor: Colors.orange,
        title: Text(S.maybeOf(context)!.title_app),
        elevation: 30,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // _actionButton(1);
              observable.action();
            },
            icon: Icon(Icons.repeat,color: Colors.white,),
          )
          // icon: Icon(Icons.ac_unit))
        ],
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(_pair.second > _pair.first
      ? _pair.second * BuildCoefficient.H_APP_BAR
      : _pair.first * BuildCoefficient.H_APP_BAR);

}

class BackgroundMainText extends StatelessWidget {

  // final String url = 'https://qrng.anu.edu.au/';

  @override
  Widget build(BuildContext context) {
    return  Container(
      child:Column(
        children: [
      Container(
          margin: EdgeInsets.only(top:30,left: 15, right: 15),
          child: Text(
            _createMassage(context),
            style: TextStyle(
                fontSize: 30,
                foreground: Paint()
                  ..shader = grad.Gradient.linear(
                    const Offset(0, 20),
                    const Offset(0, 500),
                    [
                      Colors.black38,
                      Colors.black12,
                    ],
                  )),
            textAlign: TextAlign.center,
          )),
          // IconButton(
          //     onPressed: (){openLink();},
          //     icon: Icon(
          //         Icons.link,
          //          color: Colors.black38,)
          // )
    ]));
  }

  String _createMassage(BuildContext context){
    String text1 = S.maybeOf(context)!.background_text_1;
    String text2 = S.maybeOf(context)!.background_text_2;
    String text3 = S.maybeOf(context)!.background_text_3;
    String min = '$int64MinValue';
    String max = '$int64MaxValue';
    // print(min);
    // print(max);
    //
    // text2.replaceAll(RegExp('!!!'),'$min');
    // text3.replaceAll(RegExp('!!!'), '$max');
    return '$text1 $text2 $text3';
  }


  // void openLink() async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}

