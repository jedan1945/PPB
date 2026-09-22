import 'package:flutter/material.dart';

// Widget Header digunakan untuk menampilkan
// bagian atas homepage TCG Card Shop.
class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget Row digunakan untuk menyusun
    // nama toko dan icon secara horizontal.
    return Row(
      children: [

        // Widget Expanded digunakan agar bagian nama toko
        // mengambil ruang yang tersedia.
        const Expanded(
          // Widget Column digunakan untuk menyusun
          // nama toko dan slogan secara vertikal.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Widget Text digunakan untuk menampilkan
              // nama aplikasi.
              Text(
                'TCG CARD SHOP',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),

              // Widget SizedBox digunakan untuk memberikan
              // jarak antara nama toko dan slogan.
              SizedBox(height: 4),

              // Widget Text digunakan untuk menampilkan
              // slogan aplikasi.
              Text(
                'Collect. Trade. Battle.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),

        // Widget Icon digunakan untuk menampilkan
        // icon notifikasi.
        const Icon(
          Icons.notifications_none,
          size: 28,
        ),

        // Widget SizedBox digunakan untuk memberikan
        // jarak antara icon notifikasi dan icon cart.
        const SizedBox(width: 16),

        // Widget Icon digunakan untuk menampilkan
        // icon keranjang belanja.
        const Icon(
          Icons.shopping_cart_outlined,
          size: 28,
        ),
      ],
    );
  }
}