import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texlama/screen/home/home.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SignUpState();
  }
}

class _SignUpState extends State<SignUp> {
  _signUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: Size(360, 640), allowFontScaling: true);
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xFFCF11DF),
            Color(0xFFA624B1),
            Color(0xFF8A1DCD),
          ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(66)),
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              height: ScreenUtil().setHeight(189),
              width: ScreenUtil().setHeight(165),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(43),
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(30),
                left: ScreenUtil().setWidth(40),
                right: ScreenUtil().setWidth(39)),
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(14)),
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                  child: Icon(
                    Icons.mail_outlined,
                    color: Colors.white.withOpacity(0.4),
                    size: ScreenUtil().setWidth(24),
                  ),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    color: Colors.white.withOpacity(0.4)),
                contentPadding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(10.0),
                    horizontal: ScreenUtil().setWidth(10.0)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(43),
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(14),
                left: ScreenUtil().setWidth(40),
                right: ScreenUtil().setWidth(39)),
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(14)),
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                  child: SvgPicture.asset(
                    "assets/images/username.svg",
                    height: 19,
                    width: 19,
                  ),
                ),
                hintText: 'Username',
                hintStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    color: Colors.white.withOpacity(0.4)),
                contentPadding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(10.0),
                    horizontal: ScreenUtil().setWidth(10.0)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(43),
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(14),
                left: ScreenUtil().setWidth(40),
                right: ScreenUtil().setWidth(39)),
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(14)),
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                  child: SvgPicture.asset(
                    "assets/images/key.svg",
                    height: ScreenUtil().setHeight(24),
                  ),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    color: Colors.white.withOpacity(0.4)),
                contentPadding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setHeight(10.0),
                    horizontal: ScreenUtil().setWidth(10)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(52),
                left: ScreenUtil().setWidth(40),
                right: ScreenUtil().setWidth(39)),
            height: ScreenUtil().setHeight(47),
            width: MediaQuery.of(context).size.width,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(ScreenUtil().setHeight(4))),
                  side: BorderSide(
                      color: Colors.white,
                      width: ScreenUtil().setHeight(1),
                      style: BorderStyle.solid)),
              onPressed: _signUp,
              child: Text(
                'SIGN UP',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: ScreenUtil().setSp(28),
                    color: Colors.white,
                    height: 32.81 / 28),
              ),
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(7)),
            child: Text(
              "Terms & Condition",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(16),
                  color: Colors.white,
                  height: 18.75 / 16),
            ),
          )
        ],
      ),
    ));
  }
}
