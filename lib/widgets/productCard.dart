import 'package:flutter/material.dart';
import '../models/product.dart';

// ProductCard digunakan untuk menampilkan satu kartu TCG.
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    // Container digunakan sebagai kartu produk.
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        // BoxShadow digunakan untuk memberikan efek bayangan.
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),

      // Stack digunakan untuk menumpuk gambar dan informasi produk.
      child: Stack(
        children: [
          Column(
            children: [
              // Expanded membuat gambar memenuhi area yang tersedia.
              Expanded(
                // ClipRRect membuat sudut gambar mengikuti card.
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),

                  // Image.network digunakan untuk menampilkan gambar kartu.
                  child: Image.network(
                    product.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Padding digunakan untuk memberi jarak informasi produk.
              Padding(
                padding: const EdgeInsets.all(10),

                // Column menampilkan informasi produk secara vertikal.
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

                    // Text menampilkan kategori produk.
                    Text(product.category),

                    const SizedBox(height: 5),

                    // Text menampilkan harga produk.
                    Text(
                      'Rp ${product.price}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    // Text menampilkan jumlah stok.
                    Text('Stok: ${product.stock}'),

                    const SizedBox(height: 5),

                    // ElevatedButton digunakan untuk memasukkan produk.
                    ElevatedButton(
                      // State stock menentukan tombol aktif atau tidak.
                      onPressed:
                      product.stock > 0 ? onAddToCart : null,

                      // Text menampilkan tulisan tombol.
                      child: const Text('Tambah'),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Positioned digunakan untuk menempatkan label kategori.
          Positioned(
            top: 8,
            right: 8,

            // Container digunakan sebagai label.
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),

              // BoxDecoration mengatur tampilan label.
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),

              // Text menampilkan kategori.
              child: Text(
                product.category,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}