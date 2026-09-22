import 'package:flutter/material.dart';

// Widget ProductCard digunakan untuk menampilkan
// informasi kartu TCG yang dijual.
class ProductCard extends StatelessWidget {
  final String cardName;
  final String price;
  final Color cardColor;
  final Color iconColor;

  const ProductCard({
    super.key,
    required this.cardName,
    required this.price,
    required this.cardColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    // Widget Container digunakan sebagai wadah
    // seluruh informasi produk kartu.
    return Container(
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(18),
      ),

      // Widget Column digunakan untuk menyusun
      // gambar, nama, dan harga kartu secara vertikal.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Widget Container digunakan sebagai area
          // untuk menampilkan visual kartu.
          Container(
            height: 150,
            width: double.infinity,

            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(12),
            ),

            // Widget Center digunakan untuk menempatkan
            // icon tepat di tengah area kartu.
            child: Center(

              // Widget Icon digunakan sebagai pengganti
              // gambar kartu TCG.
              child: Icon(
                Icons.style,
                size: 70,
                color: iconColor,
              ),
            ),
          ),

          // Widget SizedBox digunakan untuk memberikan
          // jarak antara visual kartu dan nama kartu.
          const SizedBox(height: 12),

          // Widget Text digunakan untuk menampilkan
          // nama kartu.
          Text(
            cardName,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Widget SizedBox digunakan untuk memberikan
          // jarak antara nama dan harga.
          const SizedBox(height: 5),

          // Widget Text digunakan untuk menampilkan
          // harga kartu.
          Text(
            price,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: iconColor,
            ),
          ),
        ],
      ),
    );
  }
}