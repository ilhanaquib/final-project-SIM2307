import 'package:flutter/material.dart';
import 'service_model.dart';
import 'serviceDetail.dart';
import 'cart.dart';

class services extends StatefulWidget {
  const services({Key? key}) : super(key: key);

  @override
  State<services> createState() => _servicesState();
}

class _servicesState extends State<services> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Services'),
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
          itemCount: serviceProduct.serviceproducts.length,
          itemBuilder: (context, index){
            String name = '${serviceProduct.serviceproducts[index].name}';
            String image = '${serviceProduct.serviceproducts[index].image}';
            String price = '${serviceProduct.serviceproducts[index].price.toStringAsFixed(2)}';
            String desc = '${serviceProduct.serviceproducts[index].desc}';
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 410,
                      child: InkWell(onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return serviceDetail(title: name, image: image, price: price, desc: desc);
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
                                  Text(name,style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis,),
                                  Text('Rm '+price,style: TextStyle(fontSize: 20),overflow: TextOverflow.ellipsis,),
                                ],
                              ),
                              Padding(padding: EdgeInsets.only(top: 20)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,size: 40,),),
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