import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'search.dart';
import 'cart.dart';
import 'food.dart';
import 'services.dart';
import 'vehicles.dart';
import 'others.dart';
import 'profile.dart';
import 'sell.dart';
import 'foodDetail.dart';
import 'food_model.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: homeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('UPMarket'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return cart();
                  }));
                },
                icon: Icon(Icons.shopping_cart))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex : _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.sell),
                label: 'sell',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'profile',
                backgroundColor: Colors.blue),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const sells()),
                );
            }
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const profiles()),
              );
            }
          },
        ),

        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(' '),
                Text(
                  '  Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('       '),
                    IconButton(
                        iconSize: 70,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return food();
                          }));
                        },
                        icon: Icon(
                          Icons.fastfood_outlined,
                          size: 70,
                        ),
                        padding: EdgeInsets.only(left: 10, top: 15)),
                    IconButton(
                        iconSize: 70,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return services();
                          }));
                        },
                        icon: Icon(
                          Icons.miscellaneous_services,
                          size: 70,
                        ),
                        padding: EdgeInsets.only(left: 20, top: 15)),
                    IconButton(
                        iconSize: 70,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return vehicle();
                          }));
                        },
                        icon: Icon(
                          Icons.car_rental_outlined,
                          size: 70,
                        ),
                        padding: EdgeInsets.only(left: 20, top: 15)),
                    IconButton(
                        iconSize: 70,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return others();
                          }));
                        },
                        icon: Icon(
                          Icons.add,
                          size: 70,
                        ),
                        padding: EdgeInsets.only(left: 10, top: 15)),
                  ],
                ),
                Text(''),
                Row(
                  children: [
                    Text('            '),
                    Text('Food',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text('        '),
                    Text('Services',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text('     '),
                    Text('Vehicles',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    Text('     '),
                    Text('Others',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20))
                  ],
                ),
                Text(' '),
                Text('___________________________________________________________'),
                Text(' '),
                Text(
                  '  Featured Item',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                Text(' '),
                Container(
                  width: 400,
                  height: 400,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: foodProduct.foodproducts.length,
                      itemBuilder: (context, index) {
                        String name = '${foodProduct.foodproducts[index].name}';
                        String image =
                            '${foodProduct.foodproducts[index].image}';
                        String price =
                            '${foodProduct.foodproducts[index].price.toStringAsFixed(2)}';
                        String desc = '${foodProduct.foodproducts[index].desc}';
                        return Column(children: [
                          InkWell(
                            onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                              return foodDetail(
                                  title: name,
                                  image: image,
                                  price: price,
                                  desc: desc);
                            })),
                            child: Card(
                              elevation: 100,
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage(image),
                                    fit: BoxFit.cover,
                                    height: 255,
                                    width: 250,
                                  ),
                                  Text(' '), //spacing
                                  Text(
                                    name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ), //name
                                  Text(' '), //spacing
                                  Text(
                                    price,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text('Add to cart',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)))
                                ],
                              ),
                            ),
                          ),
                        ]);
                      }),
                ),
              ]),
        ));
  }
}
