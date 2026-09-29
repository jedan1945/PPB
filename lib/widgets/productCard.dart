import 'package:flutter/material.dart';

// Widget ProductCard digunakan untuk menampilkan
// produk kartu TCG pada halaman Home.
class ProductCard extends StatelessWidget {
  final String cardName;
  final String price;
  final Color cardColor;
  final Color iconColor;

  // Callback digunakan untuk menjalankan aksi
  // ketika ProductCard ditekan.
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.cardName,
    required this.price,
    required this.cardColor,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // GestureDetector digunakan untuk mendeteksi
      // sentuhan pengguna pada ProductCard.
      onTap: onTap,

      // Widget Container digunakan sebagai wadah
      // seluruh produk kartu.
      child: Container(
        padding: const EdgeInsets.all(15),

        decoration: BoxDecoration(
          color: Colors.white,

          // BoxShadow digunakan untuk memberikan
          // efek bayangan pada ProductCard.
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],

          borderRadius: BorderRadius.circular(18),
        ),

        // Widget Column digunakan untuk menyusun
        // gambar, nama, harga, dan jumlah produk.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Widget Stack digunakan untuk menumpuk
            // gambar kartu dan label "RARE".
            SizedBox(
              height: 150,

              // Widget Stack digunakan untuk menumpuk
              // beberapa widget pada area yang sama.
              child: Stack(
                children: [

                  // Widget Container digunakan sebagai
                  // background area kartu.
                  Container(
                    width: double.infinity,
                    height: 150,

                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),

                    // Widget Image digunakan untuk menampilkan
                    // gambar kartu dari internet.
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        cardName == 'Charizard'
                            ? 'https://images.unsplash.com/photo-1613771404784-3a5686aa2be3?w=500'
                            : 'https://images.unsplash.com/photo-1606503153255-59d8b8b8f3f7?w=500',
                        fit: BoxFit.cover,

                        // Jika gambar gagal dimuat,
                        // Icon akan ditampilkan sebagai pengganti.
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(
                              Icons.style,
                              size: 70,
                              color: iconColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Widget Positioned digunakan untuk menempatkan
                  // label RARE pada bagian atas kartu.
                  Positioned(
                    top: 8,
                    right: 8,

                    // Widget Container digunakan sebagai
                    // background label RARE.
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(8),
                      ),

                      // Widget Text digunakan untuk
                      // menampilkan label RARE.
                      child: const Text(
                        'RARE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Widget SizedBox digunakan untuk memberikan
            // jarak antara gambar dan nama kartu.
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

            // Widget SizedBox digunakan untuk memberikan
            // jarak sebelum input jumlah.
            const SizedBox(height: 10),

            // Widget TextField digunakan untuk menerima
            // input jumlah kartu.
            TextField(
              keyboardType: TextInputType.number,

              decoration: InputDecoration(
                hintText: 'Jumlah',
                prefixIcon: const Icon(Icons.numbers),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}