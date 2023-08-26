import 'package:flutter/material.dart';

class MyContainer extends StatefulWidget {
  const MyContainer({super.key});

  @override
  State<MyContainer> createState() => _MyContainerState();
}

class _MyContainerState extends State<MyContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1.5),
      child: Container(
        height: 80,
        color:Colors.grey,
        padding: const EdgeInsets.all(10.0),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: [
                
                 Icon(Icons.person_pin),
               ],
             ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('title',
                style: TextStyle(
                  color: Colors.black
                ),
                ),
                SizedBox(height: 10,),
                Text('subtitle')
              ],
              
             ),
             Column(
               children: [
                 Text('time'),
               ],
             )
          ],
        )
      ),
    );
  }
}