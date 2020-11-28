import 'dart:io';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:texlama/entity/report.dart';
import 'package:texlama/network/remote_source.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  final picker = ImagePicker();
  File _image;
  Report _report;

  void showCustomDialog(BuildContext context,
      {@required String title,
      String okBtnText = "Ok",
      String cancelBtnText = "Cancel",
      @required Function okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            title: Text('Вы готовы получить отчет?'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Container(
                    height: ScreenUtil().setHeight(35),
                    child: RaisedButton(
                      onPressed: () {
                        okBtnFunction();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFCF11DF),
                                Color(0xFFA624B1),
                                Color(0xFF8A1DCD),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "ok",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  child: Container(
                    height: ScreenUtil().setHeight(35),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pop(_);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFCF11DF),
                                Color(0xFFA624B1),
                                Color(0xFF8A1DCD),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Нет",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  _uploadReport() async {
    bool result = await DataConnectionChecker().hasConnection;
    if (result == true) {
      Navigator.pop(context);
      RemoteSource.getReport().then((value) {
        setState(() {
          _report = value;
        });
      });
    } else {
      Navigator.pop(context);
    }
  }

  _addImage() {
    _showPicker(context);
  }

  _imgFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  _imgFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _buildFloatButton(String path) {
    return IconButton(
      iconSize: ScreenUtil().setHeight(28),
      icon: Image.asset(path),
      onPressed: () {
        setState(() {
          //  _myPage.jumpToPage(0);
        });
      },
    );
  }

  Widget _buildMiddleTabItem() {
    return Padding(
      padding: EdgeInsets.only(top: ScreenUtil().setWidth(24)),
      child: FloatingActionButton(
        elevation: 8,
        onPressed: () {},
        child: Container(
          height: ScreenUtil().setHeight(56),
          width: ScreenUtil().setWidth(56),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF8A1DCD),
                    Color(0xFFA624B1),
                    Color(0xFFCF11DF)
                  ])),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        // elevation: 5.0,
      ),
    );
  }

  Widget _showImage() {
    if (_report != null) {
      return Image.network("https://picsum.photos/200/300",
          fit: BoxFit.fill, height: ScreenUtil().setHeight(158));
    } else if (_image != null) {
      return Image.file(_image,
          fit: BoxFit.fill, height: ScreenUtil().setHeight(158));
    } else {
      return Material(
        color: Colors.white,
        child: InkWell(
          onTap: _addImage,
          child: SvgPicture.asset("assets/images/Image_chooes.svg"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: ScreenUtil().setHeight(58),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    Color(0xFFCF11DF),
                    Color(0xFF8A1DCD),
                  ])),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/camera.svg",
                        height: ScreenUtil().setWidth(28),
                        width: ScreenUtil().setWidth(28)),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(16)),
                      child: TextField(
                        decoration: InputDecoration(
                            isDense: true, hintText: 'Enter a search term'),
                      ),
                    )),
                    SvgPicture.asset("assets/images/menu.svg",
                        height: ScreenUtil().setWidth(17),
                        width: ScreenUtil().setWidth(26)),
                  ],
                ),
              )),
          Align(
            alignment: Alignment.topLeft,
            // Align however you like (i.e .centerRight, centerLeft)
            child: Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(16),
                  left: ScreenUtil().setWidth(16)),
              child: Text(
                "Загрузите для создания отчета",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Flexible(
              child: Padding(
            padding: EdgeInsets.only(top: 16, bottom: 32, left: 32, right: 32),
            child: CustomPaint(
                painter: ShapesPainter(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 24),
                    Flexible(
                        child: Container(
                            color: Colors.yellow,
                            margin: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(32)),
                            child: _showImage())),
                    Container(
                      margin: EdgeInsets.only(top: 35, left: 16, right: 16),
                      height: ScreenUtil().setHeight(50),
                      child: TextFormField(
                          decoration: InputDecoration(
                        labelText: _report != null
                            ? _report.description
                            : "Description...!",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(),
                        ),
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 16, right: 16),
                      height: ScreenUtil().setHeight(30),
                      child: TextFormField(
                          decoration: InputDecoration(
                        labelText: _report != null ? _report.tags : "#tags",
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(),
                        ),
                      )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24, left: 16, right: 16),
                      height: ScreenUtil().setHeight(40),
                      child: RaisedButton(
                        onPressed: () {
                          showCustomDialog(context,
                              okBtnFunction: _uploadReport, title: "AA");
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color(0xFFCF11DF),
                                  Color(0xFFA624B1),
                                  Color(0xFF8A1DCD),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(4.0)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Загрузить",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 16,
        child: Container(
          height: ScreenUtil().setHeight(50),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(24.0)),
                  child: _buildFloatButton("assets/images/home.png")),
              Padding(
                padding: EdgeInsets.only(right: ScreenUtil().setWidth(24.0)),
                child: _buildFloatButton("assets/images/bell.png"),
              ),
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(24.0)),
                child: _buildFloatButton("assets/images/compass.png"),
              ),
              Padding(
                padding: EdgeInsets.only(right: ScreenUtil().setWidth(24.0)),
                child: _buildFloatButton("assets/images/user.png"),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: _buildMiddleTabItem(),
    );
  }
}

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint();
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 40);
    path.lineTo(0, size.height - 40);
    path.close();
    canvas.drawPath(path, paint1);

    canvas.drawShadow(path, Colors.grey.withAlpha(64), 4.0, false);

    paint1.color = Colors.white;

    path.moveTo(size.width / 2 - ScreenUtil().setWidth(60),
        size.height - ScreenUtil().setHeight(40));
    path.lineTo(size.width / 2 + ScreenUtil().setWidth(60),
        size.height - ScreenUtil().setHeight(40));
    path.lineTo(size.width / 2, size.height - ScreenUtil().setHeight(10));
    canvas.drawShadow(path, Colors.grey.withAlpha(64), 4.0, false);
    path.close();
    canvas.drawPath(path, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
