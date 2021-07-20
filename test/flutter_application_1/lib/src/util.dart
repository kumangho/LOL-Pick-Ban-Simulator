import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/list.dart';

// ignore: non_constant_identifier_names
Color MainColor = Color(0xff060F14);
// ignore: non_constant_identifier_names
Color SubColor = Color(0xFFC8AA6E);

ScrollController _scrollController;
Color caughtColor = Colors.red;
List _targetImage = List<String>.filled(10, null, growable: false);
List _bluPlayer =
    List<String>.filled(5, "assets/images/champion_icon.jpg", growable: false);
List _redPlayer =
    List<String>.filled(5, "assets/images/champion_icon.jpg", growable: false);
List redTeam = List<String>.filled(5, null, growable: false);
List bluTeam = List<String>.filled(5, null, growable: false);
int variableSet = 0;
double width;
double height;

Container ChampionGrid(List _image) {
  return Container(
    child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          childAspectRatio: 4 / 4.5,
        ),
        itemCount: _image.length,
        itemBuilder: (context, index) => GridTile(
              child: LongPressDraggable(
                data: _image[index],
                feedback: Container(
                  child: Image.asset(_image[index],
                      fit: BoxFit.cover, height: 100, width: 80),
                  decoration: myBoxDecoration(),
                ),
                child: Container(
                    child: Image.asset(_image[index],
                        fit: BoxFit.cover, height: height, width: width),
                    decoration: myBoxDecoration()),
              ),
            )),
    decoration: myBoxDecoration(),
  );
}

// ignore: non_constant_identifier_names
Container BanContainer(int n) {
  return Container(
      child: DragTarget<String>(
        onAccept: (value) {
          _targetImage[n] = value;
        },
        builder: (_, candidateData, rejectedData) {
          print(_targetImage[n]);
          return Container(
            width: 35.1,
            height: 48,
            alignment: Alignment.center,
            child: _targetImage[n] != null
                ? Image.asset(
                    _targetImage[n],
                    fit: BoxFit.cover,
                  )
                : Container(),
          );
        },
      ),
      width: 35.1,
      height: 45,
      alignment: Alignment.center,
      decoration: myBoxDecoration());
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: MainColor,
    border: Border.all(color: SubColor),
  );
}

BoxDecoration myTabBoxDecoration() {
  return BoxDecoration(border: Border.all(color: SubColor));
}

Container ChampContainer() {
  return Container(
      decoration: BoxDecoration(
          color: MainColor,
          border: Border.all(color: SubColor),
          image: DecorationImage(
              image: new AssetImage('assets/images/champion_icon.jpg'),
              fit: BoxFit.scaleDown)));
}

// ignore: non_constant_identifier_names
Container PlayerContainer(int n, String team, savedTeam) {
  return Container(
    width: 105.7,
    height: 65,
    child: DragTarget<String>(onAccept: (value) {
      team = value;
      savedTeam = value;
    }, builder: (_, candidateData, rejectedData) {
      return Stack(
        children: [
          ChampContainer(),
          Container(
              width: 105.7,
              height: 65,
              alignment: Alignment.center,
              child: team != null //1)
                  ? Image.asset(team, fit: BoxFit.cover)
                  : Container()),
          Container(
            child: LongPressDraggable(
              data: team,
              feedback: Container(
                child: Image.asset(team, //2)
                    fit: BoxFit.cover,
                    height: 65,
                    width: 105.7),
              ),
              child: Container(
                  child: Image.asset(team, //3)
                      fit: BoxFit.cover,
                      height: 65,
                      width: 105.7)),
              onDragCompleted: () {
                if (team != savedTeam) {
                  print("hello");
                } else
                  print("object");
                return ChampContainer();
              },
            ),
          ),
          Positioned(
            right: 5,
            bottom: 15,
            child: Container(
              padding: EdgeInsets.all(10),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: new AssetImage(Champions.lines[n]),
                      fit: BoxFit.scaleDown)),
            ),
          )
        ],
      );
    }),
    decoration: myBoxDecoration(),
  );
}

// ignore: non_constant_identifier_names
TextStyle TeamColor(Color selectedColor) {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 25,
      color: selectedColor);
}
