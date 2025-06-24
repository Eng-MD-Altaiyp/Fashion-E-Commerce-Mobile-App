import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Carts/Carts-Models/Carts-CoustomPinter.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Carts/Carts-Repository/Get-Repository-Cart.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Carts/Carts-View/Pages/Second-Pages/checkout_screen.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Carts/Carts-View/Widgets/CartTrach.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Carts-Controller/BLOCs/Carts_Bloc/carts_bloc.dart';
import '../../../Carts-Controller/BLOCs/Carts_Bloc/carts_event.dart';
import '../../../Carts-Controller/BLOCs/Carts_Bloc/carts_state.dart';

class cart_screen extends StatefulWidget {
  const cart_screen({super.key});

  @override
  State<cart_screen> createState() => _cart_screenState();
}

class _cart_screenState extends State<cart_screen> {
  double shipping = 20.00;
  CartsRepository Data = CartsRepository();




  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartsBloc(CartsRepository())..add(FetchCartsEvent()),
      child: BlocBuilder<CartsBloc, CartsState>(
        builder: (context, state) {
          if (state is CartsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartsError) {
            return Center(child: Text(state.message));
          } else if (state is CartsLoaded) {
            final carts = state.carts;
            if (carts.isEmpty) {
              return Center(child: Image.asset("assets/Animations/Animation - 1732977026256.gif",width: 200,
                height: 200,
                fit: BoxFit.contain,),);
            }
            return ListView.builder(
              itemCount: carts.length + 1,
              itemBuilder: (context, i) {
                return i < carts.length
                    ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      border: Border(
                        bottom: BorderSide(
                            color: Colors.grey.shade400, width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CachedNetworkImage(
                            imageUrl: '${carts[i]['products_image']}',
                              fit: BoxFit.fill,
                              placeholder: (context, url) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Color.fromARGB(255, 250, 141, 17),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Center(
                                  child: SvgPicture.asset(
                                    "assets/Icon_SVG/error-connection.svg",
                                    color: ErrorColor,
                                    width: 50,
                                  ),
                                );
                              },
                            ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              maxLines: 1,
                                              "${carts[i]['products_name']}",
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color:
                                                  Colors.black),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "Green, M",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors
                                                      .grey.shade500),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Carttrach(id: carts[i]['products_id'],),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        "\$${carts[i]['products_price'].toStringAsFixed(2)}  ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Primary),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: "Total ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black),
                                          ),
                                          TextSpan(
                                            text:
                                            "\$${(carts[i]['products_price'] * carts[i]['products_cart']).toStringAsFixed(2)}",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Primary),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(
                                                8),
                                            border: Border.all(
                                                color: Colors
                                                    .grey.shade400,
                                                width: 1)),
                                        child: Center(
                                          child: Text(
                                            "${carts[i]['products_cart']}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.copyWith(
                                                fontWeight:
                                                FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                    : SizedBox(
                  width: double.infinity,
                  height: 350,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey.shade200,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                height: 1,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Subtotal ($totalProductsCart)",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    Text(
                                      "\$${totalCartPrice.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Shipping",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    Text(
                                      "\$$shipping",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10),
                                child: DottedLine(
                                  color: Colors.grey.shade300,
                                  height: 1.4,
                                  dashWidth: 9,
                                  dashSpace: 7,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: "Total  ",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                            "(${carts.length} Item)",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.grey.shade400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "\$${(Total + shipping).toStringAsFixed(2)}",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 15, left: 15, bottom: 10, top: 100),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => CheckoutScreen(
                                  Products: carts,
                                  Total: totalCartPrice,
                                  Items: carts.length,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 65,
                            decoration: BoxDecoration(
                              color: Primary,
                              border: Border.all(
                                width: 1,
                                color: Colors.grey.shade400,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                "CheckOut",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(height: 100,),
                    ],
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
