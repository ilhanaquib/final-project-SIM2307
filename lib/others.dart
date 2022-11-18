import 'package:flutter/material.dart';

import 'cart.dart';

class others extends StatefulWidget {
  const others({Key? key}) : super(key: key);

  @override
  State<others> createState() => _othersState();
}

class _othersState extends State<others> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Others'),
          actions:[
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return cart();
                  }));
                },
                icon: Icon(Icons.shopping_cart))
          ]
      ),
    );
  }
}