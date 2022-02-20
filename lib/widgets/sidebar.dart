import 'package:flutter/material.dart';
import 'package:parikapp_supervisor/screens/about.dart';
import 'package:parikapp_supervisor/screens/agent/agents.dart';
import 'package:parikapp_supervisor/screens/auth/login.dart';
import 'package:parikapp_supervisor/screens/home.dart';

class SidebarWidget extends StatelessWidget {
  const SidebarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(right: 25, left: 5),
                    child: const Image(
                      image: AssetImage(
                        "assets/images/logo-big.png",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 15),
                  child: InkWell(
                      onTap: () => {Navigator.of(context).pop()},
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 35,
                      )),
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.white24,
            height: 1,
          ),
          const SizedBox(height: 30),
          buildMenuItem(
              icon: Icons.home,
              text: "Home",
              onClicked: () => selectedItem(context, 0)),
          buildMenuItem(
              icon: Icons.supervisor_account,
              text: "Agents",
              onClicked: () => selectedItem(context, 1)),
          buildMenuItem(
              icon: Icons.info,
              text: "About",
              onClicked: () => selectedItem(context, 2)),
          buildMenuItem(
              icon: Icons.logout_rounded,
              text: "Logout",
              onClicked: () => selectedItem(context, 3)),
        ],
      ),
    );
  }
}

Widget buildMenuItem(
    {required String text, required IconData icon, required onClicked}) {
  const color = Colors.white;
  const hoverColor = Colors.white70;

  return ListTile(
    contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
    leading: Icon(
      icon,
      color: color,
      size: 35,
    ),
    title: Text(
      text,
      style: const TextStyle(color: color, fontSize: 18),
    ),
    onTap: onClicked,
    hoverColor: hoverColor,
  );
}

void selectedItem(BuildContext context, index) {
  switch (index) {
    case 0:
      Navigator.of(context).pop();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Home.routeName, (_) => false);
      break;
    case 1:
      Navigator.of(context).pop();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Agents.routeName, (_) => false);
      break;
    case 2:
      Navigator.of(context).pop();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(About.routeName, (_) => false);
      break;
    case 3:
      Navigator.of(context).pop();
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Login.routeName, (_) => false);
      break;
  }
}
