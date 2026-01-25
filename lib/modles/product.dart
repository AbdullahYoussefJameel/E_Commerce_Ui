class Product {
  final String name;
  final String category;
  final double price;
  final double oldprice;
  final String imageUrl;
  final bool isFavorite;
  final String description;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.oldprice,
    required this.imageUrl,
    this.isFavorite = false,
    required this.description,
  });
}

final List<Product> products = [
  Product(
    name: "Shoes",
    category: "Footware",
    price: 69.00,
    oldprice: 189,
    imageUrl: 'assets/images/shoe.jpg',
    description: "this is a description of the product 1 ",
  ),
  Product(
    name: "Laptop",
    category: "Electronics",
    price: 69.00,
    oldprice: 189,
    imageUrl: 'assets/images/laptop.jpg',
    description: "this is a description of the product 2",
  ),
  Product(
    name: "Jordan Shoes",
    category: "Footware",
    price: 69.00,
    oldprice: 189,
    imageUrl: 'assets/images/shoe2.jpg',
    description: "this is a description of the product 3",
  ),
  Product(
    name: "Puma",
    category: "Footware",
    price: 69.00,
    oldprice: 189,
    imageUrl: 'assets/images/shoes2.jpg',
    description: "this is a description of the product 4 ",
  ),
];
