import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';
import './screens/product_detail_screen.dart';
import './screens/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Products(),
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.orange,
          fontFamily: 'Lato',
        ),
        // home: ProductOverviewScreen(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => ProductOverviewScreen(),
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}

// episode 18 skyo
