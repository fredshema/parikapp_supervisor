import 'package:flutter/material.dart';
import 'package:parikapp_driver/widgets/change_language.dart';
import 'package:parikapp_driver/widgets/modals/edit_phone_modal.dart';
import 'package:parikapp_driver/widgets/modals/edit_phone_otp_modal.dart';
import 'package:parikapp_driver/widgets/sidebar.dart';
import '../../utils/variables.dart';
import '../../widgets/navbar.dart';

class MyProfile extends StatefulWidget {
  static const String routeName = "/profile";

  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  VoidCallback _showEditPhoneOtpModal() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return const EditPhoneOtpModal();
        });
    return () => {};
  }

  Widget build(BuildContext context) {
    VoidCallback _showEditPhoneModal() {
      showModalBottomSheet(
          context: context,
          builder: (builder) {
            return EditPhoneModal(
                generateOtp: () => {
                      Navigator.of(context).pop(),
                      _showEditPhoneOtpModal(),
                    });
          });
      return () => {};
    }

    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: Navbar(name: "Profile"),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: Variables.deviceHeight(context),
            ),
            child: IntrinsicHeight(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: [
                    Card(
                      color: Colors.grey.shade300,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Linked Phone Number",
                                  style: TextStyle(fontSize: 17),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "0781234567",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: _showEditPhoneModal,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 13),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.orange, width: 2),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Text(
                                      "Edit",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.orange.shade100,
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Profile Info",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(height: 25),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: "Names :  ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: "John Doe"),
                              ], style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: "Phone :  ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: "0781234567"),
                              ], style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: "Email :  ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: "john@email.com"),
                              ], style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: "Identification :  ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: "National ID"),
                              ], style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: "ID Number :  ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: "1 1980 8 1234567 1 12"),
                              ], style: TextStyle(fontSize: 16)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                    text: "TIN :  ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(text: "N/A"),
                              ], style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ChangeLanguage(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
