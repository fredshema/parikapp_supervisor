import 'package:flutter/material.dart';
import 'package:parikapp_driver/widgets/modals/registration_success_modal.dart';
import 'package:parikapp_driver/widgets/sidebar.dart';
import '../../utils/variables.dart';
import '../../widgets/navbar.dart';

class ConfirmRegistrationDetails extends StatefulWidget {
  static const String routeName = "/register/confirm";

  const ConfirmRegistrationDetails({Key? key}) : super(key: key);

  @override
  _ConfirmRegistrationDetailsState createState() =>
      _ConfirmRegistrationDetailsState();
}

class _ConfirmRegistrationDetailsState
    extends State<ConfirmRegistrationDetails> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> ownerInfo = [
      {"Name": "John Doe"},
      {"Phone": "0781111111"},
      {"Email": "john@doe.com"},
      {"ID Type": "National ID"},
      {"ID number": "1 1880 8 1234567 1 12"},
    ];

    List<List<Map<String, dynamic>>> vehiclesInfo = [
      [
        {"TIN": "1234567"},
        {"Brand": "Toyota"},
        {"Model": "Camry"},
        {"Ownership": "I am the owner"},
        {"Vehicle type": "Category B"},
        {"Plate Number": "RAA 123 A"},
      ]
    ];

    VoidCallback _showSuccessModal() {
      showModalBottomSheet(
          context: context,
          builder: (builder) {
            return const RegistrationSuccessModal();
          });
      return () => {};
    }

    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: Navbar(name: "Confirm Details"),
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Owner Details",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text("Vehicle owner information"),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...ownerInfo
                                    .map((info) => Text(
                                          "${info.entries.toList()[0].key}:",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ))
                                    .toList()
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ...ownerInfo
                                      .map(
                                        (info) => Text(
                                            "${info.entries.toList()[0].value}"),
                                      )
                                      .toList(),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Vehicle Details",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ...vehiclesInfo.map(
                          (vehicle) => Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...vehicle
                                            .map((info) => Text(
                                                  "${info.entries.toList()[0].key}:",
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ))
                                            .toList()
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ...vehicle
                                              .map(
                                                (info) => Text(
                                                    "${info.entries.toList()[0].value}"),
                                              )
                                              .toList(),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "NOTE :  ",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Flexible(
                            child: Text(
                          "Be aware that the providing wrong information is punishable by the law",
                          style: TextStyle(color: Colors.red, fontSize: 15),
                        ))
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        onPressed: () => {Navigator.pop(context)},
                        child: const Text("CANCEL"),
                        style: ElevatedButton.styleFrom(primary: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: ElevatedButton(
                        onPressed: () => {_showSuccessModal()},
                        child: const Text("CONTINUE"),
                      ),
                    )
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
