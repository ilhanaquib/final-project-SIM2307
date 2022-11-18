import 'package:app_two/main.dart';
import 'package:app_two/sell.dart';
import 'package:flutter/material.dart';
import 'logIn.dart';

class profiles extends StatefulWidget {
  const profiles({Key? key}) : super(key: key);

  @override
  State<profiles> createState() => _profilesState();
}

class _profilesState extends State<profiles> {
  int home = 0;
  int sell = 1;
  int profile = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Profile'),
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return logIn();
              }));
            }, icon: Text("Log In",)
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: [
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
            currentIndex: profile,
            onTap: (int index) {
              setState(() {
                home = index;
                sell = index;
                profile = index;
              });
              if (index == 0) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return homeScreen();
                }));
              }
              if (index == 1) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return sells();
                }));
              }
            }),
        body: Column(
        children: [
          Text('                      '),
          Row(children: [
            Padding(padding: EdgeInsets.only(left: 20),),
            CircleAvatar(backgroundImage: AssetImage('assets/image/no profile.jpg'),radius: 70,),
            Text('       Demo''\n''\n  Block D, Room 999',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
          ],),
          Padding(padding: EdgeInsets.only(left:100)),
          Padding(padding: EdgeInsets.all(20)),
          Text('___________________________________________________________'),
          Text('Orders',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
          Text(' '),
          Row(children: [
            Padding(padding: EdgeInsets.only(left:10)),
            Icon(Icons.payments_outlined,size: 70,),
            Padding(padding: EdgeInsets.only(left:94)),
            Icon(Icons.back_hand_rounded,size: 70),
            Padding(padding: EdgeInsets.only(left:74)),
            Icon(Icons.local_shipping_outlined,size: 70),
          ],),
          Padding(padding: EdgeInsets.all(5)),
          Row(children: [
            Padding(padding: EdgeInsets.only(left: 30)),
            Text('To pay',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(left: 125)),
            Text('Preparing',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold)),
            Padding(padding: EdgeInsets.only(left: 100)),
            Text('Send',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold))
          ],),
          Padding(padding: EdgeInsets.all(20)),
          Text('___________________________________________________________'),
          Text('Listings',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
          Row(
            children: [
              Container(
                height: 250,
                width: 400,
                child:
                  ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 60,bottom: 40)),
                            Text('You have not posted any listings yet',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            Padding(padding: EdgeInsets.all(60))
                          ],
                        )
                      )
                    ],
                  )
              )
            ],
          )

        ],
    ),
    );
  }
}
