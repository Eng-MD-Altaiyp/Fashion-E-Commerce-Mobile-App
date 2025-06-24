import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Carts/Carts-View/Pages/Second-Pages/Payment-Method/Payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckoutScreen extends StatefulWidget {
  final List Products;
  final double Total;
  final int Items;

  const CheckoutScreen(
      {super.key,
      required this.Total,
      required this.Products,
      required this.Items});

  

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  ValueNotifier<bool> delivary_type = ValueNotifier(false);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Check Out",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            onPressed: () {
                Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          )),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        // color: Colors.red,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      "Your Address",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: SvgPicture.asset(
                      "assets/Icon_SVG/edit.svg",
                      color: Colors.black,
                      width: 25,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SvgPicture.asset(
                        "assets/Icon_SVG/location.svg",
                        width: 35,
                        color: Primary,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 13.0,
                            left: 8,
                          ),
                          child: Text(
                            "Mohammed Altaiyp",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5.0,
                            left: 8,
                          ),
                          child: Text(
                            "2878 Ph Dr.Ahmmed Ali, Sana\'a 24 Street.",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 20,bottom: 10,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Products (${widget.Items})",
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "View All",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Primary,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.Items + 1,
              itemBuilder: (context, index) {
                return index < widget.Items
                    ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                    width: double.infinity,
                    height: 130,
                    // color: Colors.red,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            // color: Colors.red,
                            child: LayoutBuilder(
                                builder: (context, sizes) {
                                  double w1 = sizes.maxWidth;
                                  double h1 = sizes.maxHeight;
                                  return Padding(
                                    padding:
                                    const EdgeInsets.only(left: 20.0),
                                    child: Container(
                                      width: w1,
                                      height: h1,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.grey.shade300),
                                        borderRadius:
                                        BorderRadius.circular(10),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl: '${widget.Products[index]['products_image']}',
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
                                  );
                                }),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: SizedBox(
                            width: double.infinity,
                            height: double.infinity,
                            // color: Colors.grey,
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    maxLines: 1,
                                    "${widget.Products[index]['products_name']}",
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.all(1.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 10),
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration:
                                                BoxDecoration(
                                                  color: Colors
                                                      .green.shade200,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(8),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 5),
                                              child: Container(
                                                width: 50,
                                                height: 30,
                                                decoration:
                                                BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(8),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    "M",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                      Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.symmetric(
                                            horizontal: 15.0),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                "\$${(widget.Products[index]['products_price'] * widget.Products[index]['products_cart']).toStringAsFixed(1)} ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Primary,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold),
                                              ),
                                              TextSpan(
                                                text:
                                                "(${widget.Products[index]['products_cart']})",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors
                                                      .grey.shade400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                    : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Text(
                            "Shipping Type",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ValueListenableBuilder(valueListenable: delivary_type, builder: (context, value, child) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 5),
                                  child: InkWell(
                                    onTap: () {
                                      delivary_type.value = false;
                                    },
                                    child: Container(
                                      width: 180,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        border: Border.all(
                                          width: 1.3,
                                          color: delivary_type.value == false
                                              ? Primary
                                              : Colors.grey.shade300,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .symmetric(
                                                    horizontal:
                                                    8.0),
                                                child: SvgPicture.asset(
                                                  "assets/Icon_SVG/truck.svg",
                                                  width: 25,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  const Padding(
                                                    padding:
                                                    EdgeInsets
                                                        .only(
                                                      top: 13.0,
                                                      left: 8,
                                                    ),
                                                    child: Text(
                                                      "Standard",
                                                      style:
                                                      TextStyle(
                                                        fontSize: 20,
                                                        color: Colors
                                                            .black,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                      top: 5.0,
                                                      left: 8,
                                                    ),
                                                    child: Text(
                                                      "7-10 days",
                                                      style:
                                                      TextStyle(
                                                        fontSize: 17,
                                                        color: Colors
                                                            .grey
                                                            .shade400,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 15,
                                                vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  "\$20",
                                                  style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: Primary,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration:
                                                  BoxDecoration(
                                                    color:
                                                    delivary_type.value ==
                                                        false
                                                        ? Primary
                                                        : Colors
                                                        .white,
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        15),
                                                    border: Border.all(
                                                      width: 1,
                                                      color: Colors.grey
                                                          .shade300,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(11),
                                                    child: Container(
                                                      decoration:
                                                      BoxDecoration(
                                                        color: Colors
                                                            .white,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            5),
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
                                  ),
                                );
                              },),
                              ValueListenableBuilder(valueListenable: delivary_type, builder: (context, value, child) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 5),
                                  child: InkWell(
                                    onTap: () {
                                      delivary_type.value = true;
                                    },
                                    child: Container(
                                      width: 180,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(8),
                                        border: Border.all(
                                          width: 1.3,
                                          color: delivary_type.value == true
                                              ? Primary
                                              : Colors.grey.shade300,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding:
                                                const EdgeInsets
                                                    .symmetric(
                                                    horizontal:
                                                    8.0),
                                                child: SvgPicture.asset(
                                                  "assets/Icon_SVG/delivery-truck-truck-svgrepo-com.svg",
                                                  width: 35,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  const Padding(
                                                    padding:
                                                    EdgeInsets
                                                        .only(
                                                      top: 13.0,
                                                      left: 8,
                                                    ),
                                                    child: Text(
                                                      "Standard",
                                                      style:
                                                      TextStyle(
                                                        fontSize: 20,
                                                        color: Colors
                                                            .black,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                      top: 5.0,
                                                      left: 8,
                                                    ),
                                                    child: Text(
                                                      "2-4 days",
                                                      style:
                                                      TextStyle(
                                                        fontSize: 17,
                                                        color: Colors
                                                            .grey
                                                            .shade400,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 15,
                                                vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text(
                                                  "\$50",
                                                  style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold,
                                                    color: Primary,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration:
                                                  BoxDecoration(
                                                    color:
                                                    delivary_type.value ==
                                                        true
                                                        ? Primary
                                                        : Colors
                                                        .white,
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        15),
                                                    border: Border.all(
                                                      width: 0.8,
                                                      color: Colors.grey
                                                          .shade300,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(11),
                                                    child: Container(
                                                      decoration:
                                                      BoxDecoration(
                                                        color: Colors
                                                            .white,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            5),
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
                                  ),
                                );
                              },),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // SizedBox(
            //   height: 40,
            // ),
          ],
        ),
      ),
      // extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          width: double.infinity,
          height: 80,
          // color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(width: 2, color: Colors.black)),
                      child: const Center(
                        child: Text(
                          "Clear All",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => Payment(
                              Items: widget.Items,
                              OrderCost: delivary_type.value == false ? 20 : 50,
                              SubTotal: widget.Total,
                            ),
                          ),
                        );
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Primary,
                      ),
                      child: const Center(
                        child: Text(
                          "Check Out",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
