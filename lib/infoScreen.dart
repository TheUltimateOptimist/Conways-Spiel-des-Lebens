import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          style: GoogleFonts.indieFlower(
              fontSize: 26, color: Colors.green, fontWeight: FontWeight.bold),
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
          child: Text(
            "Das Spiel des Lebens wurde 1970 von dem Mathematiker John Horton Conway(1937-2020) entworfen. Das Spielfeld ist in Zeilen und Spalten eingeteilt und im Idealfall unendlich groß. Jedes Gitterquadrat ist ein zellulärer Automat bzw. eine Zelle, welche entweder lebendig oder tot sein kann. Der Lebenszustand der einzelnen Zellen ändert sich mit jeder Runde abhängig von den Nachbarzellen unter der Befolgung einfacher Regeln. Eine tote Zelle mit genau drei lebenden Nachbarn wird in der Folgegeneration neu geboren. Lebende Zellen mit weniger als zwei lebenden Nachbarn sterben in der Folgegeneration an Einsamkeit. Eine lebende Zelle mit  zwei oder drei lebenden Nachbarn bleibt in der Folgegeneration am Leben. Lebende Zellen mit mehr als drei lebenden Nachbarn sterben in der Folgegeneration an Überbevölkerung. Mit diesen vier einfachen Regeln entsteht aus bestimmten Anfangsmustern im Laufe des Spiels eine Vielzahl komplexer Strukturen. Einige bleiben unverändert, andere oszillieren und wieder andere wachsen oder vergehen. Manche Strukturen, sogenannte Gleiter, bewegen sich auf dem Spielfeld fort. Durch ständiges Ausprobieren verschiedener Anfangskonstellationen lassen sich somit interessante Muster entdecken.",
            style: GoogleFonts.indieFlower(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
