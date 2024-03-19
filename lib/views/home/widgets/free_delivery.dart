import 'package:flutter/material.dart';

class FreeDelivery extends StatelessWidget {
  const FreeDelivery({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  child: Image.network('https://images.deliveryhero.io/image/fd-kh/LH/n7w0-hero.jpg?width=512&height=384&quality=45'),
                  borderRadius: BorderRadius.circular(15),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 6),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(17),),
                    ),
                    child: Text('50% OFF', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
                Positioned(
                  top: 48,
                  child: Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 6, bottom: 6),
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(17), bottomRight: Radius.circular(17)),
                    ),
                    child: Text('Welcome gift: free delivery', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text('Pasta Master',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16), overflow: TextOverflow.ellipsis,),
                SizedBox(height: 5),
                Text("\$\$. Tea & Coffee, Beverages, Fruit Juice, Food order",style: TextStyle(fontSize: 16, color: Colors.grey.shade700), overflow: TextOverflow.ellipsis,),
                SizedBox(height: 5),
                Text('\$ 0.65 delivery fee', style: TextStyle(fontWeight: FontWeight.bold),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
