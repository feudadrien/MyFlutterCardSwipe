import 'dart:math';

import 'package:animation_exp/SwipeAnimation/detail.dart';
import 'package:flutter/material.dart';

Positioned cardDemo(
    DecorationImage img,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context,
    Function dismissImg,
    int flag,
    Function addImg,
    Function swipeRight,
    Function swipeLeft) {
  Size screenSize = MediaQuery.of(context).size;
  // print("Card");
  return new Positioned(
    bottom: 100.0 + bottom,
    right: flag == 0 ? right != 0.0 ? right : null : null,
    left: flag == 1 ? right != 0.0 ? right : null : null,
    child: new Dismissible(
      key: new Key(new Random().toString()),
      crossAxisEndOffset: -0.3,
      onResize: () {
        //print("here");
        // setState(() {
        //   var i = data.removeLast();

        //   data.insert(0, i);
        // });
      },
      onDismissed: (DismissDirection direction) {
//          _swipeAnimation();
        if (direction == DismissDirection.endToStart)
          dismissImg(img);
        else
          addImg(img);
      },
      child: new Transform(
        alignment: flag == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
        //transform: null,
        transform: new Matrix4.skewX(skew),
        //..rotateX(-math.pi / rotation),
        child: new RotationTransition(
          turns: new AlwaysStoppedAnimation(
              flag == 0 ? rotation / 360 : -rotation / 360),
          child: new Hero(
            tag: "img",
            child: new GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     new MaterialPageRoute(
                //         builder: (context) => new DetailPage(type: img)));
                Navigator.of(context).push(new PageRouteBuilder(
                      pageBuilder: (_, __, ___) => new DetailPage(type: img),
                    ));
              },
              child: new Card(
                color: Colors.transparent,
                elevation: 4.0,
                child: new Container(
                  alignment: Alignment.center,
                  width: screenSize.width / 1.2 + cardWidth,
                  height: screenSize.height / 1.7,
                  decoration: new BoxDecoration(
                    color: new Color.fromRGBO(255, 255, 255, 1.0),
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width: screenSize.width / 1.2 + cardWidth,
                        height: screenSize.height / 2.2,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.only(
                              topLeft: new Radius.circular(8.0),
                              topRight: new Radius.circular(8.0)),
                          image: img,
                        ),
                      ),
                      new Container(
                          width: screenSize.width / 1.2 + cardWidth,
                          height:
                              screenSize.height / 1.7 - screenSize.height / 2.2,
                          alignment: Alignment.center,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[


                              new RaisedButton(
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: () {
                                    swipeLeft();
                                  },
                                  elevation: 2.0,
                                  color: Colors.white,
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(60.0)),
                                  child: new Container(
                                    height: 60.0,
                                    width: 60.0,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      new BorderRadius.circular(60.0),
                                    ),
                                    child: new Icon(
                                      Icons.clear,
                                      //Icons.delete_forever,
                                      color: Colors.red,
                                      size: 45.0,
                                    ),
                                  )),

                              new RaisedButton(
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: () {
                                    swipeLeft();
                                  },
                                  elevation: 2.0,
                                  color: Colors.white,
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(90.0)),
                                  child: new Container(
                                    height: 40.0,
                                    width: 40.0,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      new BorderRadius.circular(100.0),
                                    ),
                                    child: new Icon(
                                      Icons.refresh,
                                      color: Colors.yellow,
                                      size: 30.0,
                                    ),
                                  )),

                              new RaisedButton(
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: (){
                                    swipeRight();
                                  },
                                  elevation: 2.0,
                                  color: Colors.white,
                                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(90.0)),
                                  child: new Container(
                                    height: 40.0,
                                    width: 40.0,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      new BorderRadius.circular(60.0),
                                    ),
                                    child: new Icon(
                                      Icons.snooze,
                                      color: Colors.blue,
                                      size: 30.0,
                                    ),
                                  )),

                              new RaisedButton(
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: (){
                                    swipeRight();
                                  },
                                  elevation: 2.0,
                                  color: Colors.white,
                                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(60.0)),
                                  child: new Container(
                                    height: 60.0,
                                    width: 60.0,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                      new BorderRadius.circular(60.0),
                                    ),
                                    child: new Icon(
                                      Icons.favorite,
                                      //Icons.insert_invitation,
                                      color: Colors.green,
                                      size: 45.0,
                                    ),
                                  ))
                              /*
                              new FlatButton(                  // Original Button
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: () {
                                    swipeRight();
                                  },
                                  child: new Container(
                                    height: 60.0,
                                    width: 60.0,
                                    alignment: Alignment.center,
                                    decoration: new BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          new BorderRadius.circular(60.0),
                                    ),
                                    child: new Text(
                                      "GOING",
                                      style: new TextStyle(color: Colors.white),
                                    ),
                                  ))*/
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
