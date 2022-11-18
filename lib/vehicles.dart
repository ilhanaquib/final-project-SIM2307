import 'package:flutter/material.dart';
import 'vehicles_model.dart';
import 'vehicleDetail.dart';
import 'package:get/get.dart ';
import 'cartController.dart';
import 'cart.dart';

class vehicle extends StatefulWidget {
  const vehicle({Key? key}) : super(key: key);

  @override
  State<vehicle> createState() => _vehicleState();
}

class _vehicleState extends State<vehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Vehicles'),
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
        body: ListView.builder(
          itemCount: vehicleProduct.vehicleproducts.length,
          itemBuilder: (context, index){
            final cartController = Get.put(CartController());
            String name = '${vehicleProduct.vehicleproducts[index].name}';
            String image = '${vehicleProduct.vehicleproducts[index].image}';
            String price = '${vehicleProduct.vehicleproducts[index].price.toStringAsFixed(2)}';
            String desc = '${vehicleProduct.vehicleproducts[index].desc}';
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 410,
                      child: InkWell(onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return vehicleDetail(title: name, image: image, price: price, desc: desc);
                          })
                      ),
                        child: Card(
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(image),fit: BoxFit.cover,height: 200,width: 200,),
                              Padding(padding: EdgeInsets.only(right: 20)),
                              Flexible(child:
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(padding: EdgeInsets.only(top: 20)),
                                  Text(name,style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis,),
                                  Text('Rm '+price,style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis,),
                                ],
                              ),),
                              Padding(padding: EdgeInsets.only(top: 20)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,size: 40,))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        )
    );
  }
}