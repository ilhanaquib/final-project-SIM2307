import 'package:flutter/material.dart';

import 'payment.dart';

class cart extends StatefulWidget {
  const cart({Key? key,}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        return Scaffold(
          appBar: AppBar(
            title: Text('Your Cart'),
          ),
          bottomNavigationBar: BottomAppBar(
            child: IconButton(onPressed: (){
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return payment();
              }));
            }, icon: Icon(Icons.payments_outlined),),
          ),
          body: Column(
            children: [
              Card(
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/image/nasi kerabu.jpg'),fit: BoxFit.cover,height: 100,width: 150,),
                    Padding(padding: EdgeInsets.only(right: 20)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(top: 20)),
                        Text('Nasi Kerabu',style: TextStyle(fontSize: 20),),
                        Text('Rm 6.00',style: TextStyle(fontSize: 20),),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Padding(padding: EdgeInsets.only(left: 9)),
                    IconButton(onPressed: (){
                      i--;
                    }, icon: Icon(Icons.arrow_back_sharp)),
                    Text(i.toString()),
                    IconButton(onPressed: (){
                      i++;
                    }, icon: Icon(Icons.arrow_forward_sharp)),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 550)),
              Text('___________________________________________________________'),
              Row(
                children: [
                  Text('Subtotal : RM 6.00')
                ],
              )
            ],
          ),
        );
    }
    );
  }
}






