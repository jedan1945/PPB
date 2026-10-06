// Model Product digunakan untuk menyimpan data kartu TCG.
class Product {
  String name;
  String category;
  int price;
  int stock;
  String image;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.stock,
    required this.image,
  });
}