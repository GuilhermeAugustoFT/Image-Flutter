import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var imageFile;

  Widget _imgOuIcon() {
    if (imageFile == null) {
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
        child: Image.file(imageFile),
        height: 350,
        margin: EdgeInsets.only(top: 23),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
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
                  onTap: () {},
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
                  onTap: () {},
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
            onTap: () {},
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
