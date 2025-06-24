import 'package:fashion_e_commerce_mobile_app/Features/User-Profile/User-Profile-View/Widgets/Profile-Widgets/DetailsWork.dart';
import 'package:fashion_e_commerce_mobile_app/Features/User-Profile/User-Profile-View/Widgets/Profile-Widgets/History.dart';
import 'package:fashion_e_commerce_mobile_app/Features/User-Profile/User-Profile-View/Widgets/Profile-Widgets/Settings.dart';
import 'package:fashion_e_commerce_mobile_app/Features/User-Profile/User-Profile-View/Widgets/Profile-Widgets/Support.dart';
import 'package:fashion_e_commerce_mobile_app/Features/User-Profile/User-Profile-View/Widgets/Profile-Widgets/Tracking.dart';
import 'package:fashion_e_commerce_mobile_app/Features/User-Profile/User-Profile-View/Widgets/Profile-Widgets/UserData.dart';
import 'package:flutter/material.dart';



class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: const [

          Userdata(),
          DetailsWork(),
          History(),
          Settings(),
          Support(),
          Tracking(),
        ],
      ),
    );
  }
}
