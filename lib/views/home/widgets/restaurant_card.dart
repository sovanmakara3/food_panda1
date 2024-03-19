import 'package:flutter/material.dart';
import 'package:food_panda/views/business_owner/add_restaurant.dart';
import 'package:food_panda/views/home/models/restaurant.dart';
import 'package:food_panda/views/home/viewmodels/restaurant_vm.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';

// class RestaurantCard extends StatelessWidget {
//   RestaurantCard({
//     required this.restaurant,
//     super.key,
//   });
//
//   Datum? restaurant;
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(context, MaterialPageRoute(
//             builder: (context) => AddRestaurant(isFromUpdate: true,restaurant: restaurant,)));
//       },
//       child: Padding(
//         padding: const EdgeInsets.only(left: 16, top: 16, right: 8),
//         child: Container(
//           width: MediaQuery.of(context).size.width * .75,
//           height: 330,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // stack for put something on picture like: top restaurant, and 15 min
//               Stack(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Container(
//                       height: 250,
//                       width: MediaQuery.of(context).size.width * .75,
//                       child: Image.network(
//                           'https://cms.istad.co${restaurant!.attributes!.picture!.data!.attributes!.url!}',
//                         fit: BoxFit.fill,
//                       ),
//                     )),
//                   Positioned(
//                     top: 10,
//                     child: Container(
//                       padding: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.only(topRight: Radius.circular(17), bottomRight: Radius.circular(17),),
//                       ),
//                       child: Text('Top restaurant', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 10,
//                     left: 10,
//                     child: Container(
//                       padding: EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.all(Radius.circular(17))
//                       ),
//                       child: Text('${restaurant!.attributes!.deliveryTime!}min', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 5),
//                   Text(restaurant!.attributes!.name.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), overflow: TextOverflow.ellipsis,),
//                   SizedBox(height: 5),
//                   Text("\$\$. ${restaurant!.attributes!.category}",style: TextStyle(fontSize: 16, color: Colors.grey.shade700), overflow: TextOverflow.ellipsis,),
//                   SizedBox(height: 5),
//                   Text('\$ ${restaurant!.attributes!.deliveryFee}delivery fee', style: TextStyle(fontWeight: FontWeight.bold),),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//

class RestaurantCard extends StatelessWidget {
  RestaurantCard({required this.restaurant, super.key});

  final Datum? restaurant;
  var restaurantViewModel = RestaurantViewModel();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                width: double.infinity,
                height: 170,
                color: Colors.grey.shade100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Are you sure to remove this Restaurant?',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    ChangeNotifierProvider(
                      create: (context) => restaurantViewModel,
                      child: Consumer<RestaurantViewModel>(
                        builder: (context, viewModel, _) {
                          if (viewModel.response.status == Status.COMPLETED) {
                            print('delete complete');
                            Navigator.pop(context);
                          }
                          return TextButton(
                            onPressed: () {
                              restaurantViewModel.deleteRestaurant(restaurant!.id);
                            },
                            child: const Text('Remove Restaurant', style: TextStyle(color: Colors.red),
                            ),
                          );
                        },
                      ),
                    ),
                    TextButton(onPressed: () {}, child: const Text('Cancel')),
                  ],
                ),
              );
            });
      },
      onTap: () { Navigator.push(context,
          MaterialPageRoute(
            builder: (context) => AddRestaurant(
              isFromUpdate: true,
              restaurant: restaurant,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 8),
        child: Container(
          width: MediaQuery.of(context).size.width * .75,
          height: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width * .75,
                      child: Image.network(
                        'https://cms.istad.co${restaurant?.attributes?.picture?.data?.attributes?.url}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 6, bottom: 6),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(17))),
                      child: Text(
                        '${restaurant!.attributes!.deliveryTime!}min',
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 6, bottom: 6),
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(17),
                          bottomRight: Radius.circular(17),
                        ),
                      ),
                      child: const Text(
                        'Top restaurant',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Text(
                    restaurant?.attributes?.name.toString() ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$\$ ${restaurant?.attributes?.category}',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '\$ ${restaurant?.attributes?.deliveryFee} delivery fee',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
