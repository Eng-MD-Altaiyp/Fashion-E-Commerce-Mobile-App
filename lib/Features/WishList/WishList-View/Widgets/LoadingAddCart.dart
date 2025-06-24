import 'dart:async';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Add%20Cart/add_cart_bloc.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Add%20Cart/add_cart_event.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Widgets/SuccessefulyAddCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 LoadingAddCart(int Id, int count,BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      Timer(
        const Duration(seconds: 1),
            () async {
          // Cart_Counter += count;
          //     Cart_Counters.value =1;
          // await Local.updateProductCart(Name, count);
          context.read<AddCartBloc>().add(ToggleAddCart(productId: Id, ChangedValue: count));
          Navigator.of(context).pop();
          AddCartSuccessfully(context);

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
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white54,
                      blurRadius: 20,
                      offset: Offset(0, 5),
                    )
                  ]),
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.white54,
                color: Color.fromARGB(255, 250, 141, 17),
              ),
            ),
          ),
        ),
      );
    },
  );
}
