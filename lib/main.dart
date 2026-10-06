import 'package:flutter/material.dart';

import 'models/product.dart';
import 'pages/cartPage.dart';
import 'widgets/header.dart';
import 'widgets/searchBar.dart';
import 'widgets/categoryCard.dart';
import 'widgets/productCard.dart';
import 'widgets/collectionBanner.dart';

void main() {
  runApp(const TCGCardShopApp());
}

// Widget utama aplikasi TCG Card Shop.
class TCGCardShopApp extends StatelessWidget {
  const TCGCardShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp digunakan sebagai root aplikasi Flutter.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TCG Card Shop',

      // ThemeData digunakan untuk mengatur tema aplikasi.
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),

      // HomePage menjadi halaman pertama aplikasi.
      home: const HomePage(),
    );
  }
}

// StatefulWidget digunakan karena data produk dan keranjang dapat berubah.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// State utama HomePage.
class _HomePageState extends State<HomePage> {
  // Menyimpan kata pencarian dari TextField.
  String searchQuery = '';

  // Menyimpan index navigation bar.
  int selectedIndex = 0;

  // Daftar produk TCG.
  final List<Product> products = [
    Product(
      name: 'Charizard EX',
      category: 'Pokemon',
      price: 250000,
      stock: 5,
      image: 'https://images.unsplash.com/photo-1606220945770-b5b6c2c55bf1',
    ),
    Product(
      name: 'Blue-Eyes White Dragon',
      category: 'Yu-Gi-Oh',
      price: 300000,
      stock: 4,
      image: 'https://images.unsplash.com/photo-1613771404721-1f92d799e49f',
    ),
    Product(
      name: 'Luffy Gear 5',
      category: 'One Piece',
      price: 275000,
      stock: 6,
      image: 'https://images.unsplash.com/photo-1608889825103-eb5ed706fc64',
    ),
  ];

  // Menyimpan produk yang sudah dimasukkan ke keranjang.
  final List<Product> cart = [];

  // Fungsi untuk menambahkan produk ke keranjang.
  void addToCart(Product product) {
    setState(() {
      // Mengurangi stok produk.
      product.stock--;

      // Menambahkan produk ke keranjang.
      cart.add(product);
    });

    // Menampilkan notifikasi bahwa produk berhasil ditambahkan.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} masuk ke keranjang!'),
      ),
    );
  }

  // Fungsi untuk mencari produk berdasarkan input pengguna.
  List<Product> get visibleProducts {
    return products.where((product) {
      return product.name.toLowerCase().contains(searchQuery);
    }).toList();
  }

  // Fungsi untuk membuka halaman Cart.
  void openCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(
          cart: cart,
          onRemove: removeFromCart,
          onQuantityChanged: changeQuantity,
        ),
      ),
    );
  }

  // Fungsi menghapus produk dari keranjang.
  void removeFromCart(Product product) {
    setState(() {
      cart.remove(product);
      product.stock++;
    });
  }

  // Fungsi mengubah jumlah produk dalam keranjang.
  void changeQuantity(Product product, int newQuantity) {
    setState(() {
      // Menghitung jumlah produk lama.
      int currentQuantity =
          cart.where((item) => item == product).length;

      // Menambah jumlah produk.
      if (newQuantity > currentQuantity) {
        int difference = newQuantity - currentQuantity;

        for (int i = 0; i < difference; i++) {
          if (product.stock > 0) {
            product.stock--;
            cart.add(product);
          }
        }
      }

      // Mengurangi jumlah produk.
      if (newQuantity < currentQuantity) {
        int difference = currentQuantity - newQuantity;

        for (int i = 0; i < difference; i++) {
          cart.remove(product);
          product.stock++;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold menjadi struktur utama halaman Home.
    return Scaffold(
      // AppBar digunakan sebagai bagian atas halaman.
      appBar: AppBar(
        title: const Text('TCG Card Shop'),
        centerTitle: true,
      ),

      // Body menampilkan isi utama aplikasi.
      body: selectedIndex == 0
          ? SingleChildScrollView(
        child: Column(
          children: [
            // Header aplikasi.
            const Header(),

            // SearchBar digunakan untuk mencari kartu.
            SearchBarWidget(
              onChanged: (value) {
                // setState memperbarui tampilan ketika user mengetik.
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),

            // Judul kategori.
            const Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kategori Kartu',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Category cards.
            // Row digunakan untuk menampilkan kategori secara horizontal.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                // CategoryCard untuk kategori Pokemon.
                CategoryCard(
                  title: 'Pokemon',
                  icon: Icons.catching_pokemon,
                  iconColor: Colors.red,
                  backgroundColor: Color(0xFFFFE5E5),
                ),

                // CategoryCard untuk kategori Yu-Gi-Oh.
                CategoryCard(
                  title: 'Yu-Gi-Oh',
                  icon: Icons.style,
                  iconColor: Colors.blue,
                  backgroundColor: Color(0xFFE5F0FF),
                ),

                // CategoryCard untuk kategori One Piece.
                CategoryCard(
                  title: 'One Piece',
                  icon: Icons.auto_awesome,
                  iconColor: Colors.orange,
                  backgroundColor: Color(0xFFFFF0D9),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Banner koleksi.
            const CollectionBanner(),

            const SizedBox(height: 20),

            // Judul produk.
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Kartu Pilihan',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // GridView digunakan untuk menampilkan produk.
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              itemCount: visibleProducts.length,

              // GridDelegate mengatur jumlah kolom.
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.70,
              ),

              itemBuilder: (context, index) {
                final product = visibleProducts[index];

                // ProductCard menampilkan informasi kartu.
                return ProductCard(
                  product: product,

                  // Tombol tambah kartu menjalankan addToCart.
                  onAddToCart: () {
                    addToCart(product);
                  },
                );
              },
            ),
          ],
        ),
      )
          : Center(
        // Halaman alternatif ketika tab bukan Home.
        child: ElevatedButton(
          // Tombol membuka Cart dengan Navigator.
          onPressed: openCart,
          child: const Text('Buka Keranjang'),
        ),
      ),

      // BottomNavigationBar digunakan untuk berpindah menu.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        // State navigation berubah ketika menu ditekan.
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          // Jika user memilih Cart, buka CartPage.
          if (index == 1) {
            openCart();
          }
        },

        items: const [
          // Menu Home.
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          // Menu Cart.
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }
}