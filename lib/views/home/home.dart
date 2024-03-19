import 'package:flutter/material.dart';
import 'package:food_panda/views/home/skeletons/restaurant_ske.dart';
import 'package:food_panda/views/home/viewmodels/restaurant_vm.dart';
import 'package:food_panda/views/home/widgets/category/pick_up.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import '../../data/response/status.dart';
import '../business_owner/add_restaurant.dart';
import 'widgets/drawer.dart';
import 'widgets/free_delivery.dart';
import 'widgets/restaurant_card.dart';
import 'widgets/top_brands.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.white,
  );

  var _restaurantViewModel = RestaurantViewModel();

  @override
  void initState() {
    super.initState();
    _restaurantViewModel.getAllRestaurant();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      //App bar
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "2 St 562",
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Phnom Penh",
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.pink,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddRestaurant(isFromUpdate: false,)));
                },
                icon: const Icon(
                  Ionicons.heart_outline,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: SafeArea(
        child: MyDrawer(),
      ),
      // body: BodyContainer(),
      // Sliver app bar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Food delivery
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => pickUp()));
              },
              child: Container(
                margin: const EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 15, top: 15, right: 5, bottom: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Food Delivery',
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const Text('Order food you love'),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Image.asset(
                          'assets/Images/burger1.png',
                          fit: BoxFit.contain,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Categories
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: const EdgeInsets.only(right: 8, left: 16),
                    decoration: boxDecoration,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, top: 15, right: 5, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Groceries',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'Supermarkets, Marts \nShops, & more',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              'assets/Images/Drink_melon.png',
                              fit: BoxFit.contain,
                              width: 120,
                              height: 120,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 300,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.only(right: 16, left: 8, bottom: 8),
                            decoration: boxDecoration,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 15, bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pick-up',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        'Up to 50% off',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                      'assets/Images/order.png',
                                      //fit: BoxFit.contain,
                                      width: 100,
                                      height: 100,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(right: 16, left: 8, top: 8),
                            decoration: boxDecoration,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, top: 15, bottom: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'pandasend',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Flexible(
                                          child: Text(
                                            'Send parcels \nin a tap',
                                            style: TextStyle(fontSize: 12),
                                          )),
                                      Image.asset(
                                        'assets/Images/hold.png',
                                        width: 46,
                                        height: 46,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // top brands to more...
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16, left: 16),
                      child: Text('Top brands', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                    ),

                    // Top brands slide
                    SizedBox(
                      height: 180,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (context, index) => TopBrand(),
                      ),
                    ),

                    // Label Free delivery
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 16),
                      child: Text('Free delivery', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                    ),

                    //Free delivery slide
                    SizedBox(
                      height: 350,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) => FreeDelivery(),
                      ),
                    ),

                    // Label
                    const Padding(
                      padding: EdgeInsets.only(top: 8, left: 16),
                      child: Text('Top Restaurant', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                    ),

                    // Top restaurant slide
                    SizedBox(
                      height: 350,
                      child: ChangeNotifierProvider(
                        create: (context) => _restaurantViewModel,
                        child: Consumer<RestaurantViewModel>(
                          builder: (context, viewModel, _){
                            switch(viewModel.response.status!){
                              case Status.LOADING:
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 10,
                                  itemBuilder: (context, index) => RestaurantCardSkeleton(),
                                );
                              case Status.COMPLETED:
                                return ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 20,
                                  itemBuilder: (context, index) {
                                    var restaurant = viewModel.response.data!.data![index];
                                    return RestaurantCard(restaurant: restaurant,);
                                    },
                                );
                              case Status.ERROR:
                                return const Text('Error');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
