import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../providers/cart_provider.dart';

// CartPage menampilkan dan mengubah isi keranjang melalui Provider.
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur utama halaman Cart.
    return Scaffold(
      // AppBar menampilkan judul dan tombol kembali bawaan.
      appBar: AppBar(title: const Text('Keranjang')),

      // Consumer mendengarkan perubahan jumlah, stok, dan total harga.
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final entries = cartProvider.cartQuantities.entries.toList();

          // Center menampilkan pesan jika keranjang kosong.
          if (entries.isEmpty) {
            return const Center(
              child: Text(
                'Keranjang masih kosong',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          // Column menyusun daftar barang dan total pembayaran.
          return Column(
            children: [
              // Expanded memberikan ruang yang tersisa kepada ListView.
              Expanded(
                // ListView menampilkan tiap jenis produk di keranjang.
                child: ListView.builder(
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    final entry = entries[index];
                    final Product product = entry.key;
                    final int quantity = entry.value;

                    // Card membungkus informasi satu produk.
                    return Card(
                      margin: const EdgeInsets.all(10),
                      // Padding memberi ruang di dalam kartu produk.
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        // Row menyusun gambar, detail, dan tombol hapus.
                        child: Row(
                          children: [
                            // Image.network menampilkan gambar produk.
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                product.image,
                                width: 70,
                                height: 90,
                                fit: BoxFit.cover,
                                // Icon menjadi pengganti jika gambar gagal dimuat.
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 70,
                                    height: 90,
                                    color: Colors.black12,
                                    child: const Icon(Icons.image_not_supported),
                                  );
                                },
                              ),
                            ),
                            // SizedBox memberi jarak antara gambar dan detail.
                            const SizedBox(width: 12),
                            // Expanded memberi ruang kepada detail produk.
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text menampilkan nama produk.
                                  Text(
                                    product.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // Text menampilkan harga satu kartu.
                                  Text('Rp ${product.price}'),
                                  // Text menampilkan subtotal produk.
                                  Text('Subtotal: Rp ${product.price * quantity}'),
                                  // Row menyusun kontrol jumlah secara horizontal.
                                  Row(
                                    children: [
                                      // IconButton mengurangi jumlah barang.
                                      IconButton(
                                        tooltip: 'Kurangi jumlah',
                                        onPressed: () {
                                          // read memanggil Provider tanpa subscribe.
                                          context
                                              .read<CartProvider>()
                                              .updateQuantity(
                                                product,
                                                quantity - 1,
                                              );
                                        },
                                        icon: const Icon(Icons.remove_circle_outline),
                                      ),
                                      // Text menampilkan jumlah saat ini.
                                      Text(
                                        '$quantity',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // IconButton menambah jumlah jika stok tersedia.
                                      IconButton(
                                        tooltip: 'Tambah jumlah',
                                        onPressed: product.stock > 0
                                            ? () {
                                                context
                                                    .read<CartProvider>()
                                                    .updateQuantity(
                                                      product,
                                                      quantity + 1,
                                                    );
                                              }
                                            : null,
                                        icon: const Icon(Icons.add_circle_outline),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // IconButton menghapus seluruh produk dari keranjang.
                            IconButton(
                              tooltip: 'Hapus produk',
                              onPressed: () {
                                context
                                    .read<CartProvider>()
                                    .removeFromCart(product);
                              },
                              icon: const Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Container menjadi area ringkasan pembayaran.
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                // Column menyusun total dan tombol checkout.
                child: Column(
                  children: [
                    // Text menampilkan total jumlah barang.
                    Text('Jumlah barang: ${cartProvider.totalItems}'),
                    // Text menampilkan total harga semua barang.
                    Text(
                      'Grand Total: Rp ${cartProvider.grandTotal}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // SizedBox memberi jarak sebelum tombol checkout.
                    const SizedBox(height: 10),
                    // ElevatedButton menjalankan simulasi checkout.
                    ElevatedButton(
                      // Tombol aktif jika keranjang tidak kosong.
                      onPressed: cartProvider.totalItems > 0
                          ? () {
                              // SnackBar menampilkan pesan setelah checkout.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Checkout berhasil!'),
                                ),
                              );
                            }
                          : null,
                      // Text menjadi label tombol.
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
