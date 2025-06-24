import 'dart:async';

import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Models/Get-Data-Cart.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



AddCartSuccessfully(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      Timer(
        const Duration(seconds: 2),
            () {
              Get_Cart_Products Data = Get_Cart_Products();
              Data.GetCounterCart();
              Cart_Counters.value = 1;
          Navigator.of(context).pop();
        },
      );
      return AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.transparent,
              ),
              child: Lottie.asset(
                "assets/Animations/SuccessfulAddToCart.json",
              ),
            ),
          ),
        ),
      );
    },
  );
}