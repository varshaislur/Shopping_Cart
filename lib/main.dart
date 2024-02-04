import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_app/providers/item_providers.dart';
import 'package:shopping_cart_app/screens/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemProviders(),
      child: MyApp(), // Replace with your app's root widget
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

