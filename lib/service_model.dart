class serviceProduct {
  final String name;
  final double price;
  final String image;
  final String desc;

  serviceProduct ({required this.name, required this.price, required this.image, required this.desc});

  static List<serviceProduct> serviceproducts = [
    serviceProduct(
        name: 'Print',
        price: 0.10,
        image: 'assets/image/printer.jpg',
        desc: 'Sehelai 10 sen / warna Rm1'),
  ];
}



