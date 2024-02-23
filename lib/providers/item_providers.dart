import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/models/item_model.dart';

import '../models/item_model.dart';
import '../models/item_model.dart';

class ItemProviders extends ChangeNotifier
{

  List <Items> ElectronicItems = [
    Items(
      itemName:"Neon green shoes", itemDesc: 'Best for table tennis', price: '\$25',itemImage:"assets/greenShoes-removebg-preview.png"
    ),
    Items(
      itemName:"Blue Lace-up Sneakers", itemDesc: 'waterproof and easy to wear', price: '\$25',itemImage:"assets/blueShoes2-removebg-preview.png"
    ),
    Items(
      itemName:"Red Canvas", itemDesc: 'trendy and stylish', price: '\$25',itemImage:"assets/redCanvas-removebg-preview.png"
    ),
    Items(
      itemName:"Teal Sports shoes", itemDesc: 'For hiking and rock climbing', price: '\$25',itemImage:"assets/tealShoes-removebg-preview.png"
    ),
    Items(
      itemName:"Black Formal shoes", itemDesc: 'For a perfect professional look', price: '\$25',itemImage:"assets/blackFormals-removebg-preview.png"
    ),

  ];

  List <Items> favList=[];

  void addToCart(ElectronicItems){
    favList.add(ElectronicItems);
    notifyListeners();
  }
  void removeFromCart(ElectronicItems){
    favList.remove(ElectronicItems);
    notifyListeners();
  }
}


