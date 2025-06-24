import 'package:fashion_e_commerce_mobile_app/Features/Authantication/Authantication-View/Pages/LogIn.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Authantication/Authantication-View/Pages/Onboarding.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Authantication/Authantication-View/Pages/Sign_Up.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Authantication/Authantication-View/Pages/Splash_Screen.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Pages/Second-Pages/Notifications-Screen.dart';
import 'package:flutter/cupertino.dart';



final Map<String, WidgetBuilder> appRoutes = {
  '/SplashScreen': (_) => SplashScreen(),
  '/Onboarding': (_) => Onboarding(),
  '/signup_screen':(_)=> signup_screen(),
  '/login_screen':(_)=> login_screen(),
  '/NotificationsScreen':(_)=> NotificationsScreen(),


};
