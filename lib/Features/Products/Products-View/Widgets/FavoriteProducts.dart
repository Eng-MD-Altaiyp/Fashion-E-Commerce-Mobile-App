import 'package:flutter/material.dart';



class Favo extends StatefulWidget {
  final int Index;
  final List products;

  const Favo({super.key, required this.products, required this.Index});

  @override
  State<Favo> createState() => _FavoState();
}

class _FavoState extends State<Favo> {

  ValueNotifier<int> Products_Favorite = ValueNotifier(0);
  @override
  void initState() {
    super.initState();
    Products_Favorite.value = widget.products[widget.Index]['products_favorite'];
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 5),
      child: IconButton(
        onPressed: () async {
          // BlocProvider.of<ChangeWishList>(context)
          //     .add(ToggleFavorite(widget.products[widget.Index]['products_id'],widget.products[widget.Index]['products_favorite'],));
        },
        icon: Icon(
          widget.products[widget.Index]['products_favorite'] == 0
              ? Icons.favorite_outline_sharp
              : Icons.favorite,
          color:  widget.products[widget.Index]['products_favorite'] == 0
              ? Colors.grey.shade400
              : Colors.redAccent,
        ),
      ),
    );
  }
}