import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../providers/item_providers.dart';
import 'cart_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("PRODUCTS",
          style: TextStyle(
            color: Colors.white,
        ),),
        backgroundColor: Colors.deepPurple,
        actions: [
          GestureDetector(
            onTap:(){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Cart()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Icon(Icons.shopping_bag_outlined,color: Colors.white,),
            ),
          )
        ],
      ),
      body:Consumer<ItemProviders>(
        builder:(context,value,child) => Column(
            children:[
              Expanded(
                child: ListView.builder(
                    itemCount:value.ElectronicItems.length,
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
                                  child:Image.asset(value.ElectronicItems[index].itemImage),
                                  height:150,
                                ),
                                Text(value.ElectronicItems[index].itemName,
                                style:TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                )),
                                SizedBox(height:4),
                                Text(value.ElectronicItems[index].itemDesc,
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
                                      child: Text(value.ElectronicItems[index].price,
                                          style:TextStyle(fontWeight: FontWeight.bold))),
                          GestureDetector(onTap:(){
                                      if(value.favList.contains(value.ElectronicItems[index])){
                                      value.removeFromCart(value.ElectronicItems[index]);
                                      print(value.favList);
                                      }
                                      else{
                                      value.addToCart(value.ElectronicItems[index]);
                                      print(value.favList);
                                      }
                                      },
                                    child: Icon(Icons.favorite,
                                        color: value.favList.contains(value.ElectronicItems[index])?Colors.red:Colors.black)),


                                ]
                        )


                              ],
                            ),
                          )
                        )
                      );
                      // return Container(
                      //   height:300,
                      //   width:300,
                      //   child: Expanded(
                      //     child: Column(
                      //       children: [
                      //         Image.asset(value.ElectronicItems[index].itemImage,
                      //         width:50.0,
                      //         height:50.0),
                      //         Text(value.ElectronicItems[index].itemName,
                      //         style: TextStyle(
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.bold,
                      //         ),),
                      //         Text(value.ElectronicItems[index].itemDesc,
                      //           style: TextStyle(
                      //             fontSize: 20,
                      //             fontWeight: FontWeight.bold,
                      //           ),),
                      //       GestureDetector(onTap:(){
                      //           if(value.favList.contains(value.ElectronicItems[index])){
                      //           value.removeFromCart(value.ElectronicItems[index]);
                      //           print(value.favList);
                      //           }
                      //           else{
                      //           value.addToCart(value.ElectronicItems[index]);
                      //           print(value.favList);
                      //           }
                      //           },
                      //         child: Icon(Icons.favorite,
                      //             color: value.favList.contains(value.ElectronicItems[index])?Colors.red:Colors.black)),
                      //
                      //       ],
                      //     ),
                      //   ),
                      // );
                      // return ListTile(
                      //   title: Text(value.ElectronicItems[index].itemName),
                      //   subtitle: Text(value.ElectronicItems[index].itemDesc),
                      //   leading: CircleAvatar(child: Image.asset(value.ElectronicItems[index].itemImage)),
                      //   trailing: GestureDetector(onTap:(){
                      //         if(value.favList.contains(value.ElectronicItems[index])){
                      //         value.removeFromCart(value.ElectronicItems[index]);
                      //         print(value.favList);
                      //         }
                      //         else{
                      //         value.addToCart(value.ElectronicItems[index]);
                      //         print(value.favList);
                      //         }
                      //         },
                      //       child: Icon(Icons.favorite,
                      //           color: value.favList.contains(value.ElectronicItems[index])?Colors.red:Colors.black)),
                      //
                      // );
                    }
                ),
              ),
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        Cart()));

              }, child: Text("go to cart"),)
            ]
        ),
      ),



    );
  }
}
