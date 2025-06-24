import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-View/Pages/Second-Pages/SearchForVoice.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Search-Products/Search-Products-View/Search-Products-From-Api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SearchVoice extends StatefulWidget {
  const SearchVoice({super.key});

  @override
  State<SearchVoice> createState() => _SearchVoiceState();
}

class _SearchVoiceState extends State<SearchVoice> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 5, right: 10, left: 10),
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
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const SearchProducts(),
                      ),
                    );
                  },
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
                          child:  Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: SvgPicture.asset(
                                  'assets/Icon_SVG/search.svg'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Text(
                            "Search your product",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey.shade300),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, right: 10, left: 7),
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
    );
  }
}
