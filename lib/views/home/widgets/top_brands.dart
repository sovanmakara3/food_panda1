import 'package:flutter/material.dart';

class TopBrand extends StatelessWidget {
  const TopBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16),
      child: Container(
        width: MediaQuery.of(context).size.width * .23,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
              ),
              padding: EdgeInsets.all(15),
              height: 100,
              child: Image.asset('assets/Images/starbuck.png'),),
            Text('Starbucks', style: TextStyle(fontWeight: FontWeight.bold),),
            Text('30 mins', style: TextStyle(color: Colors.grey.shade800),),
          ],
        ),
      ),
    );
  }
}
