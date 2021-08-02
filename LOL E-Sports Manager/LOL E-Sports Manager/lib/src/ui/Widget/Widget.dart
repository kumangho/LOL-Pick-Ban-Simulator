import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/list.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/getx/getx.dart';

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    color: mainColor,
    border: Border.all(color: subColor),
  );
}

TextStyle nameTextField() {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: displayRatio * 4,
      color: subColor);
}

TextStyle titleLogo(multiple, color, style) {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: style,
      fontSize: displayRatio * multiple,
      color: color);
}

Widget basicAppBar() {
  return AppBar(
      iconTheme: IconThemeData(color: subColor),
      toolbarHeight: displayHeight * 0.05,
      title: Text(
        "LOL: E-Sports Manager",
        style: TextStyle(color: subColor, fontSize: displayRatio * 8),
      ),
      brightness: Brightness.dark,
      backgroundColor: mainColor);
}

BoxDecoration myTextBoxDecoration(double width, double radius) {
  return BoxDecoration(
      color: mainColor,
      border: Border.all(color: subColor, width: width),
      borderRadius: BorderRadius.all(Radius.circular(radius)));
}

TextStyle teamColor(Color selectedColor) {
  return TextStyle(
      fontFamily: 'SegoeUI',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: displayRatio * 7,
      color: selectedColor);
}

Widget basicDrawer() {
  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(color: mainColor)),
      ListTile(
        leading: Icon(
          Icons.delete_forever_outlined,
          size: displayRatio * 20,
          color: mainColor,
        ),
        title: Text(
          'Delete All',
        ),
        trailing: Icon(
          Icons.drag_handle,
          size: displayRatio * 20,
          color: mainColor,
        ),
        dense: true,
        onTap: () {},
      ),
    ],
  ));
}

Widget gridContainer(con) {
  if (con != champIcon) {
    champName = con.substring(47).replaceAll('.jpg', '');
  }
  return Stack(children: [
    greyOutChampContainer(con),
    Container(
        width: displayWidth * 0.2,
        height: displayHeight * 0.1,
        child: Image.asset(con, fit: BoxFit.cover),
        decoration: myBoxDecoration())
  ]);
}

Widget teamName(Color selectColors, String hintText) {
  return Container(
    width: displayWidth * 0.427,
    height: displayHeight * 0.05,
    alignment: Alignment.center,
    decoration: myBoxDecoration(),
    child: TextField(
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
          hintStyle: teamColor(selectColors),
          hintText: hintText,
          contentPadding: EdgeInsets.all(7)),
      style: teamColor(selectColors),
    ),
  );
}

Widget playerName(String text) {
  return Container(
    height: 11,
    width: displayRatio * 40,
    child: TextField(
      decoration: new InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: text,
        hintStyle: nameTextField(),
      ),
      textAlign: TextAlign.right,
      style: nameTextField(),
    ),
  );
}

Widget feedbackContainer(dynamic com) {
  return Container(
      width: displayWidth * 0.2,
      height: displayHeight * 0.12,
      decoration: new BoxDecoration(
        color: mainColor,
        border: Border.all(color: subColor, width: 3),
        image: DecorationImage(image: AssetImage(com), fit: BoxFit.cover),
      ));
}

BoxDecoration myTabBoxDecoration() {
  return BoxDecoration(border: Border.all(color: subColor), color: mainColor);
}

// ignore: non_constant_identifier_names
Widget ChampContainer2() {
  return Container(
      decoration: BoxDecoration(
          color: mainColor,
          image: DecorationImage(
            image: new AssetImage(champIcon),
            fit: BoxFit.scaleDown,
          )));
}

Widget greyOutChampContainer(dynamic champ) {
  return Container(
      foregroundDecoration: BoxDecoration(
        color: Colors.grey,
        backgroundBlendMode: BlendMode.saturation,
      ),
      decoration: BoxDecoration(
          color: mainColor,
          image: DecorationImage(
            image: new AssetImage(champ),
            fit: BoxFit.cover,
          )));
}

DecorationImage imageMaker(dynamic champ) {
  return DecorationImage(image: new AssetImage(champ), fit: BoxFit.cover);
}

Widget countryTextContainer(String country) {
  if (country == 'lck') {
    country = "한국";
  } else if (country == 'lpl') {
    country = '중국';
  } else if (country == 'lec') {
    country = '유럽';
  } else if (country == 'lcs') {
    country = '북미';
  } else if (country == 'ljl') {
    country = '일본';
  } else if (country == 'tcl') {
    country = '터키';
  } else if (country == 'tcl') {
    country = '터키';
  } else if (country == 'cblol') {
    country = '브라질';
  } else if (country == 'lco') {
    country = '오세아니아';
  } else if (country == 'lla') {
    country = '라틴아메리카';
  } else if (country == 'lcl') {
    country = '독립국가연합';
  }

  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.fromLTRB(
        displayWidth * 0.04, 0, displayWidth * 0.05, displayHeight * 0.01),
    child: Text(
      country,
      style: titleLogo(displayRatio * 4, subColor, FontStyle.normal),
    ),
  );
}