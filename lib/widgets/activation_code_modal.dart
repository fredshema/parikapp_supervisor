import 'package:flutter/material.dart';
import 'package:parikapp_driver/screens/home.dart';

class ActivationCodeModal extends StatefulWidget {
  const ActivationCodeModal({Key? key}) : super(key: key);

  @override
  State<ActivationCodeModal> createState() => _ActivationCodeModalState();
}

class _ActivationCodeModalState extends State<ActivationCodeModal> {
  bool isActivated = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isActivated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    void activate() {
      setState(() {
        isActivated = true;
      });
    }

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final double deviceWidth = mediaQuery.size.width -
        mediaQuery.viewInsets.left -
        mediaQuery.viewInsets.right;

    Widget codeInput() {
      return Container(
        height: 60,
        width: 60,
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Center(
          child: TextFormField(
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              counterText: "",
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
            maxLength: 1,
            keyboardType: TextInputType.number,
          ),
        ),
      );
    }

    Widget codeInputTab() {
      return Container(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: deviceWidth * 70 / 100,
                child: const Text(
                  "Enter and confirm activation code sent to phone number: 078xxxxxx",
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    codeInput(),
                    codeInput(),
                    codeInput(),
                    codeInput(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: ElevatedButton(
                onPressed: activate,
                child: const Text("CONFIRM"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget activationSuccess() {
      return Container(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            const Icon(
              Icons.check_circle,
              size: 60,
              color: Colors.green,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Text(
                "Success",
                style: TextStyle(fontSize: 20),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 2),
              child: Text(
                "ParikApp is now linked with this device. You can now Buy and Register your vehicles as well as check parking and vehicle status.",
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.pop(context),
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) =>
                            const Home(showParkingStatus: false)),
                    (_) => false,
                  )
                },
                child: const Text("CLOSE"),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return ListView(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: [
        Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width),
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary),
                    child: const Text(
                      "Activating ParikApp",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                isActivated ? activationSuccess() : codeInputTab(),
              ],
            )),
      ],
    );
  }
}
