import 'package:flutter/material.dart';

// Widget CollectionBanner digunakan untuk menampilkan
// banner koleksi kartu TCG.
class CollectionBanner extends StatelessWidget {
  const CollectionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget Container digunakan sebagai wadah
    // banner koleksi.
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(18),
      ),

      // Widget Row digunakan untuk menyusun
      // teks dan icon secara horizontal.
      child: Row(
        children: [

          // Widget Expanded digunakan agar bagian teks
          // mengambil ruang yang tersedia.
          const Expanded(

            // Widget Column digunakan untuk menyusun
            // judul dan deskripsi banner secara vertikal.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Widget Text digunakan untuk menampilkan
                // judul banner.
                Text(
                  'TCG Collection',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Widget SizedBox digunakan untuk memberikan
                // jarak antara judul dan deskripsi.
                SizedBox(height: 8),

                // Widget Text digunakan untuk menampilkan
                // deskripsi banner.
                Text(
                  'Complete your collection with rare cards.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          // Widget Icon digunakan untuk memberikan
          // visual berupa icon koleksi kartu.
          const Icon(
            Icons.collections_bookmark,
            size: 55,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}