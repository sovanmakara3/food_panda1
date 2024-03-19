import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';


class RestaurantCardSkeleton extends StatelessWidget {
  const RestaurantCardSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, top: 16, right: 8),
        child: Container(
          width: MediaQuery.of(context).size.width * .75,
          height: 330,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              // stack for put something on picture like: top restaurant, and 15 min
              Stack(
                children: [
                  ClipRRect(
                    child: Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * .75,
                      height: 250,
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  Positioned(
                    top: 10,
                    child: Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(17), bottomRight: Radius.circular(17),),
                      ),
                      child: Text('Top restaurant', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                      decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(17))
                      ),
                      child: Text('15 min', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text('TUBE COFFEE TOUL KORK SAMAI SQUARE',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 5),
                  Text("\$\$. Tea & Coffee, Beverages, Fruit Juice, Food order",style: TextStyle(fontSize: 16, color: Colors.grey.shade700), overflow: TextOverflow.ellipsis,),
                  SizedBox(height: 5),
                  Text('\$ 0.65 delivery fee', style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
