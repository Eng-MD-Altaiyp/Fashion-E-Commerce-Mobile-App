import 'package:fashion_e_commerce_mobile_app/Core/Colors/Colors.dart';
import 'package:fashion_e_commerce_mobile_app/Core/Globle%20Variables/Globle_Variables.dart';
import 'package:flutter/material.dart';


class Count extends StatefulWidget {
  final int Index;
  final List products;

  const Count({super.key, required this.Index, required this.products});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  // double Price = 0.0;
  ValueNotifier<int> counter = ValueNotifier(1);
  ValueNotifier<double> Price = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    Price.value = widget.products[widget.Index]['products_price'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ValueListenableBuilder(
              valueListenable: Price,
              builder: (context, value, child) {
                return RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "\$${Price.value.toStringAsFixed(2)}  ",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Primary),
                      ),
                      TextSpan(
                        text: "\$${widget.products[widget.Index]['products_price']*2}",
                        style: TextStyle(
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey.shade400),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade400, width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      if (counter.value > 1) {
                        counter.value--;
                        Cart_Counters.value --;
                        Price.value -=
                        widget.products[widget.Index]['products_price'];
                      } else {
                        counter.value = 1;
                        // Cart_Counters.value = 1;
                      }
                    },
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 3),
                        child: Icon(
                          Icons.exposure_minus_1_sharp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: counter,
                    builder: (context, value, child) {
                      return Center(
                        child: Text(
                          "${counter.value}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      // context.read<CounterBloc>().add(IncreamentCounter());
                      counter.value++;
                      Cart_Counters.value ++ ;
                      // Counter = Counter + 1;
                      Price.value +=
                      widget.products[widget.Index]['products_price'];
                      // print('pppppppppppppppppppp $Price');
                    },
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(right: 3),
                        child: Icon(
                          Icons.plus_one_sharp,
                          color: Colors.black,
                        ),
                      ),
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