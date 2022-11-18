import 'package:flutter/material.dart';

class serviceDetail extends StatefulWidget {
  const serviceDetail({Key? key, required this.title,required this.price,required this.desc,required this.image}) : super(key: key);
  final String title;
  final String price;
  final String image;
  final String desc;
  @override
  State<serviceDetail> createState() => _serviceDetailState();
}

class _serviceDetailState extends State<serviceDetail> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index){
          return Scaffold(
            appBar: AppBar(
              title: Text('${widget.title}'),
            ),
            body: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Column(
                  children: [
                    Image(image: AssetImage('${widget.image}'),fit: BoxFit.cover, height: 450,width: 410,),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text('${widget.title}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text('Rm ''${widget.price}',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text('___________________________________________________________'),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text('${widget.desc}',style: TextStyle(fontSize: 20),)
                  ],
                );
              },
            ),
              bottomNavigationBar: BottomAppBar(
                  color: Colors.red,
                child: IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart_outlined,size: 40,color: Colors.white,)),
              )
          );
        }
    );
  }
}
