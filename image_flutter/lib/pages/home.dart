import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _imageFile;

  void _imgFromGalery() async {
    try {
      var imagePicker = ImagePicker();
      var imageSelected =
          await imagePicker.getImage(source: ImageSource.gallery);

      setState(() {
        _imageFile = File(imageSelected.path);
      });
    } catch (error) {}
  }

  void _imgFromCamera() async {
    try {
      var imagePicker = ImagePicker();
      var imageSelected =
          await imagePicker.getImage(source: ImageSource.camera);

      setState(() {
        _imageFile = File(imageSelected.path);
      });
    } catch (error) {}
  }

  Widget _imgOuIcon() {
    if (_imageFile == null) {
      return Container(
        height: 350,
        margin: EdgeInsets.only(top: 23),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 110),
              alignment: Alignment.center,
              child: Icon(
                Icons.add_a_photo_outlined,
                size: 75,
                color: Colors.white,
              ),
            ),
            Text(
              'Escolha uma imagem',
              style: TextStyle(fontSize: 17, color: Colors.white),
            )
          ],
        ),
      );
    } else {
      return Container(
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          child: Image.file(
            _imageFile,
            width: double.infinity,
            height: 350,
            fit: BoxFit.fitWidth,
          ),
        ),
        height: 350,
        margin: EdgeInsets.only(top: 23),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: _imgOuIcon(),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _imgFromCamera();
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                ),
                SizedBox(
                  // espacar os containers
                  width: 60,
                ),
                GestureDetector(
                  onTap: () {
                    _imgFromGalery();
                  },
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Icon(
                      Icons.image_outlined,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _imageFile = null;
                _imgOuIcon();
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Icon(
                Icons.cancel_outlined,
                color: Colors.black,
                size: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
