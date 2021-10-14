

import 'package:flutter/material.dart';
import 'package:flutter_app_beauty_design/generated/l10n.dart';

import 'package:url_launcher/url_launcher.dart';


/*подробнее о кастомных апп барах
* https://stackoverflow.com/questions/52678469/the-appbardesign-cant-be-assigned-to-the-parameter-type-preferredsizewidget*/
class MainAppBar extends StatelessWidget with PreferredSizeWidget{

  final String url = 'https://qrng.anu.edu.au/';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.orange,
      title: Text(S.maybeOf(context)!.title_app),
      elevation: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
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
  Size get preferredSize => const Size.fromHeight(60);

  void openLink()async{
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}