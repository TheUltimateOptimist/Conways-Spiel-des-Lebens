import 'dart:io';
import 'package:translate/translate.dart';
void main() async{
  List<String> supportedLanguageCodes = ["en","az","sq","am","ar","hy","af","eu","ba","be","bn","my","bg","bs","cy","hu","vi","ht","gl","nl","el","ka","gu","da","he","yi","id","ga","it","is","es","kk","kn","ca","ky","zh","ko","xh","km","lo","la","lv","lt","lb","mg","ms","ml","mt","mk","mi","mr","mn","de","ne","no","pa","fa","pl","pt","ro","ru","sr","si","sk","sl","sw","su","tg","th","tl","ta","tt","te","tr","uz","uk","ur","fi","fr","hi","hr","cs","sv","gd","et","eo","jv","ja"];
  TranslateIt translator = TranslateIt("trnsl.1.1.20210609T204108Z.ab7d91dde52f9248.4aa8bd9659bad734a3fbd95184d3d579cfc7bbc5");
  List<List<String>> allTextStrings = [
      [
        "gameOfLife",
        "Game Of Life"
      ],
      [
        "startTheAnimationAfterYouHaveChosenSomeStartingCellsOrYouHaveGeneratedThemRandomly",
        "Start the Animation after you have chosen some starting cells or you have generated them randomly"
      ],
      ["description",
      "Das Spiel des Lebens wurde 1970 von dem Mathematiker John Horton Conway(1937-2020) entworfen. Das Spielfeld ist in Zeilen und Spalten eingeteilt und im Idealfall unendlich groß. Jedes Gitterquadrat ist ein zellulärer Automat bzw. eine Zelle, welche entweder lebendig oder tot sein kann. Der Lebenszustand der einzelnen Zellen ändert sich mit jeder Runde abhängig von den Nachbarzellen unter der Befolgung einfacher Regeln. Eine tote Zelle mit genau drei lebenden Nachbarn wird in der Folgegeneration neu geboren. Lebende Zellen mit weniger als zwei lebenden Nachbarn sterben in der Folgegeneration an Einsamkeit. Eine lebende Zelle mit  zwei oder drei lebenden Nachbarn bleibt in der Folgegeneration am Leben. Lebende Zellen mit mehr als drei lebenden Nachbarn sterben in der Folgegeneration an Überbevölkerung. Mit diesen vier einfachen Regeln entsteht aus bestimmten Anfangsmustern im Laufe des Spiels eine Vielzahl komplexer Strukturen. Einige bleiben unverändert, andere oszillieren und wieder andere wachsen oder vergehen. Manche Strukturen, sogenannte Gleiter, bewegen sich auf dem Spielfeld fort. Durch ständiges Ausprobieren verschiedener Anfangskonstellationen lassen sich somit interessante Muster entdecken."
      ],
      [
        "enterTheNumberOfLivingCells",
        "Enter the Number of living cells"
      ],
      ["livingCells",
      "living cells"
      ],
      ["save",
      "Save"
      ],
      ["back",
      "Back"
      ]
  ];
   //create en arb file
   List<String> stringList = List.empty(growable: true);
   stringList.add("{");
   for(int i = 0; i < allTextStrings.length; i++){
     String s1 = allTextStrings[i][0];
     String s2 = allTextStrings[i][1];
     if(i == 0){
        stringList.add('\n  "$s1": "$s2",\n  "@$s1":{\n    "description": "$s2"\n  }');
     }else{
        stringList.add(',\n  "$s1": "$s2",\n  "@$s1":{\n    "description": "$s2"\n  }');
}
   }
   stringList.add('\n}');
   new File('l10n/1_en.arb').writeAsString(stringList.join());
   print("Hello");

   //create remaining files
  for(int i = 1; i < supportedLanguageCodes.length; i++){
     List<String> specificStringList = List.empty(growable: true);
     specificStringList.add("{");
     for(int j = 0; j < allTextStrings.length; j++){
       String specificString1 = allTextStrings[j][0];
       String specificString2 = (await translator.translate(allTextStrings[j][1], supportedLanguageCodes[i]))["text"];
       if(j == 0){
         specificStringList.add('\n  "$specificString1": "$specificString2"');
       }
       else{
       specificStringList.add(',\n  "$specificString1": "$specificString2"');
       }
       print((((i*allTextStrings.length + j)/(allTextStrings.length*supportedLanguageCodes.length)*10000).round()/100).toString() + "%");

     }
     specificStringList.add("\n}");
     new File('l10n/' + (i + 1).toString() + '_' + supportedLanguageCodes[i] + '.arb').writeAsString(specificStringList.join());
   }
}