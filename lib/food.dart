import 'package:app_two/cartController.dart';
import 'package:app_two/foodDetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart ';
import 'food_model.dart';
import 'cart.dart';
import 'package:flutter_cart/flutter_cart.dart';

class food extends StatefulWidget {
  const food({Key? key}) : super(key: key);

  @override
  State<food> createState() => _foodState();
}

class _foodState extends State<food> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Food'),
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
          itemCount: foodProduct.foodproducts.length,
          itemBuilder: (context, index){
            final cartController = Get.put(CartController());
            String name = '${foodProduct.foodproducts[index].name}';
            String image = '${foodProduct.foodproducts[index].image}';
            String price = '${foodProduct.foodproducts[index].price.toStringAsFixed(2)}';
            String desc = '${foodProduct.foodproducts[index].desc}';
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 410,
                      child: InkWell(onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return foodDetail(title: name, image: image, price: price, desc: desc);
                })
                    ),
                      child: Card(
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(image),fit: BoxFit.cover,height: 200,width: 200,),
                            Padding(padding: EdgeInsets.only(right: 20)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(padding: EdgeInsets.only(top: 20)),
                                Text(name,style: TextStyle(fontSize: 20),),
                                Text('Rm '+price,style: TextStyle(fontSize: 20),),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 20)),
                            IconButton(onPressed: (){
                              cartController.addProduct(foodProduct.foodproducts[index]);
                            }, icon: Icon(Icons.add_circle,size: 40,),),
                          ],
                        ),
                      ),
                    ),
                    )
                  ],
                ),
              ],
            );
          },
            )
    );
  }
}
