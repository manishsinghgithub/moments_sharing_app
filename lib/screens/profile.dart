import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:moments/Services/upload_profile.dart';
import 'package:moments/constants/constants.dart';

var url;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile')),
        actions: [
          OutlineButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Log Out'),
          )
        ],
        backgroundColor: Color(0xfff8b55f5),
        elevation: 0,
      ),
      backgroundColor: Color(0xfff8b55f5).withOpacity(0.4),
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.only(top: 5),
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: (url != null)
                          ? Image.network(url)
                          : AssetImage(
                              'images/user-avatar.png',
                            ),
                    ),
                    Positioned(
                      top: 100,
                      left: 60,
                      child: InkWell(
                        onTap: () {
                          showBottomSheet(
                              context: context,
                              builder: ((builder) => Container(
                                    height: 100.0,
                                    width: MediaQuery.of(context).size.width,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Choose Profile Photo',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            FlatButton.icon(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  var newUrl =
                                                      await UploadFromGallery(
                                                          context);
                                                  setState(() {
                                                    newUrl = url;
                                                  });
                                                },
                                                icon: Icon(Icons.camera),
                                                label: Text('Camera')),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            FlatButton.icon(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                  var newUrl =
                                                      await UploadFromGallery(
                                                          context);
                                                  setState(() {
                                                    newUrl = url;
                                                  });
                                                },
                                                icon: Icon(Icons.image),
                                                label: Text('gallery')),
                                          ],
                                        )
                                      ],
                                    ),
                                  )));
                        },
                        child: Icon(
                          Icons.add_a_photo,
                          size: 20.0,
                        ),
                      ),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 50.0,
          ),
          Center(
            child: Text(
              FirebaseAuth.instance.currentUser.email,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          ClipPath(
            clipper: CliperFun(),
            child: Container(
              decoration: kDecorationAniamtion,
              height: 100,
              padding: EdgeInsets.only(top: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Moments',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      Text(
                        '120',
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(),
        ],
      ),
    );
  }
}

class CliperFun extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0);
    var firstController = Offset(size.width * 0.95, size.height * 0.15);
    var firstEndPoint = Offset(size.width * 0.80, size.height * 0.15);

    path.quadraticBezierTo(firstController.dx, firstController.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.lineTo(size.width * 0.15, size.height * 0.15);

    var secondController = Offset(size.width * 0.05, size.height * 0.15);
    var secondEndPoint = Offset(0, size.height * 0.25);

    path.quadraticBezierTo(secondController.dx, secondController.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(0, size.height);

    var thirdController = Offset(size.width * 0.05, size.height * 0.85);
    var thirdEndPoint = Offset(size.width * 0.15, size.height * 0.85);

    path.quadraticBezierTo(thirdController.dx, thirdController.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(size.width * 0.85, size.height * 0.85);

    var fourthController = Offset(size.width * 0.95, size.height * 0.85);
    var fourthEndPoint = Offset(size.width, size.height * 0.70);

    path.quadraticBezierTo(fourthController.dx, fourthController.dy,
        fourthEndPoint.dx, fourthEndPoint.dy);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
