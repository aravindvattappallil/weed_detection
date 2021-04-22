import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = true;
  File _image;
  List _output;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/weed_model1.tflite', labels: 'assets/weed-label.txt');
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    setState(() {
      _output = output;
      _loading = false;
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });

    classifyImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });

    classifyImage(_image);
  }

  @override
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
                          : Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 250,
                                    child: Image.file(_image),
                                  ),
                                  SizedBox(height: 10),
                                  _output != null
                                      ? Text(
                                          '${_output[0]['label']}',
                                          style: TextStyle(
                                              color: Color(0xFF64DD17),
                                              fontWeight: FontWeight.w900,
                                              fontSize: 20),
                                        )
                                      : Container(),
                                  SizedBox(height: 15),
                                ],
                              ),
                            )),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: pickGalleryImage,
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
                          onTap: pickImage,
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
