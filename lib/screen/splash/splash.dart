import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:texlama/screen/log_in/log_in.dart';
import 'package:texlama/screen/sign_up/sign_up.dart';

class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashState();
  }
}

class _SplashState extends State<Splash> {
  _logIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LogIn()),
    );
  }

  _signUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUp()),
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
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(78),
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
              onPressed: _logIn,
              child: Text(
                'LOG IN',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    color: Colors.white,
                    height: 33 / 28),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(32),
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
                    fontSize: ScreenUtil().setSp(28),
                    color: Colors.white,
                    height: 33 / 28),
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
