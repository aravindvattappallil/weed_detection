import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  bool _loading = true;
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color(0xFF000000),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 80),
                  Text("Weed Detection ",
                      style: TextStyle(
                          color: Color(0xFF64DD17),
                          fontWeight: FontWeight.w900,
                          fontSize: 45)),
                  SizedBox(height: 40),
                  Text("Description",
                      style: TextStyle(
                          color: Color(0xFF64DD17),
                          fontWeight: FontWeight.w900,
                          fontSize: 20)),
                  SizedBox(height: 40),
                  Center(
                      child: _loading
                          ? Container(
                              width: 360,
                              child: Column(
                                children: <Widget>[
                                  Image.asset("assets/wdlogo.png"),
                                  SizedBox(
                                    height: 50,
                                  )
                                ],
                              ))
                          : Container()),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 17),
                            decoration: BoxDecoration(
                              color: Color(0xFF64DD17),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text("Up load",
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15)),
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: MediaQuery.of(context).size.width - 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 17),
                            decoration: BoxDecoration(
                              color: Color(0xFF64DD17),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text("Camera",
                                style: TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 15)),
                          ),
                        )
                      ],
                    ),
                  )
                ])));
  }
}
