class Product {
  final int id;
  final int categoryId;
  final String name;
  final bool isStock;
  final int price;
  final String description;
  final String size;
  final String photoUrl;
  final int oldPrice;

  Product(
      {required this.oldPrice,
      required this.photoUrl,
      required this.id,
      required this.categoryId,
      required this.name,
      required this.isStock,
      required this.price,
      required this.description,
      required this.size});
}
