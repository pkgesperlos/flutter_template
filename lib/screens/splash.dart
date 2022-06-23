import 'dart:convert';

import 'package:flutter_template/app.dart';
import 'package:flutter_template/constants/dims.dart';
import 'package:flutter_template/global/common_views/big_text.dart';
import 'package:flutter_template/global/common_views/common_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../blocs/logIn_bloc.dart';
import '../global/common_views/v_spacer.dart';
import '../models/user_model.dart';
import '../resources/save.dart';


class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashState();
  }
}

class SplashState extends State<Splash> {
  int isBusinessActive = 0;

  late Future<_AppStatus> check;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    check = checkAppState();
  }

  Future<_AppStatus> checkAppState() async {
    bool isLogin = await Save().isLogin();

    if (isLogin) {
      await sendUserDataRequest();
      return _AppStatus.loggedInBefore;
    }

    return _AppStatus.notLoggedIn;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: FutureBuilder(
          future: check,
          builder: (context, AsyncSnapshot<_AppStatus> snapshot) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              if (snapshot.hasData) {
               Future.delayed(Duration(milliseconds: 3000),(){
                 if (snapshot.data == _AppStatus.loggedInBefore) {
                   Navigator.pushReplacementNamed(context, '/home');
                 } else {
                   Navigator.pushReplacementNamed(context, '/login');
                 }
               });
              }
            });

            return main();
          },
        ),
      ),
    );
  }

  Widget main() {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
          gradient: RadialGradient(
        colors: [Theme.of(context).scaffoldBackgroundColor, Colors.black],
        stops: [.2, 1],
        radius: 1.2,
      )),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 3,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100))),
                child: Image.asset('assets/images/logo.png', fit: BoxFit.cover),
              ),
              VSpacer(
                big: true,
              ),
              VSpacer(
                big: true,
              ),
              BigText(
                "ESPERBOSS",
              ),
            ]),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.only(bottom: Dims.bigPadding),
                child:
                    CommonText("powered by esperlos", textColor: Colors.white),
              ))
        ],
      ),
    );
  }

  Future<UserModel> sendUserDataRequest() async {
    UserModel model = await logInBlocAuthenticate.fetchAuthenticate(
        apiAddress: "authenticate",
        body: {},
        directResult: (res) async {
          Save().setUserData(res);
        },
        fullResponse: (Response res) {
          if (res.statusCode == 401) {
            Navigator.pushReplacementNamed(context, '/login');
          }
        });

    return model;
  }
}

enum _AppStatus { notLoggedIn, loggedInBefore }
