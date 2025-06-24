import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class ProductImage extends StatefulWidget {
  final List products;
  final int Index;

  const ProductImage({super.key, required this.Index, required this.products});

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  // int selects = 1;
  ValueNotifier<int> selects = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      // color: Colors.red,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 1, color: Colors.grey.shade300),

                      // image: DecorationImage(
                      //   image: NetworkImage(
                      //     "${widget.products[widget.Index]['image']}",
                      //   ),
                      //   fit: BoxFit.fill,
                      // ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: '${widget.products[widget.Index]['products_image']}',
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
                  Positioned(
                    top: 17,
                    left: 17,
                    child: Container(
                      width: 65,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          "-50%",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 17,
                    right: 17,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.settings_overscan_sharp,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15, right: 20),
              child: ValueListenableBuilder(valueListenable: selects, builder: (context, value, child) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: InkWell(
                        onTap: () {
                          selects.value = 1;
                        },
                        child: Container(
                          width: double.infinity,
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: selects.value == 1
                                    ? Primary
                                    : Colors.grey.shade300,
                                width: 2),

                          ),
                          child: CachedNetworkImage(
                            imageUrl: '${widget.products[widget.Index]['products_image']}',
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: InkWell(
                        onTap: () {
                          selects.value = 2;
                        },
                        child: Container(
                          width: double.infinity,
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: selects.value == 2
                                    ? Primary
                                    : Colors.grey.shade300,
                                width: 2),
                            // image: DecorationImage(
                            //     image: NetworkImage(
                            //       "${widget.products[widget.Index]['products_image']}",
                            //     ),
                            //     fit: BoxFit.fill),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: '${widget.products[widget.Index]['products_image']}',
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
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: InkWell(
                        onTap: () {
                          selects.value = 3;
                        },
                        child: Container(
                          width: double.infinity,
                          height: 85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: selects.value == 3
                                    ? Primary
                                    : Colors.grey.shade300,
                                width: 2),
                            // image: DecorationImage(
                            //     image: NetworkImage(
                            //       "${widget.products[widget.Index]['products_image']}",
                            //     ),
                            //     fit: BoxFit.fill),
                          ),
                            child: CachedNetworkImage(
                              imageUrl: '${widget.products[widget.Index]['products_image']}',
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
                  ],
                );
              },),
            ),
          ),
        ],
      ),
    );
  }
}