import 'dart:async';

import 'package:flutter/material.dart';
import '../utils/variables.dart';
import '../widgets/navbar.dart';
import '../widgets/change_language.dart';
import '../widgets/welcome.dart';
import '../widgets/activation_form.dart';
import '../widgets/activation_code_modal.dart';

class ActivationScreen extends StatefulWidget {
  const ActivationScreen({Key? key}) : super(key: key);

  @override
  _ActivationScreenState createState() => _ActivationScreenState();
}

class _ActivationScreenState extends State<ActivationScreen> {
  late Timer _timer;
  bool _switchWelcome = false;
  // final List<Widget>  _availableWidgets = [const Welcome(), const Activate()];

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 5), () {
      setState(() {
        _switchWelcome = true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    VoidCallback _showActivationCodeModal() {
      showModalBottomSheet(
          context: context,
          builder: (builder) {
            return const ActivationCodeModal();
          });
      return () => {};
    }

    return Scaffold(
      appBar: Navbar(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: const Alignment(0.0, 1.2),
            colors: <Color>[
              Theme.of(context).colorScheme.primary,
              Colors.white
            ],
            tileMode: TileMode.decal,
          ),
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: Variables.deviceHeight(context),
                minHeight: Variables.deviceHeight(context)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 320,
                  padding: const EdgeInsets.only(top: 30),
                  child: const Image(
                      image: AssetImage("assets/images/logo-big.png")),
                ),
                _switchWelcome
                    ? ActivationForm(
                        generateOtp: () {
                          _showActivationCodeModal();
                        },
                      )
                    : const Welcome(),
                //change language
                const ChangeLanguage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
