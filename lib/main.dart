import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parikapp_driver/screens/vehicle_owner/confirm_registration_details.dart';
import 'package:parikapp_driver/screens/vehicle_owner/register_owner.dart';
import 'package:parikapp_driver/screens/vehicle_owner/register_vehicle_details.dart';
import 'package:parikapp_driver/screens/vehicles/my_vehicles.dart';
import "./utils/custom_colors.dart";
import './screens/splash_screen.dart';
import './screens/activation_screen.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = ThemeData();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        title: 'Parik App',
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(
            secondary: CustomColor.ACCENT_COLOR,
            primary: CustomColor.PRIMARY,
            primaryVariant: CustomColor.PRIMARY_VARIANT,
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: CustomColor.LIGHT_GREY,
          hintColor: const Color(0xffA0AEC0),
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme.apply(
                  bodyColor: CustomColor.SUPER_DARK_GREY,
                  displayColor: CustomColor.SUPER_DARK_GREY,
                ),
          ),
          inputDecorationTheme: theme.inputDecorationTheme.copyWith(
            fillColor: Colors.white,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 0, color: Colors.transparent),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: CustomColor.PRIMARY, width: 3),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            primary: CustomColor.PRIMARY,
            textStyle: GoogleFonts.poppins(
              fontSize: 17,
            ),
          )),
        ),
        home: const SafeArea(child: ActivationScreen()),
        routes: {
          Home.routeName: (ctx) => const SafeArea(child: Home()),
          RegisterOwner.routeName: (ctx) =>
              const SafeArea(child: RegisterOwner()),
          RegisterVehicleDetails.routeName: (ctx) =>
              const SafeArea(child: RegisterVehicleDetails()),
          ConfirmRegistrationDetails.routeName: (ctx) =>
              const SafeArea(child: ConfirmRegistrationDetails()),
          MyVehicles.routeName: (ctx) => const SafeArea(child: MyVehicles()),
        },
      ),
    );
  }
}
