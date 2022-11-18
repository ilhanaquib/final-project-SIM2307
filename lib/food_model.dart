import 'package:app_two/food.dart';
import 'toSell.dart';

class foodProduct {
  final String name;
  final double price;
  final String image;
  final String desc;

  foodProduct ({required this.name, required this.price, required this.image, required this.desc});

  static List<foodProduct> foodproducts = [
    foodProduct(
        name: 'nasi kerabu',
        price: 6.00,
        image: 'assets/image/nasi kerabu.jpg',
        desc: 'Nasi Kerabu paling sedap dalam dunia'),


    foodProduct(
            name: 'nasi kakwok',
            price: 6.00,
            image: 'assets/image/nasi kakwok.jpg',
            desc: 'Nasi Kakwok lagi sedap dari nasi kerabu'),

    foodProduct(
        name: 'burger',
        price: 4.00,
        image: 'assets/image/burger ramly.jpg',
        desc: 'Sorry roti john dah sold out'),

    foodProduct(
        name: 'keropok lekor',
        price: 3.00,
        image: 'assets/image/keropok lekor.jpg',
        desc: 'Ustaz Azhar Idrus pun makan ni'),

    foodProduct(
        name: 'burger',
        price: 3.00,
        image: 'assets/image/burger ramly.jpg',
        desc: 'ai burger lagi, berapa banyak burger dah ni'),
  ];
}



