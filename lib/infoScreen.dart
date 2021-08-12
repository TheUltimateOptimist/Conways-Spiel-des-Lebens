import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
            size: 27,
          ),
        ),
        title: Text(
          "Conways Spiel des Lebens",
          style: TextStyle(
              fontSize: 26, color: Colors.green, fontWeight: FontWeight.bold, fontFamily: "IndieFlower"),
        ),
        backgroundColor: Colors.blueGrey[900],
        toolbarHeight: 70,
      ),
      body: Container(
        margin: EdgeInsets.only(
          left: 15,
          top: 15,
        ),
        child: SizedBox(
          child: Text(AppLocalizations.of(context)!.description,
            style: TextStyle(fontFamily: "IndieFlower",
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
