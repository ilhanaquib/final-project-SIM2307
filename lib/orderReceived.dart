import 'package:flutter/material.dart';
import 'main.dart';

class orderReceived extends StatefulWidget {
  const orderReceived({Key? key}) : super(key: key);

  @override
  State<orderReceived> createState() => _orderReceivedState();
}

class _orderReceivedState extends State<orderReceived> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF802424),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 100)),
            Image(image: AssetImage('assets/image/checkmark.png')),
            Padding(padding: EdgeInsets.only(bottom: 100)),
            Text('Your Order Has Been Received And Is On The Way.',
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),
            TextButton(onPressed: (){
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return homeScreen();
              }));
            },
                child: Text('Return to Main Page'))
          ],
        ),
      ),
    );
  }
}
