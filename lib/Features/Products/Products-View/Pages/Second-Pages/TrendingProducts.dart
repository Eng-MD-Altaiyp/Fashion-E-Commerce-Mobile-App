import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Products-Bloc/view_stored_data_bloc.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Products-Bloc/view_stored_data_event.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Products-Bloc/view_stored_data_state.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Widgets/WishListChanged.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Pages/Second-Pages/Filter.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Pages/Second-Pages/product_details_screen.dart';
import 'package:fashion_e_commerce_mobile_app/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Trendingproducts extends StatefulWidget {
  const Trendingproducts({super.key});

  @override
  State<Trendingproducts> createState() => _TrendingproductsState();
}

class _TrendingproductsState extends State<Trendingproducts> {

  @override
  void initState() {
    super.initState();
    // setState(() {
    //   URI_API = "https://fakestoreapi.com/products";
    //   Select_Store = "SELECT * FROM products ";
    //   Local.fetchAllProducts();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Trending Products",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const main_navigation()),
                (route) => false,
              );
            });
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
              child: AspectRatio(
                aspectRatio: 10 / 1.2,
                child: Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: BlocBuilder<ProductBloc, ProductState>(
                        builder: (context, state) {
                          if (state is ProductLoaded) {
                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 5, left: 5),
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<ProductBloc>(context).add(
                                        const ChangeCategories(
                                          onSelect: "All",
                                          selectStore: "SELECT * FROM products",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: OnSelect == "All"
                                            ? Colors.black
                                            : Colors.white,
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "All",
                                          style: TextStyle(
                                            color: OnSelect == "All"
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 5, left: 5),
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<ProductBloc>(context).add(
                                        const ChangeCategories(
                                          onSelect: "Men",
                                          selectStore:
                                          "SELECT * FROM products WHERE products_category = 'men'",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 55,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1,
                                        ),
                                        color: OnSelect == "Men"
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Men",
                                          style: TextStyle(
                                            color: OnSelect == "Men"
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 5, left: 5),
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<ProductBloc>(context).add(
                                        const ChangeCategories(
                                          onSelect: "Women",
                                          selectStore:
                                          "SELECT * FROM products WHERE products_category = 'women'",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1,
                                        ),
                                        color: OnSelect == "Women"
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Women",
                                          style: TextStyle(
                                            color: OnSelect == "Women"
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 5, left: 5),
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<ProductBloc>(context).add(
                                        const ChangeCategories(
                                          onSelect: "Electronics",
                                          selectStore:
                                          "SELECT * FROM products WHERE products_category = 'electronics'",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1,
                                        ),
                                        color: OnSelect == "Electronics"
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Electronics",
                                          style: TextStyle(
                                            color: OnSelect == "Electronics"
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 5, left: 5),
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<ProductBloc>(context).add(
                                        const ChangeCategories(
                                          onSelect: "Jewelery",
                                          selectStore:
                                          "SELECT * FROM products WHERE products_category = 'jewelery'",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1,
                                        ),
                                        color: OnSelect == "Jewelery"
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Jewelery",
                                          style: TextStyle(
                                            color: OnSelect == "Jewelery"
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }  else {
                            return ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 5, left: 5),
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<ProductBloc>(context).add(
                                        const ChangeCategories(
                                          onSelect: "All",
                                          selectStore: "SELECT * FROM products",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: OnSelect == "All"
                                            ? Colors.black
                                            : Colors.white,
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "All",
                                          style: TextStyle(
                                            color: OnSelect == "All"
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 5, left: 5),
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<ProductBloc>(context).add(
                                        const ChangeCategories(
                                          onSelect: "Men",
                                          selectStore:
                                          "SELECT * FROM products WHERE products_category = 'men'",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 55,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1,
                                        ),
                                        color: OnSelect == "Men"
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Men",
                                          style: TextStyle(
                                            color: OnSelect == "Men"
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 5, left: 5),
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<ProductBloc>(context).add(
                                        const ChangeCategories(
                                          onSelect: "Women",
                                          selectStore:
                                          "SELECT * FROM products WHERE products_category = 'women'",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1,
                                        ),
                                        color: OnSelect == "Women"
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Women",
                                          style: TextStyle(
                                            color: OnSelect == "Women"
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 5, left: 5),
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<ProductBloc>(context).add(
                                        const ChangeCategories(
                                          onSelect: "Electronics",
                                          selectStore:
                                          "SELECT * FROM products WHERE products_category = 'electronics'",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 80,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1,
                                        ),
                                        color: OnSelect == "Electronics"
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Electronics",
                                          style: TextStyle(
                                            color: OnSelect == "Electronics"
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, bottom: 5, right: 5, left: 5),
                                  child: InkWell(
                                    onTap: () {
                                      BlocProvider.of<ProductBloc>(context).add(
                                        const ChangeCategories(
                                          onSelect: "Jewelery",
                                          selectStore:
                                          "SELECT * FROM products WHERE products_category = 'jewelery'",
                                        ),
                                      );
                                    },
                                    child: Container(
                                      width: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 1,
                                        ),
                                        color: OnSelect == "Jewelery"
                                            ? Colors.black
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Jewelery",
                                          style: TextStyle(
                                            color: OnSelect == "Jewelery"
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 1, left: 1),
              child: AspectRatio(
                aspectRatio: 10 / 1.2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const Filter(),
                              ),
                            );
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              "assets/Icon_SVG/filter.svg",
                              color: Colors.black,
                              width: 25,
                            ),
                            Text(
                              "Filters",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(),
                          SvgPicture.asset(
                            "assets/Icon_SVG/switch-address.svg",
                            color: Colors.black,
                            width: 25,
                          ),
                          Text(
                            "Filters",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: double.infinity,
                child: Center(
                  child: Center(
                    child: BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        if (state is ProductInitial || state is ProductLoading) {
                          return const Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              color: Color.fromARGB(255, 250, 141, 17),
                            ),
                          );
                        } else if (state is ProductLoaded) {
                          final products = state.products;
                          return GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 0.8,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: products.length + 1,
                            itemBuilder: (context, index) {
                              return index < products.length
                                  ? buildProductCard(products, index)
                                  : const SizedBox(
                                height: 10,
                              );
                            },
                          );
                        } else if (state is ProductError) {
                          return Center(child: Text(state.message));
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProductCard(var product, int i) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProductDetailsScreen(
                ID: product[i]['products_id'],
                products: product,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 7,
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                              ID: product[i]['products_id'],
                              products: product,
                            ),
                          ),
                        );
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //     image: NetworkImage(
                              //         '${product[i]["products_image"]}'),
                              //     fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10),
                            ),
                              child: CachedNetworkImage(
                                imageUrl: '${product[i]['products_image']}',
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
                    ),
                    Positioned(
                      top: 25,
                      right: 25,
                      child: WishListChanged(
                        products_favorite: product[i]['products_favorite'],
                        Index: product[i]['products_id'], Page_Index: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${product[i]['products_name']}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      Text(
                        "\$${product[i]['products_price']}",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontSize: 20, color: Primary),
                      ),
                    ],
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
