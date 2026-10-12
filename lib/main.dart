import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/cartPage.dart';
import 'providers/cart_provider.dart';
import 'widgets/categoryCard.dart';
import 'widgets/collectionBanner.dart';
import 'widgets/header.dart';
import 'widgets/productCard.dart';
import 'widgets/searchBar.dart';

void main() {
  // MultiProvider menyediakan state untuk seluruh widget turunan aplikasi.
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider membuat CartProvider tersedia di semua halaman.
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const TCGCardShopApp(),
    ),
  );
}

// TCGCardShopApp merupakan root widget aplikasi.
class TCGCardShopApp extends StatelessWidget {
  const TCGCardShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp mengatur navigasi, tema, dan halaman awal.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TCG Card Shop',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

// HomePage tetap StatefulWidget karena pencarian dan tab merupakan state lokal.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // searchQuery menyimpan kata pencarian yang diketik pengguna.
  String searchQuery = '';

  // Membuka CartPage; isi keranjang dibaca langsung dari Provider.
  Future<void> openCart() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CartPage()),
    );
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold menyediakan struktur utama halaman Home.
    return Scaffold(
      // AppBar menampilkan judul aplikasi dan jumlah barang dalam keranjang.
      appBar: AppBar(
        title: const Text('TCG Card Shop'),
        centerTitle: true,
        actions: [
          // Consumer memperbarui angka keranjang saat state Provider berubah.
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(
                  child: Text(
                    'Cart: ${cartProvider.totalItems}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // SingleChildScrollView membuat isi Home dapat digulir.
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header menampilkan identitas dan slogan toko.
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Header(),
            ),

            // SearchBarWidget menerima input pencarian produk.
            SearchBarWidget(
              onChanged: (value) {
                // setState memperbarui state lokal pencarian.
                setState(() {
                  searchQuery = value.toLowerCase().trim();
                });
              },
            ),

            // Padding dan Align menempatkan judul kategori di sisi kiri.
            const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kategori Kartu',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Row menyusun tiga kategori secara horizontal.
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // CategoryCard menampilkan kategori Pokémon.
                CategoryCard(
                  title: 'Pokemon',
                  icon: Icons.catching_pokemon,
                  iconColor: Colors.red,
                  backgroundColor: Color(0xFFFFE5E5),
                ),
                // CategoryCard menampilkan kategori Yu-Gi-Oh.
                CategoryCard(
                  title: 'Yu-Gi-Oh',
                  icon: Icons.style,
                  iconColor: Colors.blue,
                  backgroundColor: Color(0xFFE5F0FF),
                ),
                // CategoryCard menampilkan kategori One Piece.
                CategoryCard(
                  title: 'One Piece',
                  icon: Icons.auto_awesome,
                  iconColor: Colors.orange,
                  backgroundColor: Color(0xFFFFF0D9),
                ),
              ],
            ),

            // SizedBox memberi jarak antara kategori dan banner.
            const SizedBox(height: 20),

            // CollectionBanner menampilkan promosi koleksi kartu.
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CollectionBanner(),
            ),

            // SizedBox memberi jarak sebelum daftar produk.
            const SizedBox(height: 20),

            // Padding dan Align menampilkan judul daftar produk.
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kartu Pilihan',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Consumer mendengarkan perubahan daftar produk/stok dari Provider.
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                final visibleProducts = cartProvider.products.where((product) {
                  return product.name.toLowerCase().contains(searchQuery);
                }).toList();

                // Jika pencarian tidak menemukan produk, tampilkan pesan.
                if (visibleProducts.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(24),
                    child: Text('Produk tidak ditemukan.'),
                  );
                }

                // GridView menampilkan produk dalam dua kolom.
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(12),
                  itemCount: visibleProducts.length,
                  // SliverGridDelegate mengatur jumlah dan jarak kolom.
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.70,
                  ),
                  itemBuilder: (context, index) {
                    final product = visibleProducts[index];

                    // ProductCard menampilkan produk dan tombol tambah.
                    return ProductCard(product: product);
                  },
                );
              },
            ),
            // SizedBox memberi ruang di bawah daftar produk.
            const SizedBox(height: 20),
          ],
        ),
      ),

      // BottomNavigationBar menyediakan navigasi Home dan Cart.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          // Index 0 kembali ke Home; index 1 membuka halaman keranjang.
          if (index == 1) {
            openCart();
          }
        },
        items: const [
          // BottomNavigationBarItem mewakili menu Home.
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // BottomNavigationBarItem mewakili menu Cart.
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}
