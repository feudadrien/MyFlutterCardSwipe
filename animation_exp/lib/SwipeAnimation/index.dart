import 'dart:async';
import 'package:animation_exp/SwipeAnimation/data.dart';
import 'package:animation_exp/SwipeAnimation/dummyCard.dart';
import 'package:animation_exp/SwipeAnimation/activeCard.dart';

//import 'package:animation_exp/PageReveal/page_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class CardDemo extends StatefulWidget {
  @override
  CardDemoState createState() => new CardDemoState();
}

class CardDemoState extends State<CardDemo> with TickerProviderStateMixin {
  AnimationController _buttonController;
  Animation<double> rotate;
  Animation<double> right;
  Animation<double> bottom;
  Animation<double> width;
  int flag = 0;

  List data = imageData;
  List selectedData = [];
  void initState() {
    super.initState();

    _buttonController = new AnimationController(
        duration: new Duration(milliseconds: 1000), vsync: this);

    rotate = new Tween<double>(
      begin: -0.0,
      end: -40.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    rotate.addListener(() {
      setState(() {
        if (rotate.isCompleted) {
          var i = data.removeLast();
          data.insert(0, i);

          _buttonController.reset();
        }
      });
    });

    right = new Tween<double>(
      begin: 0.0,
      end: 400.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    bottom = new Tween<double>(
      begin: 15.0,
      end: 100.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.ease,
      ),
    );
    width = new Tween<double>(
      begin: 20.0,
      end: 25.0,
    ).animate(
      new CurvedAnimation(
        parent: _buttonController,
        curve: Curves.bounceOut,
      ),
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  Future<Null> _swipeAnimation() async {
    try {
      await _buttonController.forward();
    } on TickerCanceled {}
  }

  dismissImg(DecorationImage img) {
    setState(() {
      data.remove(img);
    });
  }

  addImg(DecorationImage img) {
    setState(() {
      data.remove(img);
      selectedData.add(img);
    });
  }

  swipeRight() {
    if (flag == 0)
      setState(() {
        flag = 1;
      });
    _swipeAnimation();
  }

  swipeLeft() {
    if (flag == 1)
      setState(() {
        flag = 0;
      });
    _swipeAnimation();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.4;

    double initialBottom = 15.0;
    var dataLength = data.length;
    double backCardPosition = initialBottom + (dataLength - 1) * 10 + 10;
    double backCardWidth = -10.0;
    return (new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          backgroundColor: new Color.fromRGBO(255, 255, 255, 1.0),
          centerTitle: true,
          leading: new Container(
            margin: const EdgeInsets.all(15.0),
            child: new Icon(
              Icons.account_circle ,
              //Icons.delete_forever,
              color: Colors.grey,
              //color: new Color.fromRGBO(247, 123, 20, 1.0),
              size: 45.0,
            ),
          ),
          actions: <Widget>[
            new GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context,
                //     new MaterialPageRoute(
                //         builder: (context) => new PageMain()));
              },
              child: new Container(
                  margin: const EdgeInsets.all(15.0),
                  child: new Icon(
                    Icons.message,
                    color: Colors.grey,
                    //color: new Color.fromRGBO(27,67,131,1.0),
                    size: 45.0,
                  )),
            ),
          ],
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
/*              new Text(                   //The Text in Center
                "MK",
                style: new TextStyle(
                    color: new Color.fromRGBO(247, 123, 20, 1.0),
                    fontSize: 30.0,
                    letterSpacing: 3.5,
                    fontWeight: FontWeight.bold),
              ),*/
              new Image.asset(
                'assets/img6.jpg',
                height: 100.0,
                width: 225.0,
                alignment: Alignment.center,
              ),
              /*new Container(              //The Number of Cards
                width: 20.0,
                height: 20.0,
                margin: new EdgeInsets.only(bottom: 20.0),
                alignment: Alignment.center,
                child: new Text(
                  dataLength.toString(),
                  style: new TextStyle(fontSize: 13.0),
                ),
                decoration: new BoxDecoration(
                    color: Colors.red, shape: BoxShape.circle),
              )*/
            ],
          ),
        ),
        body: new Container(
          color: new Color.fromRGBO(255, 255, 255, 1.0),
          alignment: Alignment.center,
          child: dataLength > 0
              ? new Stack(
              alignment: AlignmentDirectional.center,
              children: data.map((item) {
                if (data.indexOf(item) == dataLength - 1) {
                  return cardDemo(
                      item,
                      bottom.value,
                      right.value,
                      0.0,
                      backCardWidth + 10,
                      rotate.value,
                      rotate.value < -10 ? 0.1 : 0.0,
                      context,
                      dismissImg,
                      flag,
                      addImg,
                      swipeRight,
                      swipeLeft);
                } else {
                  backCardPosition = backCardPosition - 10;
                  backCardWidth = backCardWidth + 10;

                  return cardDemoDummy(item, backCardPosition, 0.0, 0.0,
                      backCardWidth, 0.0, 0.0, context);
                }
              }).toList())
              : new Text("Come Back Later :(",
              style: new TextStyle(color: new Color.fromRGBO(247, 123, 20, 1.0), fontSize: 50.0)),
        )));
  }
}

