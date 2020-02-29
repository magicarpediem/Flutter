import 'package:color_thief_flutter/color_thief_flutter.dart';
import 'package:color_thief_flutter/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/material.dart';

String maskId(int i) {
  if (i < 10) {
    return '00' + i.toString();
  } else if (i < 100) {
    return '0' + i.toString();
  } else {
    return i.toString();
  }
}

Color getColor() {
  for (int i = 1; i < 810; i++) {
    final imageProvider = AssetImage('images/${maskId(i)}.png');
    Color col = Colors.black;
    getImageFromProvider(imageProvider).then((image) {
      getColorFromImage(image).then((color) {
        col = Color.fromARGB(255, color[0], color[1], color[2]); // [R,G,B]
//        print("{\"id\" : \"" + i.toString() + "\", color : \"" + col.toString() + "\"},");
      });

      getPaletteFromImage(image).then((palette) {
        String str = "{\"id\" : \"" + i.toString() + "\", \"colors\" : [\"";
        for (List<int> color in palette) {
          str = str + Color.fromARGB(255, color[0], color[1], color[2]).toString() + "\", ";
        }
        str = str + "]},";
        print(str); // [[R,G,B]]
      });
    });
  }
  return Color.fromARGB(255, 156, 96, 103);
}

void main() {
  // color_thief_flutter.dart

  // utils.dart

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [getColor(), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),

          //color: col,
          /*border: Border.all(
                  width: 8,
                  color: secondaryColor,
                ),*/
          //borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset('images/012.png'));
  }
}
