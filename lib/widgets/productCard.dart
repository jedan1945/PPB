import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';

// ProductCard menampilkan satu produk dan mengakses state CartProvider.
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // Consumer membuat stok dan status tombol diperbarui ketika Provider berubah.
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        // Container menjadi wadah utama kartu produk.
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            // BoxShadow memberi efek bayangan pada kartu.
            boxShadow: const [
              BoxShadow(blurRadius: 6, offset: Offset(0, 3)),
            ],
          ),
          // Stack menumpuk label kategori di atas isi kartu.
          child: Stack(
            children: [
              // Column menyusun gambar dan informasi produk secara vertikal.
              Column(
                children: [
                  // Expanded membuat gambar mengisi bagian atas kartu.
                  Expanded(
                    // ClipRRect membulatkan sudut gambar.
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      // Image.network memuat gambar produk dari internet.
                      child: Image.network(
                        product.image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        // Placeholder ditampilkan jika gambar gagal dimuat.
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: double.infinity,
                            color: Colors.black12,
                            child: const Icon(
                              Icons.image_not_supported,
                              size: 40,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  // Padding memberi jarak di sekitar informasi produk.
                  Padding(
                    padding: const EdgeInsets.all(10),
                    // Column menyusun nama, kategori, harga, stok, dan tombol.
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text menampilkan nama kartu.
                        Text(
                          product.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // Text menampilkan kategori kartu.
                        Text(product.category),
                        // SizedBox memberi jarak sebelum harga.
                        const SizedBox(height: 5),
                        // Text menampilkan harga kartu.
                        Text(
                          'Rp ${product.price}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        // Text menampilkan stok terkini dari state.
                        Text('Stok: ${product.stock}'),
                        // SizedBox memberi jarak sebelum tombol.
                        const SizedBox(height: 5),
                        // ElevatedButton menambahkan produk ke keranjang Provider.
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            // Tombol nonaktif jika stok sudah habis.
                            onPressed: product.stock > 0
                                ? () {
                                    // read memanggil fungsi tanpa mendengarkan state.
                                    context
                                        .read<CartProvider>()
                                        .addToCart(product);
                                    // SnackBar memberi konfirmasi kepada pengguna.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          '${product.name} masuk ke keranjang!',
                                        ),
                                      ),
                                    );
                                  }
                                : null,
                            // Text menjadi label tombol tambah.
                            child: const Text('Tambah'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Positioned menempatkan label kategori di pojok kanan atas.
              Positioned(
                top: 8,
                right: 8,
                // Container menjadi latar label kategori.
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  // Text menampilkan nama kategori di label.
                  child: Text(
                    product.category,
                    style: const TextStyle(color: Colors.white, fontSize: 11),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
