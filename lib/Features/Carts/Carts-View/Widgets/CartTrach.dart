import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../Carts-Controller/BLOCs/Carts_Bloc/carts_bloc.dart';
import '../../Carts-Controller/BLOCs/Carts_Bloc/carts_event.dart';



class Carttrach extends StatefulWidget {
  final int id;
  const Carttrach({super.key,required this.id});

  @override
  State<Carttrach> createState() => _CarttrachState();
}

class _CarttrachState extends State<Carttrach> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 1.0),
      child: GestureDetector(
        onTap: ()  {
          context.read<CartsBloc>().add(UpdateCartEvent(productId: widget.id, quantity: 0));
          // UpdateRepositoryCart
          // Data =
          // UpdateRepositoryCart();
          // await Data.updateProductCart(
          //     carts[i]
          //     ['products_name'],
          //     0);
        },
        child: SvgPicture.asset(
          'assets/Icon_SVG/trash.svg',
          color: Colors.red,
          width: 20,
        ),
      ),
    );
  }
}
