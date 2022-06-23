import 'package:flutter_template/constants/dims.dart';
import 'package:flutter_template/global/common_views/v_spacer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../blocs/logIn_bloc.dart';
import '../resources/save.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _ctrlUsername = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.all(Dims.bigPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child:
                      Image.asset('assets/images/logo.png', fit: BoxFit.cover),
                ),
                VSpacer(
                  big: true,
                ),
                VSpacer(
                  big: true,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _ctrlUsername,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    labelText: "نام کاربری",
                  ),
                ),
                VSpacer(
                  big: true,
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  controller: _ctrlPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    labelText: "رمز عبور",
                  ),
                ),
                VSpacer(
                  big: true,
                ),
                VSpacer(
                  big: true,
                ),
                ElevatedButton(
                    onPressed: () {
                      logInBlocLogin.fetchLogin(
                          apiAddress: "login",
                          body: {
                            "username": _ctrlUsername.text,
                            "password": _ctrlPassword.text
                          },
                          fullResponse: (Response res) {
                            if (res.statusCode == 200) {
                              Save().setUserData(res.body);
                              Save().setAuth(res.headers['bearer'].toString());
                              Save().setLogin(true);
                              Navigator.pushReplacementNamed(context, '/home');
                            }
                          });
                    },
                    child: Text("ورود"))
              ],
            ),
          ),
        ));
  }
}
