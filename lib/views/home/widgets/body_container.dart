// import 'package:flutter/material.dart';
// import 'package:food_panda/views/home/viewmodels/restaurant_vm.dart';
// import 'package:food_panda/views/home/widgets/restaurant_card.dart';
// import 'package:provider/provider.dart';
//
// import 'free_delivery.dart';
// import 'top_brands.dart';
//
// class BodyContainer extends StatelessWidget {
//   BodyContainer({
//     super.key,
//   });
//
//   final boxDecoration = BoxDecoration(
//     borderRadius: BorderRadius.circular(15),
//     color: Colors.white,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Food delivery
//           Container(
//             margin: EdgeInsets.all(16),
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 color: Colors.white, borderRadius: BorderRadius.circular(15)),
//             child: Padding(
//               padding:
//                   const EdgeInsets.only(left: 15, top: 15, right: 5, bottom: 5),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     'Food Delivery',
//                     style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//                   ),
//                   const Text('Order food you love'),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: Image.asset(
//                       'assets/Images/burger1.png',
//                       fit: BoxFit.contain,
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//
//           // Categories
//           Row(
//             children: [
//               Expanded(
//                 flex: 1,
//                 child: Container(
//                   margin: EdgeInsets.only(right: 8, left: 16),
//                   decoration: boxDecoration,
//                   height: 300,
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 15, top: 15, right: 5, bottom: 5),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'Groceries',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 20),
//                             ),
//                             Text(
//                               'Supermarkets, Marts \nShops, & more',
//                               style: TextStyle(fontSize: 12),
//                             ),
//                           ],
//                         ),
//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: Image.asset(
//                             'assets/Images/Drink_melon.png',
//                             fit: BoxFit.contain,
//                             width: 120,
//                             height: 120,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 1,
//                 child: SizedBox(
//                   height: 300,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: Container(
//                           margin: EdgeInsets.only(right: 16, left: 8, bottom: 8),
//                           decoration: boxDecoration,
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 15, top: 15, bottom: 5),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'Pick-up',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 20),
//                                     ),
//                                     Text(
//                                       'Up to 50% off',
//                                       style: TextStyle(fontSize: 12),
//                                     ),
//                                   ],
//                                 ),
//                                 Align(
//                                   alignment: Alignment.bottomRight,
//                                   child: Image.asset(
//                                     'assets/Images/order.png',
//                                     //fit: BoxFit.contain,
//                                     width: 100,
//                                     height: 100,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 1,
//                         child: Container(
//                           margin: EdgeInsets.only(right: 16, left: 8, top: 8),
//                           decoration: boxDecoration,
//                           child: Padding(
//                             padding: const EdgeInsets.only(
//                                 left: 15, top: 15, bottom: 5),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       'pandasend',
//                                       style: TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Flexible(
//                                         child: Text(
//                                       'Send parcels \nin a tap',
//                                       style: TextStyle(fontSize: 12),
//                                     )),
//                                     Image.asset(
//                                       'assets/Images/hold.png',
//                                       width: 46,
//                                       height: 46,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//
//           // top brands to more...
//           Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 16, left: 16),
//                     child: Text('Top brands', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
//                   ),
//
//                   // Top brands slide
//                   SizedBox(
//                     height: 180,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 20,
//                       itemBuilder: (context, index) => TopBrand(),
//                     ),
//                   ),
//
//                   // Label Free delivery
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8, left: 16),
//                     child: Text('Free delivery', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
//                   ),
//
//                   //Free delivery slide
//                   SizedBox(
//                     height: 350,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 10,
//                       itemBuilder: (context, index) => FreeDelivery(),
//                     ),
//                   ),
//
//                   // Label
//                   Padding(
//                     padding: const EdgeInsets.only(top: 8, left: 16),
//                     child: Text('Recommend for you', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
//                   ),
//
//                   // Recommend for you slide
//                   SizedBox(
//                     height: 350,
//                     child: ChangeNotifierProvider(
//                       create: (context) => _restaurantViewModel,
//                       child: Consumer<RestaurantViewModel>(
//                         builder: (context, viewModel, _){
//                           switch(viewModel.response.status){
//                             case Status.LOADING:
//                           }
//                           return ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: 10,
//                             itemBuilder: (context, index) => RestaurantCard(),
//                           );
//                         },
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
