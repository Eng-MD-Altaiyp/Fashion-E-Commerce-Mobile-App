import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/FetchSingleProduct/fetch_single_product_bloc.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Widgets/Bottom%20Navigation%20Bar.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Widgets/Couter%20Cart.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Widgets/FavoriteProducts.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Widgets/ImageProducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

int Counter = 1;

class ProductDetailsScreen extends StatefulWidget {
  final List products;
  final int ID;

  const ProductDetailsScreen(
      {super.key,
      required this.ID,
      required this.products});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  ValueNotifier<int> counter = ValueNotifier(1);
  @override
  Widget build(BuildContext context) {
    Counter = 1;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();

        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Product Details",
            style: TextStyle(
              fontSize: 25,
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
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 5),
                child: InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    "assets/Icon_SVG/upload-svgrepo-com.svg",
                    color: Colors.black,
                  ),
                )),
            Favo(
              Index: 0,
              products: widget.products,
            ),
          ],
        ),
        body: BlocProvider<FetchSingleProductBloc>(
          create: (context) => FetchSingleProductBloc(ProductId: widget.ID),

          child: BlocBuilder<FetchSingleProductBloc, FetchSingleProductState>(
            builder: (context, state) {
              if (state is FetchSingleProductInitial || state is FetchSingleProductLoading) {
                return const Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: Color.fromARGB(255, 250, 141, 17),
                  ),
                );
              } else if (state is FetchSingleProductLoaded) {
                final products = state.products;
                return SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: ListView(
                    children: [
                      ProductImage(
                        Index: 0,
                        products: products,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 13),
                        child: Text(
                          "${products[0]['products_name']}",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 13),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: "⭐ 4.3",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.black),
                              ),
                              TextSpan(
                                text: "\t(350) * 220 reviews",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 13),
                        child: RichText(
                          maxLines: 2,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${products[0]['products_description']}",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey.shade400),
                              ),
                              TextSpan(
                                text: "...See more",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Count(
                        Index: 0,
                        products: products,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "Select Color",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.lightBlue.shade200,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.green.shade400,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.purpleAccent.shade200,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.yellow.shade200,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 5.0, left: 10),
                            child: Text(
                              "Select Size",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, right: 10),
                            child: Text(
                              "Size Guide",
                              style: TextStyle(
                                fontSize: 20,
                                color: Primary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else if (state is FetchSingleProductError) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
        bottomNavigationBar: Bottom_Navigation_Bar(ID: widget.ID, products: widget.products,),
      ),
    );
  }


}





