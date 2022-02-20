import "package:flutter/material.dart";
import 'package:parikapp_supervisor/screens/home.dart';
import 'package:parikapp_supervisor/screens/layouts/gradient_layout.dart';
import 'package:parikapp_supervisor/widgets/change_language.dart';
import 'package:parikapp_supervisor/widgets/login_form.dart';
import 'package:parikapp_supervisor/widgets/navbar.dart';

class Login extends StatefulWidget {
  static String routeName = "/login";

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(),
        body: GradientLayout(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 80, bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Image(
                      image: AssetImage("assets/images/logo-big.png"),
                      height: 80,
                    ),
                    Text(
                      "AGENT",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ),
              LoginForm(
                  logged_in: () => {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            Home.routeName, (route) => false)
                      }),
              ChangeLanguage()
            ],
          ),
        ));
  }
}
