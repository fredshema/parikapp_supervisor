import 'package:flutter/material.dart';
import 'package:parikapp_driver/screens/profile/my_profile.dart';

class EditPhoneOtpModal extends StatefulWidget {
  const EditPhoneOtpModal({Key? key}) : super(key: key);

  @override
  State<EditPhoneOtpModal> createState() => _EditPhoneOtpModalState();
}

class _EditPhoneOtpModalState extends State<EditPhoneOtpModal> {
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
              color: Colors.orange,
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
                  primary: Colors.orange,
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
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      MyProfile.routeName, (_) => false)
                },
                child: const Text("CLOSE"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.white,
          child: Container(
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
                      decoration: const BoxDecoration(color: Colors.orange),
                      child: const Text(
                        "Confirm Linked number change",
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
        ),
      ],
    );
  }
}
