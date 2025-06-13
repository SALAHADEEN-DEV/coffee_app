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
      const CoffeeProduct(
        id: 1,
        name: "Caffe Mocha",
        description: "Deep Foam",
        price: "\$ 4.53",
        rating: 4.8,
        imageUrl: "https://images.unsplash.com/photo-1509042239860-f550ce710b93?w=140&h=128&fit=crop&crop=center",
      ),
      const CoffeeProduct(
        id: 2,
        name: "Flat White",
        description: "Espresso",
        price: "\$ 3.53",
        rating: 4.8,
        imageUrl: "https://images.unsplash.com/photo-1534778101976-62847782c213?w=140&h=128&fit=crop&crop=center",
      ),
      const CoffeeProduct(
        id: 3,
        name: "Mocha Fusi",
        description: "Ice/Hot",
        price: "\$ 7.53",
        rating: 4.8,
        imageUrl: "https://images.unsplash.com/photo-1610889556528-9a770e32642f?w=140&h=128&fit=crop&crop=center",
      ),
      const CoffeeProduct(
        id: 4,
        name: "Caffe Panna",
        description: "Ice/Hot",
        price: "\$ 5.53",
        rating: 4.8,
        imageUrl: "https://images.unsplash.com/photo-1461023058943-07fcbe16d735?w=140&h=128&fit=crop&crop=center",
      ),
    ];
  }
}
