import 'package:fashion_e_commerce_mobile_app/Core/DataBease%20Created/Data%20Source.dart';
import 'package:flutter/material.dart';

List Images_catagory = [
  'assets/Images/RR.png',
  'assets/Images/R.jpg',
  'assets/Images/OIP_2.jpg',
  'assets/Images/download.jpg',
  'assets/Images/OIP.jpg',
  'assets/Images/OIP.jpg',
];

String apiUrl = "https://dummyjson.com/products";


List Names_Meads = [
  'Men\'s Shirts',
  'Men\'s Shirts',
  'Men\'s Shirts',
  'Men\'s Shirts',
  'Men\'s Shirts',
  'Men\'s Shirts',
];


List<Map> Carts = [
];
double? ScreenWidth;
double? ScreenHeight;


DataBase_Metter data_metter = DataBase_Metter();
const String baseUrl = "https://fakestoreapi.com";

ValueNotifier<List<bool>> MyFavoriteListForApiSearch = ValueNotifier(List.generate(30, (index) => false),);

ValueNotifier<int> Cart_Counters = ValueNotifier(1);
ValueNotifier<int> CountersForCart = ValueNotifier(0);
String OnSelect = "All";

List<bool> favo_a = List.filled(2, false);

String URI_API = "https://fakestoreapi.com/products";
String Select_Store = "SELECT * FROM products";
var jewelery;
var electronics;
var mensclothing;
var womensclothing;









int totalProductsCart = 0;
double totalProductsPrice = 0.0;
double totalCartPrice = 0.0;
double Total = 0.0;



