import 'package:flutter/material.dart';
import 'orderReceived.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

enum paymentMethod {card , online, cash}

class _paymentState extends State<payment> {
  paymentMethod? _method = paymentMethod.card;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Payment method'),
        ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(child:
                  RadioListTile(
                      title: Text('Credit / Debit Card'),
                      value: paymentMethod.card,
                      groupValue: _method,
                      onChanged: (paymentMethod? value){
                    setState(() {
                      _method = value;
                    });
                  }
                   )
                  ),
                  Expanded(child:
                  Image(image: AssetImage('assets/image/credit card.png'))
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 50)),
              Row(
                children: [
                  Expanded(child:
                  RadioListTile(
                      title: Text('Online Banking'),
                      value: paymentMethod.online,
                      groupValue: _method,
                      onChanged: (paymentMethod? value){
                        setState(() {
                          _method = value;
                        });
                      }
                  )
                  ),
                  Expanded(child:
                  Image(image: AssetImage('assets/image/fpx logo.png'))
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(bottom: 50)),
              Row(
                children: [
                  Expanded(child:
                  RadioListTile(
                      title: Text('Cash on Delivery'),
                      value: paymentMethod.cash,
                      groupValue: _method,
                      onChanged: (paymentMethod? value){
                        setState(() {
                          _method = value;
                        });
                      }
                  )
                  ),
                  Expanded(child:
                  Image(image: AssetImage('assets/image/cash.png'))
                  ),
                ],
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextButton(
            onPressed: (){
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return orderReceived();
              }));
            },
            child: Text('Pay Now'))
      ),
    );
  }
}