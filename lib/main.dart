import 'package:fashion_e_commerce_mobile_app/Core/Routes/routes.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Add%20Cart/add_cart_bloc.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/whislist_bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_notification/in_app_notification.dart';
import 'Features/Products/Products-Controller/Bloc/Products-Bloc/view_stored_data_bloc.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return InAppNotification(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FavoriteBloc>(
              create: (context) => FavoriteBloc()),

          BlocProvider<ProductBloc>(
              create: (context) => ProductBloc()),

          BlocProvider<AddCartBloc>(
            create: (context) => AddCartBloc(),
          ),


        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Fashion E-Commerce Mobile App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: '/SplashScreen',
          routes: appRoutes,
        ),
      ),
    );
  }
}
