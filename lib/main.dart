import 'package:flutter/material.dart';

// Import widget Header dari file header.dart
import 'widgets/header.dart';

// Import widget SearchBar dari file searchBar.dart
import 'widgets/searchBar.dart';

// Import widget CategoryCard dari file categoryCard.dart
import 'widgets/categoryCard.dart';

// Import widget ProductCard dari file productCard.dart
import 'widgets/productCard.dart';

// Import widget CollectionBanner dari file collectionBanner.dart
import 'widgets/collectionBanner.dart';

void main() {
  // Menjalankan aplikasi Flutter
  runApp(const TCGCardShopApp());
}

// Widget MaterialApp digunakan sebagai struktur utama aplikasi Flutter.
class TCGCardShopApp extends StatelessWidget {
  const TCGCardShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Menghilangkan tulisan DEBUG pada pojok kanan atas.
      debugShowCheckedModeBanner: false,

      // Memberikan nama pada aplikasi.
      title: 'TCG Card Shop',

      // Widget Scaffold digunakan sebagai struktur dasar halaman aplikasi.
      home: const HomePage(),
    );
  }
}

// Widget StatelessWidget digunakan karena halaman utama
// tidak memiliki data yang berubah secara langsung.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget Scaffold digunakan sebagai struktur dasar homepage.
    return Scaffold(
      // Widget SafeArea digunakan agar isi aplikasi tidak
      // tertutup oleh status bar perangkat.
      body: SafeArea(
        // Widget SingleChildScrollView digunakan agar halaman
        // dapat di-scroll jika isi melebihi ukuran layar.
        child: SingleChildScrollView(
          // Widget Padding digunakan untuk memberikan jarak
          // antara isi halaman dengan tepi layar.
          child: Padding(
            padding: const EdgeInsets.all(20),

            // Widget Column digunakan untuk menyusun
            // seluruh bagian homepage secara vertikal.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                // Widget Header merupakan widget buatan sendiri
                // yang berisi nama toko dan icon notifikasi/cart.
                const Header(),

                // Widget SizedBox digunakan untuk memberikan
                // jarak antara Header dan Welcome Section.
                const SizedBox(height: 30),

                // Widget Text digunakan untuk menampilkan
                // sapaan kepada pengguna.
                const Text(
                  'Welcome, Duelist! 👋',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Widget SizedBox digunakan untuk memberikan
                // jarak antara judul dan deskripsi.
                const SizedBox(height: 6),

                // Widget Text digunakan untuk menampilkan
                // deskripsi singkat aplikasi.
                const Text(
                  'Find your favorite trading cards here.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                // Widget SizedBox digunakan untuk memberikan
                // jarak sebelum SearchBar.
                const SizedBox(height: 20),

                // Widget SearchBar merupakan widget buatan sendiri
                // yang berisi kolom pencarian kartu.
                const SearchBarWidget(),

                // Widget SizedBox digunakan untuk memberikan
                // jarak menuju bagian Categories.
                const SizedBox(height: 30),

                // Widget Text digunakan untuk menampilkan
                // judul Categories.
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Widget SizedBox digunakan untuk memberikan
                // jarak antara judul dan kategori.
                const SizedBox(height: 15),

                // Widget Row digunakan untuk menyusun
                // tiga kategori secara horizontal.
                Row(
                  children: [

                    // Widget Expanded digunakan agar
                    // kategori pertama mendapatkan ruang yang sama.
                    Expanded(
                      child: CategoryCard(
                        icon: Icons.catching_pokemon,
                        title: 'Pokémon',
                        iconColor: Colors.red,
                        backgroundColor: Color(0xFFFFEBEE),
                      ),
                    ),

                    // Widget SizedBox digunakan untuk memberikan
                    // jarak antar kategori.
                    const SizedBox(width: 10),

                    // Widget Expanded digunakan agar
                    // kategori kedua mendapatkan ruang yang sama.
                    Expanded(
                      child: CategoryCard(
                        icon: Icons.auto_awesome,
                        title: 'Yu-Gi-Oh!',
                        iconColor: Colors.blue,
                        backgroundColor: Color(0xFFE3F2FD),
                      ),
                    ),

                    // Widget SizedBox digunakan untuk memberikan
                    // jarak antar kategori.
                    const SizedBox(width: 10),

                    // Widget Expanded digunakan agar
                    // kategori ketiga mendapatkan ruang yang sama.
                    Expanded(
                      child: CategoryCard(
                        icon: Icons.star,
                        title: 'One Piece',
                        iconColor: Colors.orange,
                        backgroundColor: Color(0xFFFFF3E0),
                      ),
                    ),
                  ],
                ),

                // Widget SizedBox digunakan untuk memberikan
                // jarak menuju bagian Featured Cards.
                const SizedBox(height: 30),

                // Widget Row digunakan untuk menyusun
                // judul dan tulisan See All secara horizontal.
                Row(
                  children: [

                    // Widget Expanded digunakan agar judul
                    // mengambil ruang yang tersedia.
                    const Expanded(
                      child: Text(
                        'Featured Cards',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Widget Text digunakan untuk menampilkan
                    // tulisan See All.
                    const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),

                // Widget SizedBox digunakan untuk memberikan
                // jarak antara judul dan produk.
                const SizedBox(height: 15),

                // Widget Row digunakan untuk menyusun
                // dua ProductCard secara horizontal.
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Widget Expanded digunakan agar ProductCard
                    // pertama mendapatkan setengah ruang.
                    const Expanded(
                      child: ProductCard(
                        cardName: 'Charizard',
                        price: 'Rp 250.000',
                        cardColor: Color(0xFFFFCDD2),
                        iconColor: Colors.red,
                      ),
                    ),

                    // Widget SizedBox digunakan untuk memberikan
                    // jarak antara dua ProductCard.
                    SizedBox(width: 12),

                    // Widget Expanded digunakan agar ProductCard
                    // kedua mendapatkan setengah ruang.
                    const Expanded(
                      child: ProductCard(
                        cardName: 'Blue-Eyes',
                        price: 'Rp 180.000',
                        cardColor: Color(0xFFBBDEFB),
                        iconColor: Colors.blue,
                      ),
                    ),
                  ],
                ),

                // Widget SizedBox digunakan untuk memberikan
                // jarak menuju bagian Popular Collection.
                const SizedBox(height: 30),

                // Widget Text digunakan untuk menampilkan
                // judul Popular Collection.
                const Text(
                  'Popular Collection',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Widget SizedBox digunakan untuk memberikan
                // jarak antara judul dan banner.
                const SizedBox(height: 15),

                // Widget CollectionBanner merupakan widget buatan
                // sendiri untuk menampilkan banner koleksi kartu.
                const CollectionBanner(),

                // Widget SizedBox digunakan untuk memberikan
                // ruang kosong di bagian bawah homepage.
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}