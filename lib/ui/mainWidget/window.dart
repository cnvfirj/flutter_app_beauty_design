

import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';
import 'package:flutter_app_beauty_design/help/byCode.dart';
import 'package:flutter_app_beauty_design/help/constants.dart';

import 'package:url_launcher/url_launcher.dart';
import 'dart:ui' as grad;

/*подробнее о кастомных апп барах
* https://stackoverflow.com/questions/52678469/the-appbardesign-cant-be-assigned-to-the-parameter-type-preferredsizewidget*/
class MainAppBar extends StatelessWidget with PreferredSizeWidget{
  final Pair<double, double> _pair;
  final String url = 'https://qrng.anu.edu.au/';


  MainAppBar(this._pair);

  @override
  Widget build(BuildContext context) {
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
            onPressed: (){
               openLink();
            },
            icon: Image.asset(
                "assets/images/icon_out_link.png"),
                 color: Colors.white,)
            // icon: Icon(Icons.ac_unit))

      ],
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(_pair.second>_pair.first?_pair.second*BuildCoefficient.H_APP_BAR:_pair.first*BuildCoefficient.H_APP_BAR);

  void openLink()async{
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class BackgroundMainText extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 15, right: 15),
      child:Text(
        S.maybeOf(context)!.background_text,
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
              )
        ),
        textAlign: TextAlign.center,
    )
    )
    );
  }
}
