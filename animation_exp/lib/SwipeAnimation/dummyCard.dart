
import 'package:flutter/material.dart';

Positioned cardDemoDummy(
    DecorationImage img,
    double bottom,
    double right,
    double left,
    double cardWidth,
    double rotation,
    double skew,
    BuildContext context) {
  Size screenSize = MediaQuery.of(context).size;
  // Size screenSize=(500.0,200.0);
  // print("dummyCard");
  return new Positioned(
    bottom: 100.0 + bottom,
    // right: flag == 0 ? right != 0.0 ? right : null : null,
    //left: flag == 1 ? right != 0.0 ? right : null : null,
    child: new Card(
      color: Colors.transparent,
      elevation: 4.0,
      child: new Container(
        alignment: Alignment.center,
        width: screenSize.width / 1.2 + cardWidth,
        height: screenSize.height / 1.7,
        decoration: new BoxDecoration(
          color: Colors.white,
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
                height: screenSize.height / 1.7 - screenSize.height / 2.2,
                alignment: Alignment.center,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                new RaisedButton(
                padding: new EdgeInsets.all(0.0),
                onPressed: () {},
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
                    size: 55.0,
                  ),
                )),

        /* new RaisedButton(                         //Refresh button for later
                                  padding: new EdgeInsets.all(0.0),
                                  onPressed: () {},
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
*/
        new RaisedButton(
            padding: new EdgeInsets.all(0.0),
            onPressed: (){},
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
            onPressed: (){},
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
                Icons.favorite ,
                //Icons.insert_invitation,
                color: Colors.green,
                size: 55.0,
              ),
            )),
                          /*
                          child: new Text(
                            "I'M IN",
                            style: new TextStyle(color: Colors.white),
                          ),
                        ))*/
                  ],
                ))
          ],
        ),
      ),
    ),
  );
}


