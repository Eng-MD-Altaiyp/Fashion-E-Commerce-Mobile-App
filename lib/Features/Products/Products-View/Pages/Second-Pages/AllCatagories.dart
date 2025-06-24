import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Repository/Get-All-Catagories.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Widgets/Search-Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class AllCatagories extends StatefulWidget {
  const AllCatagories({super.key});

  @override
  State<AllCatagories> createState() => _AllCatagoriesState();
}

class _AllCatagoriesState extends State<AllCatagories> {

  GetAllCatagories Data = GetAllCatagories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            const AspectRatio(
              aspectRatio: 10 /2,
              child: SearchVoice(),
            ),
            AspectRatio(
              aspectRatio: 10 /16.8,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: FutureBuilder<List>(
                  future: Data.fetchCatagories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromARGB(255, 250, 141, 17),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: SvgPicture.asset("assets/Icon_SVG/error-connection.svg",color: ErrorColor,width: 80,),);
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No previous search'));
                    }
                    final product = snapshot.data!;
                    return GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: product.length + 1,
                      itemBuilder: (context, index) {
                        return index < product.length
                            ? buildShoeCard(product, index)
                            : const SizedBox(
                                height: 10,
                              );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShoeCard(var product, int i) {
    return Container(
      margin: const EdgeInsets.only(top: 5, right: 2, left: 2, bottom: 5),
      // width: w1 / 4.5,
      // height: h1,
      // color: Orange,
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: LayoutBuilder(
              builder: (context, sizes) {
                // double w2 = sizes.maxWidth;
                // double h2 = sizes.maxHeight;
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(w2/1),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            Images_catagory[i],
                          ),
                          fit: BoxFit.cover,
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
            flex: 2,
            child: Center(
              child: Column(
                children: [
                  Text(
                    '${product[i]}',style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith( fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,)
                    ,textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '250 + Products',style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith( fontSize: 17,color: Colors.grey.shade500,)
                      ,textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
