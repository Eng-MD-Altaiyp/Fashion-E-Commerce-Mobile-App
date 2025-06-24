import 'package:cached_network_image/cached_network_image.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Products-Bloc/view_stored_data_bloc.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Products-Bloc/view_stored_data_event.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/Products-Bloc/view_stored_data_state.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Pages/Second-Pages/AllCatagories.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Pages/Second-Pages/TrendingProducts.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Pages/Second-Pages/product_details_screen.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Widgets/Search-Widget.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Widgets/ViewCatagories.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Widgets/WishListChanged.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ApiService apiService = ApiService();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            const SearchVoice(),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Catagories",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const AllCatagories(),
                        ),
                      );
                    },
                    child: Text(
                      "See All",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Primary,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const ViewCategories(),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending Product",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const Trendingproducts(),
                        ),
                      );
                    },
                    child: Text(
                      "See All",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Primary,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10, right: 1, left: 1),
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
                          }
                          else {
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
            const SizedBox(
              height: 20,
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
              builder: (_) => ProductDetailsScreen(
                  ID: product[i]['products_id'],
                  products: product),
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
                            builder: (_) => ProductDetailsScreen(
                                ID: product[i]['products_id'],
                                products: product),
                          ),
                        );
                      },
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider('${product[i]["products_image"]}',),
                                fit: BoxFit.fill
                              ),
                              borderRadius: BorderRadius.circular(10),
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


