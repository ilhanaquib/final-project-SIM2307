
class vehicleProduct {
  final String name;
  final double price;
  final String image;
  final String desc;

  vehicleProduct ({required this.name, required this.price, required this.image, required this.desc});

  static List<vehicleProduct> vehicleproducts = [
    vehicleProduct(
        name: 'Tesla Model X',
        price: 800000,
        image: 'assets/image/tesla model x.jpg',
        desc: 'Kereta dicuri dari Tony Fernandes. Kena tangkap polis saya tak tahu. Nak sewa pm tepi'),


    vehicleProduct(
        name: 'Honda Wave',
        price: 10000,
        image: 'assets/image/honda wave.jpg',
        desc: 'Pernah dipakai oleh Valentino Rossi. Sewa Rm50 sehari'),

    vehicleProduct(
        name: 'Invisible Boatmobile',
        price: 10000000,
        image: 'assets/image/invisible car.jpg',
        desc: 'Sebijik macam dalam spongebob. Tidak boleh disewa dan bukan untuk dijual. Saya nak menunjuk je ni.'),

    vehicleProduct(
        name: 'Basikal lajak',
        price: 500,
        image: 'assets/image/basikal lajak.jpg',
        desc: 'Beli satu free ticket tengok malaikat'),
  ];
}



