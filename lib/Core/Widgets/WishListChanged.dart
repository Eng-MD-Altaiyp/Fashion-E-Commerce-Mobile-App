import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/whislist_bloc/favorite_bloc.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Controller/Bloc/whislist_bloc/favorite_event.dart';
import 'package:fashion_e_commerce_mobile_app/Features/Products/Products-Repository/Get-WishList-Data.dart';
import 'package:fashion_e_commerce_mobile_app/Features/WishList/WishList-Controller/WishList_Bloc/wish_list_bloc.dart';
import 'package:fashion_e_commerce_mobile_app/Features/WishList/WishList-Controller/WishList_Bloc/wish_list_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WishListChanged extends StatefulWidget {
  final int Index;
  final int products_favorite;
  final int Page_Index;

  const WishListChanged(
      {super.key,
      required this.products_favorite,
      required this.Index,
      required this.Page_Index});

  @override
  State<WishListChanged> createState() => _WishListChangedState();
}

class _WishListChangedState extends State<WishListChanged> {
  ValueNotifier<int> Products_Favorite = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    Products_Favorite.value = widget.products_favorite;
  }

  GetWishList WishListLocale = GetWishList();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Products_Favorite,
      builder: (context, value, child) {
        return InkWell(
          onTap: () {
            WishListLocale.fetchAllProductsWishListFromLocaleStore();
            if (Products_Favorite.value == 0) {
              Products_Favorite.value = 1;
              if (widget.Page_Index == 1) {
                context.read<FavoriteBloc>().add(ToggleFavorite(
                    productId: widget.Index,
                    ChangedValue: Products_Favorite.value));
              } else {
                context.read<WishListBloc>().add(UpdateWishListEvent(
                      productId: widget.Index,
                      changedValue: 0,
                    ));
              }

            } else {
              Products_Favorite.value = 0;
              if (widget.Page_Index == 1) {
                context.read<FavoriteBloc>().add(ToggleFavorite(
                    productId: widget.Index,
                    ChangedValue: Products_Favorite.value));
              } else {
                context.read<WishListBloc>().add(UpdateWishListEvent(
                      productId: widget.Index,
                      changedValue: 0,
                    ));
              }
            }
            // context.read<FavoriteBloc>().add(ToggleFavorite(productId: widget.Index,ChangedValue: widget.products_favorite));
            // print('nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn ${widget.products_favorite}');
          },
          child: SizedBox(
            width: 30,
            height: 30,
            child: IconSvg(),
          ),
        );
      },
    );
  }

  IconSvg() {
    if (widget.Page_Index == 1) {
      return SvgPicture.asset(
        Products_Favorite.value == 0
            ? "assets/Icon_SVG/favorite-unselected.svg"
            : "assets/Icon_SVG/favorite-selected.svg",
        allowDrawingOutsideViewBox: true,
      );
    } else {
      return SvgPicture.asset(
        "assets/Icon_SVG/favorite-selected.svg",
      );
    }
  }
}
