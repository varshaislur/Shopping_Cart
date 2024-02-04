import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/screens/home_page.dart';

import '../providers/item_providers.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("YOUR SHOPPING BAG",
          style: TextStyle(
            color: Colors.white,
          ),),
        backgroundColor: Colors.deepPurple,
        actions: [
          GestureDetector(
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      HomePage()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Icon(Icons.home,color: Colors.white,),
            ),
          )
        ],
      ),
      body:Consumer<ItemProviders>(
        builder:(context,value,child) => Column(
            children:[
              Expanded(
                child: ListView.builder(
                    itemCount:value.favList.length,
                    itemBuilder:(context,index) {
                      return Center(
                          child:Container(
                              margin: EdgeInsets.all(20),
                              width:265,
                              height:300,
                              decoration: BoxDecoration(
                                  color:Colors.white,
                                  borderRadius:BorderRadius.circular(15),
                                  boxShadow: [BoxShadow(
                                    color:Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(0,3),


                                  )
                                  ]

                              ),
                              child:Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      child:Image.asset(value.favList[index].itemImage),
                                      height:150,
                                    ),
                                    Text(value.favList[index].itemName,
                                        style:TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(height:4),
                                    Text(value.favList[index].itemDesc,
                                        style:TextStyle(
                                          fontSize: 16,
                                          //fontWeight: FontWeight.bold,
                                        )),
                                    SizedBox(height:4),
                                    RatingBar.builder(
                                      initialRating: 3,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      itemCount:5,
                                      itemSize: 16,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (BuildContext context, int index) { return Icon(Icons.star,color: Colors.yellow,); },
                                      onRatingUpdate: (double value) {  },

                                    ),
                                    SizedBox(height: 6,),
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children:[ Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(value.favList[index].price,
                                                style:TextStyle(fontWeight: FontWeight.bold))),
                            GestureDetector(onTap:(){
                                  value.removeFromCart(value.favList[index]);
                                },
                                    child: Icon(Icons.delete_outline_outlined,
                                        color: Colors.red)),

                                        ]
                                    )


                                  ],
                                ),
                              )
                          )
                      );
                      // return ListTile(
                      //   title: Text(value.favList[index].itemName),
                      //   subtitle: Text(value.favList[index].itemDesc),
                      //   trailing: GestureDetector(onTap:(){
                      //     value.removeFromCart(value.favList[index]);
                      //   },
                      //       child: Icon(Icons.remove_circle,
                      //           color: Colors.black)),
                      //
                      // );
                    }
                ),
              ),
            ]
        ),
      ),



    );
  }
}