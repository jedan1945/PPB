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

// Import halaman Cart dari folder pages
import 'pages/cartPage.dart';

void main() {
  // Menjalankan aplikasi Flutter.
  runApp(const TCGCardShopApp());
}

// Widget MaterialApp digunakan sebagai struktur utama aplikasi.
class TCGCardShopApp extends StatelessWidget {
  const TCGCardShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Menghilangkan banner DEBUG pada pojok kanan atas.
      debugShowCheckedModeBanner: false,

      // Memberikan nama aplikasi.
      title: 'TCG Card Shop',

      // Menampilkan halaman HomePage sebagai halaman pertama.
      home: const HomePage(),
    );
  }
}

// Widget HomePage digunakan sebagai halaman utama aplikasi.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// State digunakan karena BottomNavigationBar akan berubah
// ketika pengguna memilih menu yang berbeda.
class _HomePageState extends State<HomePage> {
  // Menyimpan index halaman navigation yang sedang dipilih.
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Widget SafeArea digunakan agar konten tidak tertutup
      // oleh status bar perangkat.
      body: SafeArea(
        // Widget SingleChildScrollView digunakan agar halaman
        // dapat digulir ke bawah.
        child: SingleChildScrollView(
          // Widget Padding digunakan untuk memberikan jarak
          // antara isi halaman dan tepi layar.
          child: Padding(
            padding: const EdgeInsets.all(20),

            // Widget Column digunakan untuk menyusun
            // isi homepage secara vertikal.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Widget Header digunakan untuk menampilkan
                // nama toko dan icon pada bagian atas.
                const Header(),

                // Widget SizedBox digunakan untuk memberikan
                // jarak setelah Header.
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
                // deskripsi singkat.
                const Text(
                  'Find your favorite trading cards here.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),

                // Widget SizedBox digunakan untuk memberikan
                // jarak sebelum search bar.
                const SizedBox(height: 20),

                // Widget SearchBar digunakan sebagai
                // kolom pencarian kartu.
                const SearchBarWidget(),

                // Widget SizedBox digunakan untuk memberikan
                // jarak menuju kategori.
                const SizedBox(height: 30),

                // Widget Text digunakan sebagai judul kategori.
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
                // beberapa kategori secara horizontal.
                Row(
                  children: [

                    // Widget Expanded digunakan agar
                    // kategori memiliki ukuran yang seimbang.
                    Expanded(
                      child: CategoryCard(
                        icon: Icons.catching_pokemon,
                        title: 'Pokémon',
                        iconColor: Colors.red,
                        backgroundColor: const Color(0xFFFFEBEE),
                      ),
                    ),

                    // Widget SizedBox digunakan untuk
                    // memberikan jarak antar kategori.
                    const SizedBox(width: 10),

                    // Widget Expanded digunakan untuk
                    // kategori kedua.
                    Expanded(
                      child: CategoryCard(
                        icon: Icons.auto_awesome,
                        title: 'Yu-Gi-Oh!',
                        iconColor: Colors.blue,
                        backgroundColor: const Color(0xFFE3F2FD),
                      ),
                    ),

                    // Widget SizedBox digunakan untuk
                    // memberikan jarak antar kategori.
                    const SizedBox(width: 10),

                    // Widget Expanded digunakan untuk
                    // kategori ketiga.
                    Expanded(
                      child: CategoryCard(
                        icon: Icons.star,
                        title: 'One Piece',
                        iconColor: Colors.orange,
                        backgroundColor: const Color(0xFFFFF3E0),
                      ),
                    ),
                  ],
                ),

                // Widget SizedBox digunakan untuk memberikan
                // jarak menuju featured cards.
                const SizedBox(height: 30),

                // Widget Row digunakan untuk menyusun
                // judul Featured Cards dan See All.
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
                // jarak sebelum kartu produk.
                const SizedBox(height: 15),

                // Widget Row digunakan untuk menampilkan
                // dua kartu produk secara horizontal.
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Widget Expanded digunakan untuk
                    // memberikan ruang kepada ProductCard.
                    Expanded(
                      child: ProductCard(
                        cardName: 'Charizard',
                        price: 'Rp 250.000',
                        cardColor: const Color(0xFFFFCDD2),
                        iconColor: Colors.red,

                        // Ketika kartu ditekan, Navigator.push
                        // digunakan untuk membuka halaman Cart.
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartPage(),
                            ),
                          );
                        },
                      ),
                    ),

                    // Widget SizedBox digunakan untuk
                    // memberikan jarak antar produk.
                    const SizedBox(width: 12),

                    // Widget Expanded digunakan untuk
                    // produk kedua.
                    Expanded(
                      child: ProductCard(
                        cardName: 'Blue-Eyes',
                        price: 'Rp 180.000',
                        cardColor: const Color(0xFFBBDEFB),
                        iconColor: Colors.blue,

                        // Navigator.push digunakan untuk
                        // membuka halaman Cart dari produk kedua.
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CartPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                // Widget SizedBox digunakan untuk memberikan
                // jarak menuju collection banner.
                const SizedBox(height: 30),

                // Widget Text digunakan sebagai judul koleksi.
                const Text(
                  'Popular Collection',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Widget SizedBox digunakan untuk memberikan
                // jarak sebelum banner.
                const SizedBox(height: 15),

                // Widget CollectionBanner digunakan untuk
                // menampilkan informasi koleksi.
                const CollectionBanner(),

                // Widget SizedBox digunakan untuk memberikan
                // ruang kosong di bagian bawah.
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),

      // Widget BottomNavigationBar digunakan sebagai
      // navigasi utama antara Home dan Cart.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        // Callback dijalankan ketika menu navigation ditekan.
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          // Jika menu Cart dipilih, Navigator.push
          // digunakan untuk membuka halaman Cart.
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ),
            );
          }
        },

        items: const [

          // BottomNavigationBarItem digunakan untuk
          // membuat menu Home.
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),

          // BottomNavigationBarItem digunakan untuk
          // membuat menu Cart.
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}