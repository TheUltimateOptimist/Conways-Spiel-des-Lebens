import 'package:conways_spiel_des_lebens/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ObjectButton extends StatefulWidget {

ObjectButton({this.object = "",});
final String object;

  @override
  _ObjectButtonState createState() => _ObjectButtonState();
}

class _ObjectButtonState extends State<ObjectButton> {
onPressed(){
    switch(widget.object){
      case "Blinker": return Objects.createBlinker();
      case "Uhr": return Objects.createUhr();
      case "Kröte": return Objects.createKroete();
      case "Bipole": return Objects.createBipole();
      case "Tripole": return Objects.createTripole();
      case "Pulsator": return Objects.createPulsator();
      case "Tümmler": return Objects.createTuemmler();
      case "Oktagon": return Objects.createOktagon();
      case "Gleiter": return Objects.createGleiter();
      case "Segler1": return Objects.createSegler1();
      case "Segler2": return Objects.createSegler2();
      case "Segler3": return Objects.createSegler3();
      case "r-Pentomino": return Objects.createRPentomino();
      default: return (){};
    }
}

  @override
  Widget build(BuildContext context) {
    if(isAnimationActive == false){
    return Container(
        margin: EdgeInsets.only(left: 5, top: 10),
        child: ElevatedButton(
          onPressed: (){
              onPressed();
          },
          child: Text(
            widget.object,
            style: TextStyle(
              color: Colors.green,
              fontSize: 10,
            ),
          ),
          style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900],),
        ),
      );}
      else{
        return Text("");
      }
  }
}

mixin Objects{
  static int start = (columnLength/2).round()*rowLength-(rowLength/2).round();
  static void createBlinker(){
listOfLifes = List.filled(listOfLifes.length, false);
listOfLifes[start] = true;
listOfLifes[start + rowLength] = true;
listOfLifes[start - rowLength] = true;
  }
  static void createUhr(){
listOfLifes = List.filled(listOfLifes.length, false);
listOfLifes[start] = true;
listOfLifes[start - rowLength] = true;
listOfLifes[start + 1 + rowLength] = true;
listOfLifes[start + 1 + 2*rowLength] = true;
listOfLifes[start - 1 + rowLength] = true;
listOfLifes[start + 2] = true;
  }
  static void createKroete(){
listOfLifes = List.filled(listOfLifes.length, false);
listOfLifes[start] = true;
listOfLifes[start - rowLength] = true;
listOfLifes[start -  2*rowLength] = true;
listOfLifes[start - rowLength + 1] = true;
listOfLifes[start + 1] = true;
listOfLifes[start + 1 + rowLength] = true;
  }
  static void createBipole(){
    listOfLifes = List.filled(listOfLifes.length, false);
    listOfLifes[start] = true;
    listOfLifes[start - 1] = true;
    listOfLifes[start - rowLength] = true;
    listOfLifes[start - rowLength - 1] = true;
    listOfLifes[start + rowLength + 1] = true;
    listOfLifes[start + rowLength + 2] = true;
    listOfLifes[start + 2*rowLength + 1] = true;
    listOfLifes[start + 2*rowLength + 2] = true;
  }
  static void createTripole(){
listOfLifes = List.filled(listOfLifes.length, false);
listOfLifes[start + 1] = true;
listOfLifes[start - 1] = true;
listOfLifes[start - 2 - rowLength] = true;
listOfLifes[start - 2 - 2*rowLength] = true;
listOfLifes[start - 2*rowLength - 1] = true;
listOfLifes[start + 2*rowLength + 1] = true;
listOfLifes[start + 2*rowLength + 2] = true;
listOfLifes[start + rowLength + 2] = true;


  }
  static void createPulsator(){
    listOfLifes = List.filled(listOfLifes.length, false);
  }
  static void createTuemmler(){
    listOfLifes = List.filled(listOfLifes.length, false);
  }
  static void createOktagon(){
    listOfLifes = List.filled(listOfLifes.length, false);
    listOfLifes[start - rowLength] = true;
    listOfLifes[start - rowLength + 1] = true;
    listOfLifes[start - 1] = true;
    listOfLifes[start - 1 + rowLength] = true;
    listOfLifes[start + 2*rowLength] = true;
    listOfLifes[start + 2*rowLength + 1] = true;
    listOfLifes[start + 2] = true;
    listOfLifes[start + rowLength + 2] = true;
    listOfLifes[start - 2*rowLength - 1] = true;
    listOfLifes[start - 2*rowLength + 2] = true;
    listOfLifes[start - rowLength - 2] = true;
    listOfLifes[start - rowLength + 3] = true;
    listOfLifes[start + 2*rowLength - 2] = true;
    listOfLifes[start + 2*rowLength + 3] = true;
    listOfLifes[start + 3*rowLength - 1] = true;
    listOfLifes[start + 3*rowLength + 2] = true;
  }
  static void createGleiter(){
   listOfLifes = List.filled(listOfLifes.length, false);
   listOfLifes[1] = true;
   listOfLifes[2*rowLength] = true;
   listOfLifes[2*rowLength + 1] = true;
   listOfLifes[2*rowLength + 2] = true;
   listOfLifes[rowLength + 2] = true; 
  }
  static void createSegler1(){
    listOfLifes = List.filled(listOfLifes.length, false);
    int differentStart = (columnLength/2).round()*rowLength;
    listOfLifes[differentStart -rowLength] = true;
    listOfLifes[differentStart + rowLength] = true;
    listOfLifes[differentStart - 2*rowLength + 1] = true;
    listOfLifes[differentStart - 2*rowLength + 2] = true;
    listOfLifes[differentStart - 2*rowLength + 3] = true;
    listOfLifes[differentStart - 2*rowLength + 4] = true;
    listOfLifes[differentStart - rowLength + 4] = true;
    listOfLifes[differentStart + 4] = true;
    listOfLifes[differentStart + rowLength + 3] = true;

  }
  static void createSegler2(){
    listOfLifes = List.filled(listOfLifes.length, false);
    int differentStart = (columnLength/2).round()*rowLength;
    listOfLifes[differentStart -rowLength] = true;
    listOfLifes[differentStart + rowLength] = true;
    listOfLifes[differentStart - 2*rowLength + 1] = true;
    listOfLifes[differentStart - 2*rowLength + 2] = true;
    listOfLifes[differentStart - 2*rowLength + 3] = true;
    listOfLifes[differentStart - 2*rowLength + 4] = true;
    listOfLifes[differentStart - 2*rowLength + 5] = true;
    listOfLifes[differentStart - rowLength + 5] = true;
    listOfLifes[differentStart + 5] = true;
    listOfLifes[differentStart + rowLength + 4] = true;
    listOfLifes[differentStart + 2*rowLength + 2] = true;
  }
  static void createSegler3(){
    listOfLifes = List.filled(listOfLifes.length, false);
    int differentStart = (columnLength/2).round()*rowLength;
    listOfLifes[differentStart -rowLength] = true;
    listOfLifes[differentStart + rowLength] = true;
    listOfLifes[differentStart - 2*rowLength + 1] = true;
    listOfLifes[differentStart - 2*rowLength + 2] = true;
    listOfLifes[differentStart - 2*rowLength + 3] = true;
    listOfLifes[differentStart - 2*rowLength + 4] = true;
    listOfLifes[differentStart - 2*rowLength + 5] = true;
    listOfLifes[differentStart - 2*rowLength + 6] = true;
    listOfLifes[differentStart - rowLength + 6] = true;
    listOfLifes[differentStart + 6] = true;
    listOfLifes[differentStart + rowLength + 5] = true;
    listOfLifes[differentStart + 2*rowLength + 2] = true;
    listOfLifes[differentStart + 2*rowLength + 3] = true;
  }
  static void createRPentomino(){
    listOfLifes = List.filled(listOfLifes.length, false);
    listOfLifes[start] = true;
    listOfLifes[start - 1] = true;
    listOfLifes[start - rowLength] = true;
    listOfLifes[start - rowLength + 1] = true;
    listOfLifes[start + rowLength] = true;
  }

}