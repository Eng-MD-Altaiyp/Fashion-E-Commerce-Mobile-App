import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Widgets/SuccessefulyAddCart.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Widgets/WishListChanged.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Add%20Cart/add_cart_bloc.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Add%20Cart/add_cart_event.dart';
import 'package:fashion_e_commerce_mobile_app/Features/WishList/WishList-Controller/WishList_Bloc/wish_list_bloc.dart';
import 'package:fashion_e_commerce_mobile_app/Features/WishList/WishList-Controller/WishList_Bloc/wish_list_event.dart';
import 'package:fashion_e_commerce_mobile_app/Features/WishList/WishList-Controller/WishList_Bloc/wish_list_state.dart';
import 'package:fashion_e_commerce_mobile_app/Features/WishList/WishList-Repository/Get-WishList-Data-Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  void initState() {
    super.initState();
    // WishListLocale.fetchAllProductsWishListFromLocaleStore();
  }

  ValueNotifier<int> Products_Favorite = ValueNotifier(0);

  GetWishListRepository WishListLocale = GetWishListRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WishListBloc(GetWishListRepository())..add(FetchWishListEvent()),
      child: BlocBuilder<WishListBloc, WishListState>(
        builder: (context, state) {
          if (state is WishListLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 250, 141, 17),
              ),
            );
          } else if (state is WishListError) {
            final message = state.message;
            return Center(child: Text('Error: $message'));
          } else if (state is WishListLoaded) {
            final products = state.WishList;
            if (products.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(80),
                  child: Image.asset("assets/Animations/EmptyWishlist.gif"),
                ),
              );
            }

            return ListView.builder(
              // scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, i) {
                Products_Favorite.value = products[i]['products_id'];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      // color: Colors.red,
                      border: Border(
                        bottom:
                            BorderSide(color: Colors.grey.shade400, width: 1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(5),

                              decoration: BoxDecoration(
                                // image: DecorationImage(
                                //     image: NetworkImage(
                                //         '${products[i]['products_image']}'),
                                //     fit: BoxFit.fill),
                                border: Border.all(
                                    width: 1, color: Colors.grey.shade300),

                                borderRadius: BorderRadius.circular(10),
                              ),

                              // color: Colors.red,
                              child: CachedNetworkImage(
                                imageUrl: '${products[i]['products_image']}',
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
                                              "${products[i]['products_name']}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
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
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: WishListChanged(
                                          products_favorite: products[i]
                                              ['products_favorite'],
                                          Index: products[i]['products_id'],
                                          Page_Index: 2,
                                        ),
                                      ),
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
                                    Text(
                                      "${products[i]['products_price']}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(fontSize: 15),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12),
                                      child: InkWell(
                                        onTap: () {
                                          // LoadingAddCart(
                                          //     products[i]['products_id'],
                                          //     Cart_Counters.value,
                                          //     context);
                                          context.read<AddCartBloc>().add(
                                              ToggleAddCart(
                                                  productId: products[i]
                                                      ['products_id'],
                                                  ChangedValue:
                                                      Cart_Counters.value));
                                          // Navigator.of(context).pop();
                                          AddCartSuccessfully(context);
                                        },
                                        child: Container(
                                          width: 90,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Add to Cart",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                            ),
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
