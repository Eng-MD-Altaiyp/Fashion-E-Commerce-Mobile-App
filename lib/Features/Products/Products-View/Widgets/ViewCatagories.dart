import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/API-Get-All-Catagories-Bloc/api_fetch_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewCategories extends StatefulWidget {
  const ViewCategories({super.key});

  @override
  State<ViewCategories> createState() => _ViewCategoriesState();
}

class _ViewCategoriesState extends State<ViewCategories> {
  // final ApiService apiService = ApiService();
  late Future<List> futureProducts;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 1, left: 1),
      child: AspectRatio(
        aspectRatio: 10 / 3,
        child: Center(
          child: LayoutBuilder(
            builder: (context, sizes) {
              double w1 = sizes.maxWidth;
              return BlocProvider<ApiFetchDataBloc>(
                create: (context) => ApiFetchDataBloc(
                    Uri: 'https://fakestoreapi.com/products/categories',Api_Type: 1),
                child: BlocBuilder<ApiFetchDataBloc, ApiFetchDataState>(
                  builder: (context, state) {
                    if (state is ApiFetchDataInitial ||
                        state is ApiFetchDataLoading) {
                      return const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 250, 141, 17),
                        ),
                      );
                    } else if (state is ApiDtatLooaded) {
                      final products = state.products;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: products.length,
                        itemBuilder: (context, i) {
                          return Other_user(w1, i, products);
                        },
                      );
                    } else if (state is ApiErrorFetchData) {
                      return Center(child: SvgPicture.asset("assets/Icon_SVG/error-connection.svg",color: ErrorColor,width: 80,),);
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget Other_user(double w1, int i, var Catagory) {
    return Container(
      margin: const EdgeInsets.only(top: 5, right: 2, left: 2, bottom: 5),
      width: w1 / 4.5,
      // height: h1,
      // color: Orange,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: LayoutBuilder(
              builder: (context, sizes) {
                // double w2 = sizes.maxWidth;
                // double h2 = sizes.maxHeight;
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            Images_catagory[i],
                          ),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.grey.shade50,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                '${Catagory[i]}',
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
