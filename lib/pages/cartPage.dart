import 'package:flutter/material.dart';
import '../models/product.dart';

// CartPage digunakan untuk menampilkan produk yang ada di keranjang.
class CartPage extends StatefulWidget {
  final List<Product> cart;
  final Function(Product) onRemove;
  final Function(Product, int) onQuantityChanged;

  const CartPage({
    super.key,
    required this.cart,
    required this.onRemove,
    required this.onQuantityChanged,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

// State CartPage digunakan karena jumlah produk dapat berubah.
class _CartPageState extends State<CartPage> {
  // Controller digunakan untuk mengatur input jumlah produk.
  final Map<Product, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();

    // Membuat controller untuk setiap produk.
    for (final product in widget.cart.toSet()) {
      controllers[product] = TextEditingController(
        text: getQuantity(product).toString(),
      );
    }
  }

  // Menghitung jumlah produk tertentu di dalam cart.
  int getQuantity(Product product) {
    return widget.cart.where((item) => item == product).length;
  }

  // Menghitung total harga seluruh produk.
  int get grandTotal {
    int total = 0;

    for (final product in widget.cart) {
      total += product.price;
    }

    return total;
  }

  // Mengubah quantity produk.
  void updateQuantity(Product product, String value) {
    // Mengubah teks menjadi angka.
    final parsed = int.tryParse(value);

    // Input tidak valid tidak diproses.
    if (parsed == null || parsed < 1) {
      return;
    }

    // Mengirim perubahan quantity ke HomePage.
    widget.onQuantityChanged(product, parsed);

    // Memperbarui tampilan CartPage.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Scaffold digunakan sebagai struktur utama halaman Cart.
    return Scaffold(
      // AppBar digunakan sebagai header Cart.
      appBar: AppBar(
        title: const Text('Keranjang'),
      ),

      // Body menampilkan isi keranjang.
      body: widget.cart.isEmpty
          ? const Center(
        // Text menampilkan pesan ketika cart kosong.
        child: Text(
          'Keranjang masih kosong',
          style: TextStyle(fontSize: 18),
        ),
      )
          : Column(
        children: [
          // Expanded digunakan agar ListView mengambil ruang yang tersedia.
          Expanded(
            // ListView menampilkan daftar produk.
            child: ListView.builder(
              itemCount: widget.cart.toSet().length,
              itemBuilder: (context, index) {
                final product =
                widget.cart.toSet().elementAt(index);

                final quantity = getQuantity(product);

                // Membuat controller jika belum tersedia.
                controllers.putIfAbsent(
                  product,
                      () => TextEditingController(
                    text: quantity.toString(),
                  ),
                );

                // Card digunakan untuk membungkus informasi produk.
                return Card(
                  margin: const EdgeInsets.all(10),

                  // Padding memberikan jarak isi.
                  child: Padding(
                    padding: const EdgeInsets.all(12),

                    // Row menyusun gambar dan informasi secara horizontal.
                    child: Row(
                      children: [
                        // Image.network menampilkan gambar kartu.
                        Image.network(
                          product.image,
                          width: 70,
                          height: 90,
                          fit: BoxFit.cover,
                        ),

                        const SizedBox(width: 12),

                        // Expanded membuat informasi menggunakan ruang tersisa.
                        Expanded(
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              // Text menampilkan nama kartu.
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // Text menampilkan harga.
                              Text(
                                'Rp ${product.price}',
                              ),

                              const SizedBox(height: 8),

                              // TextField digunakan untuk mengubah jumlah.
                              TextField(
                                controller: controllers[product],

                                // keyboardType digunakan agar keyboard angka.
                                keyboardType:
                                TextInputType.number,

                                // onChanged menangani perubahan quantity.
                                onChanged: (value) {
                                  updateQuantity(
                                    product,
                                    value,
                                  );
                                },

                                // Decoration mengatur tampilan input.
                                decoration:
                                const InputDecoration(
                                  labelText: 'Jumlah',
                                  border:
                                  OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // IconButton digunakan untuk menghapus produk.
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                          ),

                          // onPressed menjalankan fungsi hapus.
                          onPressed: () {
                            widget.onRemove(product);

                            // Memperbarui tampilan.
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Container digunakan sebagai bagian total pembayaran.
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Text menampilkan total harga.
                Text(
                  'Grand Total: Rp $grandTotal',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // ElevatedButton untuk checkout.
                ElevatedButton(
                  // Tombol aktif jika grandTotal lebih dari 0.
                  onPressed: grandTotal > 0
                      ? () {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Checkout berhasil!',
                        ),
                      ),
                    );
                  }
                      : null,

                  // Text menampilkan label checkout.
                  child: const Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Membersihkan semua controller ketika halaman dihancurkan.
    for (final controller in controllers.values) {
      controller.dispose();
    }

    super.dispose();
  }
}