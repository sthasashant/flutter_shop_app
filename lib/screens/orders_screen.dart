import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    // final orders = Provider.of<Orders>(context).orders;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapShot) {
          if (dataSnapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (dataSnapShot.error != null) {
              return Center(
                child: Text('An error occurred'),
              );
            } else {
              return Consumer<Orders>(
                builder: (ctx, orderData, child) => ListView.builder(
                  itemCount: orderData.orders.length,
                  itemBuilder: (BuildContext context, int index) =>
                      OrderItem(orderData.orders[index]),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

// ALTERNATE METHOD

// class OrdersScreen extends StatefulWidget {
//   static const routeName = '/orders';

//   @override
//   _OrdersScreenState createState() => _OrdersScreenState();
// }

// class _OrdersScreenState extends State<OrdersScreen> {
//   Future _ordersFuture;
//   Future _obtainedOrdersFuture() {
//     return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
//   }

//   @override
//   void initState() {
//     _ordersFuture = _obtainedOrdersFuture();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final orders = Provider.of<Orders>(context).orders;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Orders'),
//       ),
//       drawer: AppDrawer(),
//       body: FutureBuilder(
//         future: _ordersFuture,
//         builder: (ctx, dataSnapShot) {
//           if (dataSnapShot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             if (dataSnapShot.error != null) {
//               return Center(
//                 child: Text('An error occurred'),
//               );
//             } else {
//               return Consumer<Orders>(
//                 builder: (ctx, orderData, child) => ListView.builder(
//                   itemCount: orderData.orders.length,
//                   itemBuilder: (BuildContext context, int index) =>
//                       OrderItem(orderData.orders[index]),
//                 ),
//               );
//             }
//           }
//         },
//       ),
//     );
//   }
// }
