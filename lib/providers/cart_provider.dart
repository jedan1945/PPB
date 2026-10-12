
import 'package:flutter/material.dart';
import '../models/product.dart';

// CartProvider mengelola state produk dan keranjang yang digunakan
// bersama oleh HomePage, CartPage, dan widget lainnya.
class CartProvider extends ChangeNotifier {
  // Daftar produk dipusatkan di Provider agar dapat diakses bersama.
  final List<Product> products = [
    Product(
      name: 'Charizard EX',
      category: 'Pokemon',
      price: 250000,
      stock: 5,
      image:
      'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1',
    ),
    Product(
      name: 'Blue-Eyes White Dragon',
      category: 'Yu-Gi-Oh',
      price: 300000,
      stock: 4,
      image:
      'https://images.unsplash.com/photo-1613771404721-1f92d799e49f',
    ),
    Product(
      name: 'Luffy Gear 5',
      category: 'One Piece',
      price: 275000,
      stock: 6,
      image:
      'https://images.unsplash.com/photo-1608889825103-eb5ed706fc64',
    ),
  ];

  // Map menyimpan produk dan jumlahnya di keranjang.
  // Product menjadi key, sedangkan int menjadi quantity.
  final Map<Product, int> cartQuantities = {};

  // Getter menghitung total semua barang di keranjang.
  int get totalItems {
    return cartQuantities.values.fold(0, (total, quantity) {
      return total + quantity;
    });
  }

  // Getter menghitung total harga berdasarkan quantity setiap produk.
  int get grandTotal {
    return cartQuantities.entries.fold(0, (total, entry) {
      return total + entry.key.price * entry.value;
    });
  }

  // Menambahkan produk dan memperbarui stok.
  void addToCart(Product product) {
    if (product.stock <= 0) return;

    product.stock--;

    cartQuantities[product] =
        (cartQuantities[product] ?? 0) + 1;

    // Memberi tahu widget yang mendengarkan bahwa state berubah.
    notifyListeners();
  }

  // Mengubah jumlah produk dalam keranjang.
  void updateQuantity(Product product, int newQuantity) {
    if (newQuantity < 0) return;

    final oldQuantity = cartQuantities[product] ?? 0;
    final difference = newQuantity - oldQuantity;

    // Tidak boleh menambahkan barang melebihi stok tersedia.
    if (difference > product.stock) return;

    product.stock -= difference;

    if (newQuantity == 0) {
      cartQuantities.remove(product);
    } else {
      cartQuantities[product] = newQuantity;
    }

    // Memperbarui UI setelah state berubah.
    notifyListeners();
  }

  // Menghapus produk beserta seluruh quantity-nya dari keranjang.
  void removeFromCart(Product product) {
    final quantity = cartQuantities.remove(product) ?? 0;

    // Stok dikembalikan sesuai jumlah yang dihapus.
    product.stock += quantity;

    notifyListeners();
  }
}
