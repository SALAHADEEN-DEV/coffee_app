import 'package:coffee_app_new/gen/assets.gen.dart';

class CoffeeProduct {
  final int id;
  final String name;
  final String description;
  final String price;
  final double rating;
  final String imageUrl;

  const CoffeeProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.imageUrl,
  });

  static List<CoffeeProduct> getSampleProducts() {
    return [
      CoffeeProduct(
        id: 1,
        name: "Caffe Mocha",
        description: "Deep Foam",
        price: "\$ 4.53",
        rating: 4.8,
        imageUrl: Assets.images.imagePage24.path,
      ),
      CoffeeProduct(
        id: 2,
        name: "Flat White",
        description: "Espresso",
        price: "\$ 3.53",
        rating: 4.8,
        imageUrl: Assets.images.imagePage25.path,
      ),
      CoffeeProduct(
        id: 3,
        name: "Mocha Fusi",
        description: "Ice/Hot",
        price: "\$ 7.53",
        rating: 4.8,
        imageUrl: Assets.images.imagePage22.path,
      ),
      CoffeeProduct(
        id: 4,
        name: "Caffe Panna",
        description: "Ice/Hot",
        price: "\$ 5.53",
        rating: 4.8,
        imageUrl: Assets.images.imagePage41.path,
      ),
    ];
  }
}
