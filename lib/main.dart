import 'dart:async';

import 'package:conways_spiel_des_lebens/infoScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'objects.dart';

int rowLength = 15;
int columnLength = 20;
List<bool> listOfLifes = List.filled(15 * 20, false);
List<bool> compareListOfLifes = List.filled(rowLength * columnLength, false);
bool isAnimationActive = false;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Conway's Spiel des Lebens",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> rowChildren = List.empty(growable: true);
  List<Widget> columnChildren = List.empty(growable: true);
  TextEditingController controller = TextEditingController();
  double changesPerSecond = 1.0;
  Timer timer = Timer.periodic(Duration(seconds: 1), (timer) {});
  int mutations = 0;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
        Duration(microseconds: (1000000 / changesPerSecond).round()), (timer) {
      if (isAnimationActive == true) {
        setState(() {
          updateLifeStatuses();
          mutations = mutations + 1;
        });
      }
      else{
        setState(() {
          
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10, bottom: 2),
              child: IconButton(
                icon: Icon(
                  Icons.info,
                  color: Colors.green,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
          title: Text(
            "Conways Spiel des Lebens",
            style: GoogleFonts.indieFlower(
                fontSize: 26, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueGrey[900],
          toolbarHeight: 70,
        ),
        backgroundColor: Colors.black,
        body: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            descrption(),
            Container(
              height: 45,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  playButton(),
                  randomButton(),
                  ObjectButton(object: "Blinker", onPressed: (){setState(() {
                    listOfLifes = listOfLifes;
                  });},),
                  ObjectButton(object: "Uhr", onPressed: (){setState(() {
                    listOfLifes = listOfLifes;
                  });},),
                  ObjectButton(object: "Kröte", onPressed: (){setState(() {
                    listOfLifes = listOfLifes;
                  });},),
                  ObjectButton(object: "Bipole", onPressed: (){setState(() {
                    listOfLifes = listOfLifes;
                  });},),
                  ObjectButton(object: "Tripole", onPressed: (){setState(() {
                    listOfLifes = listOfLifes;
                  });},),
                  //ObjectButton(object: "Pulsator", onPressed: (){setState(() {
                   // listOfLifes = listOfLifes;
                 // });},),
                  //ObjectButton(object: "Tümmler", onPressed: (){setState(() {
                  //  listOfLifes = listOfLifes;
                 // });},),
                  ObjectButton(object: "Oktagon", onPressed: (){setState(() {
                    listOfLifes = listOfLifes;
                  });},),
                  ObjectButton(object: "Gleiter", onPressed: (){setState(() {
                    listOfLifes = listOfLifes;
                  });},),
                  ObjectButton(object: "Segler1", onPressed: (){setState(() {
                    listOfLifes = listOfLifes;
                  });},),
                  ObjectButton(object: "Segler2", onPressed: (){setState(() {
                    listOfLifes = listOfLifes;
                  });},),
                  ObjectButton(object: "Segler3", onPressed: (){setState(() {
                    listOfLifes = listOfLifes;
                  });},),
                  ObjectButton(object: "r-Pentomino", onPressed: (){setState(() {
                    listOfLifes = listOfLifes;
                  });},),
                ],
              ),
            ),
            Container(
              child: constructField(),
              margin: EdgeInsets.only(left: 15, top: 15),
            ),
          ],
        ),
      ),
    );
  }

  descrption() {
    if (isAnimationActive == false) {
      return Container(
        margin: EdgeInsets.only(left: 15, top: 20),
        child: SizedBox(
            child: Text(
          "Wähle Anfangskästchen aus oder generiere sie zufällig und starte die Animation",
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        )),
      );
    } else {
      return Container(
          child: Slider(
              activeColor: Colors.green,
              inactiveColor: Colors.blueGrey[900],
              min: 1,
              max: 10,
              divisions: 9,
              value: changesPerSecond,
              onChanged: (double newValue) {
                changesPerSecond = newValue;
                print(changesPerSecond);
                timer.cancel();
                timer = Timer.periodic(
                    Duration(
                        microseconds: (1000000 / changesPerSecond).round()),
                    (timer) {
                  if (isAnimationActive == true) {
                    setState(() {
                      updateLifeStatuses();
                      mutations = mutations + 1;
                    });
                  }
                });
              }));
    }
  }

  playButton() {
    IconData icon;
    Function onPressed;
    if (isAnimationActive == true) {
      icon = Icons.stop_circle;
      onPressed = () {
        setState(() {
          isAnimationActive = false;
          for (int i = 0; i < listOfLifes.length; i++) {
            listOfLifes[i] = false;
          }
          mutations = 0;
        });
      };
    } else {
      icon = Icons.play_arrow;
      onPressed = () {
        setState(() {
          isAnimationActive = true;
        });
      };
    }
    return Container(
      margin: EdgeInsets.only(left: 15, top: 10),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        child: Icon(
          icon,
          color: Colors.green,
          size: 20,
        ),
        style: ElevatedButton.styleFrom(primary: Colors.blueGrey[900]),
      ),
    );
  }

  randomButton() {
    if (isAnimationActive == true) {
      return Container(
        margin: EdgeInsets.only(top: 10, left: 15),
        child: Text(
          mutations.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(left: 5, top: 10),
        child: ElevatedButton(
          onPressed: () {
            showDialog(context: context, builder: (_) => alertDialog())
                .then((value) {
              if (value != -1) {
                setState(() {
                  selectRandom(value);
                });
              }
            });
          },
          child: Text(
            "Random",
            style: TextStyle(
              color: Colors.green,
              fontSize: 10,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey[900],
          ),
        ),
      );
    }
  }

  Column constructField() {
    columnChildren = [];
    for (int i = 0; i < columnLength; i++) {
      rowChildren = [];
      for (int j = 0; j < rowLength; j++) {
        rowChildren.add(specificField(i * rowLength + j));
      }
      columnChildren.add(Row(
        children: rowChildren,
      ));
    }
    return Column(
      children: columnChildren,
    );
  }

  specificField(int index) {
    double fieldWidth = (MediaQuery.of(context).size.width - 30) / rowLength;
    Color primary;
    if (listOfLifes[index] == true) {
      primary = Colors.red;
    } else {
      primary = Colors.transparent;
    }
    return Container(
      height: fieldWidth,
      width: fieldWidth,
      child: ElevatedButton(
        child: Text(""),
        onPressed: () {
          onPressed(index);
        },
        style: ElevatedButton.styleFrom(
          primary: primary,
          side: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void onPressed(int index) {
    if (isAnimationActive != true) {
      if (listOfLifes[index] == true) {
        setState(() {
          listOfLifes[index] = false;
        });
      } else {
        setState(() {
          listOfLifes[index] = true;
        });
      }
    } else {}
  }

  selectRandom(int livingCells) {
    int randomIndex = 0;
    Random randomGenerator = Random();
    for (int m = 0; m < listOfLifes.length; m++) {
      if (listOfLifes[m] == true) {
        listOfLifes[m] = false;
      }
    }
    List<int> livingCellsList = List.empty(growable: true);
    for (int i = 0; i < livingCells; i++) {
      do {
        randomIndex = randomGenerator.nextInt(listOfLifes.length);
      } while (livingCellsList.contains(randomIndex));
      listOfLifes[randomIndex] = true;
      livingCellsList.add(randomIndex);
    }
    setState(() {
      listOfLifes = listOfLifes;
    });
  }

  AlertDialog alertDialog() {
    return AlertDialog(
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, int.parse(controller.text));
          },
          child: Text(
            "Save",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context, -1);
          },
          child: Text(
            "Back",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
        ),
      ],
      backgroundColor: Colors.blueGrey[900],
      title: Text(
        "Enter the number of living cells",
        style: TextStyle(
          color: Colors.green,
          fontSize: 20,
        ),
      ),
      content: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          hintText: "living cells",
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  void updateLifeStatuses() {
    for (int i = 0; i < listOfLifes.length; i++) {
      compareListOfLifes[i] = listOfLifes[i];
    }
    for (int i = 0; i < listOfLifes.length; i++) {
      //a dead cell with three neighbours is reborn next round
      if (compareListOfLifes[i] == false && livingNeighbourCells(i) == 3) {
        listOfLifes[i] = true;
      }

      //living cells with less than two living neighbours die next round
      if (compareListOfLifes[i] == true && livingNeighbourCells(i) < 2) {
        listOfLifes[i] = false;
      }

      //a living cell with two or three living neighbours stays alive next round
      if (compareListOfLifes[i] == true &&
          (livingNeighbourCells(i) == 2 || livingNeighbourCells(i) == 3)) {
        listOfLifes[i] = true;
      }

      //a living cell with more than three living neighbours dies next round
      if (compareListOfLifes[i] == true && livingNeighbourCells(i) > 3) {
        listOfLifes[i] = false;
      }
    }
  }

  int livingNeighbourCells(int index) {
    ///number of living neighbour cells
    int livingNeighbours = 0;

    ///reflects what cell is beeing looked at
    ///
    ///1: first row left
    ///
    ///2: first row middle
    ///
    ///3: first row right
    ///
    ///4: middle row left
    ///
    ///5: middle row middle
    ///
    ///6: middle row right
    ///
    ///7: last row left
    ///
    ///8: last row middle
    ///
    ///9: last row right
    int cellType = 0;

    //check for the different cellTypes
    if (Test.isFirstRow(index) == true) {
      if (Test.hasLeftNeighbour(index) == false) {
        cellType = 1;
      } else if (Test.hasLeftNeighbour(index) == false) {
        cellType = 3;
      } else {
        cellType = 2;
      }
    } else if (Test.isMiddleRow(index) == true) {
      if (Test.hasLeftNeighbour(index) == false) {
        cellType = 4;
      } else if (Test.hasRightNeighbour(index) == false) {
        cellType = 6;
      } else {
        cellType = 5;
      }
    } else if (Test.isLastRow(index) == true) {
      if (Test.hasLeftNeighbour(index) == false) {
        cellType = 7;
      } else if (Test.hasRightNeighbour(index) == false) {
        cellType = 9;
      } else {
        cellType = 8;
      }
    }

    int left = index - 1;
    int right = index + 1;
    int topLeft = index - rowLength - 1;
    int topRight = index - rowLength + 1;
    int top = index - rowLength;
    int bottom = index + rowLength;
    int bottomRight = index + rowLength + 1;
    int bottomLeft = index + rowLength - 1;

    //calculate the neighbours dependent on the cellType
    switch (cellType) {
      case 1:
        livingNeighbours = calculateNeightbours([right, bottomRight, bottom]);
        break;
      case 2:
        livingNeighbours = calculateNeightbours(
            [right, bottomRight, bottom, bottomLeft, left]);
        break;
      case 3:
        livingNeighbours = calculateNeightbours([bottom, bottomLeft, left]);
        break;
      case 4:
        livingNeighbours =
            calculateNeightbours([top, topRight, right, bottomRight, bottom]);
        break;
      case 5:
        livingNeighbours = calculateNeightbours([
          top,
          topRight,
          right,
          bottomRight,
          bottom,
          bottomLeft,
          left,
          topLeft
        ]);
        break;
      case 6:
        livingNeighbours =
            calculateNeightbours([top, bottom, bottomLeft, left, topLeft]);
        break;
      case 7:
        livingNeighbours = calculateNeightbours([top, topRight, right]);
        break;
      case 8:
        livingNeighbours =
            calculateNeightbours([left, topLeft, top, topRight, right]);
        break;
      case 9:
        livingNeighbours = calculateNeightbours([left, topLeft, top]);
        break;
      default:
        livingNeighbours = 0;
    }
    return livingNeighbours;
  }

  calculateNeightbours(List<int> indexes) {
    int livingNeighbours = 0;
    for (int i = 0; i < indexes.length; i++) {
      if (compareListOfLifes[indexes[i]] == true) {
        livingNeighbours = livingNeighbours + 1;
      }
    }
    return livingNeighbours;
  }
}

mixin Test {
  static bool isFirstRow(int index) {
    if (index < rowLength) {
      return true;
    } else {
      return false;
    }
  }

  static bool hasLeftNeighbour(int index) {
    if (index % rowLength == 0) {
      return false;
    } else {
      return true;
    }
  }

  static bool hasRightNeighbour(int index) {
    if ((index - (rowLength - 1)) % rowLength == 0) {
      return false;
    } else {
      return true;
    }
  }

  static bool isMiddleRow(int index) {
    if (index >= rowLength && index < rowLength * columnLength - rowLength) {
      return true;
    } else {
      return false;
    }
  }

  static bool isLastRow(int index) {
    if (index >= rowLength * columnLength - rowLength) {
      return true;
    } else {
      return false;
    }
  }
}
