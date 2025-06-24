import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Pages/Second-Pages/SearchForVoice.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Search-Products/Search-Products-Controller/API-Search-Bloc/api_fetch_data_bloc.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Search-Products/Search-Products-Repository/Search-Table-Repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';



class SearchProducts extends StatefulWidget {
  const SearchProducts({super.key});

  @override
  State<SearchProducts> createState() => _SearchProductsState();
}



class _SearchProductsState extends State<SearchProducts> {
  SearchDataTable Search_Table = SearchDataTable();

  @override
  void initState() {
    super.initState();
    apiUrl = "https://dummyjson.com/products";
  }

  // ValueNotifier<bool> SelectFavrite = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Search",
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
        ),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: BlocProvider<ApiFetchSearchBloc>(
          create: (context) => ApiFetchSearchBloc(
              Uri: 'https://dummyjson.com/products', Api_Type: 2),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 5, right: 10, left: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  // color: Colors.red,
                  child: LayoutBuilder(builder: (context, sizes) {
                    double w1 = sizes.maxWidth;
                    // double h1 = sizes.maxHeight;
                    return Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 1, left: 10),
                          child: Container(
                            width: w1 / 1.28,
                            decoration: BoxDecoration(
                              color: const Color(0xEEF8F8F8),
                              borderRadius: BorderRadius.circular(5),
                              border: Border(
                                left: BorderSide(color: Colors.grey.shade300),
                                right: BorderSide(color: Colors.grey.shade300),
                                top: BorderSide(color: Colors.grey.shade300),
                                bottom: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: SvgPicture.asset(
                                          'assets/Icon_SVG/search.svg'),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 7,
                                  child: SingleChildScrollView(
                                    child: TextField(
                                      cursorColor: Colors.black,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                        hintText: "Search your product",
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                                color: Colors.grey.shade300),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                      ),
                                      onSubmitted: (value) {
                                        apiUrl =
                                            'https://dummyjson.com/products/search?q=${value.toString()}';
                                        BlocProvider.of<ApiFetchSearchBloc>(
                                                context)
                                            .add(
                                          GetNewSearch(uri_api: apiUrl),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 1, right: 10, left: 7),
                          child: Container(
                            width: w1 / 7.2,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => const SearchForVoice(),
                                    ),
                                  );
                                },
                                icon: const Icon(
                                  Icons.mic_none,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Products Search",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Clear All",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 18, color: Colors.red),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  // height: 120,
                  child: BlocBuilder<ApiFetchSearchBloc, ApiFetchSearchState>(
                    builder: (context, state) {
                      if (state is ApiDataLoaded) {
                        return Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.start,
                          children: Search_Table.Products_List.map((Items) {
                            return Chip(
                              avatar: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.black,
                                child: SvgPicture.asset(
                                  "assets/Icon_SVG/close-circle.svg",
                                  color: Colors.white,
                                  width: 30,
                                ),
                              ),
                              label: InkWell(
                                onTap: () {
                                  if (Items['name'] == "All") {
                                    apiUrl = 'https://dummyjson.com/products';
                                  } else {
                                    apiUrl =
                                        'https://dummyjson.com/products/search?q=${Items['name']}';
                                  }
                                  BlocProvider.of<ApiFetchSearchBloc>(context)
                                      .add(
                                    GetNewSearch(uri_api: apiUrl),
                                  );
                                },
                                child: Text(
                                  '${Items['title']}',
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                              backgroundColor: Colors.black,
                            );
                          }).toList(),
                        );
                      } else {
                        return Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          alignment: WrapAlignment.start,
                          children: Search_Table.Products_List.map((Items) {
                            return Chip(
                              avatar: CircleAvatar(
                                radius: 8,
                                backgroundColor: Colors.black,
                                child: SvgPicture.asset(
                                  "assets/Icon_SVG/close-circle.svg",
                                  color: Colors.white,
                                  width: 30,
                                ),
                              ),
                              label: InkWell(
                                onTap: () {
                                  apiUrl =
                                      'https://dummyjson.com/products/search?q=${Items['name']}';
                                  BlocProvider.of<ApiFetchSearchBloc>(context)
                                      .add(
                                    GetNewSearch(uri_api: apiUrl),
                                  );
                                },
                                child: Text(
                                  '${Items['title']}',
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                              backgroundColor: Colors.black,
                            );
                          }).toList(),
                        );
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending Search",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "View All",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 17,
                            color: Primary,
                          ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16.0,
                  left: 16,
                ),
                child: BlocBuilder<ApiFetchSearchBloc, ApiFetchSearchState>(
                  builder: (context, state) {
                    if (state is ApiFetchDataInitial ||
                        state is ApiFetchDataLoading) {
                      return const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 250, 141, 17),
                        ),
                      );
                    } else if (state is ApiDataLoaded) {
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
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return buildProductCard(products, index);
                        },
                      );
                    } else if (state is ApiErrorFetchData) {
                      return Center(
                        child: SvgPicture.asset(
                          "assets/Icon_SVG/error-connection.svg",
                          color: ErrorColor,
                          width: 80,
                        ),
                      );
                    } else {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(80),
                          child: Image.asset(
                              "assets/Animations/EmptyWishlist.gif"),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductCard(var product, int i) {
    return Padding(
      padding: const EdgeInsets.only(right: 7, left: 7, top: 5, bottom: 5),
      child: InkWell(
        onTap: () {},
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
                      onTap: () {},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      '${product[i]["thumbnail"]}'),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      right: 25,
                      child: ValueListenableBuilder(
                        valueListenable: MyFavoriteListForApiSearch,
                        builder: (context, value, child) {
                          return InkWell(
                            onTap: () {
                              MyFavoriteListForApiSearch.value[i] = !MyFavoriteListForApiSearch.value[i];
                            },
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              // color: Colors.red,
                              child: SvgPicture.asset(
                                  MyFavoriteListForApiSearch.value[i] == false
                                      ? "assets/Icon_SVG/favorite-unselected.svg"
                                      : "assets/Icon_SVG/favorite-selected.svg"
                                  // color: Colors.grey,
                                  ),
                            ),
                          );
                        },
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
                      Text("${product[i]['title']}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      Text(
                        "\$${product[i]['price']}",
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
