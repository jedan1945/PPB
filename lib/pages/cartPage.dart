import 'package:flutter/material.dart';

// Widget CartPage digunakan sebagai halaman
// keranjang belanja TCG Card Shop.
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget Scaffold digunakan sebagai struktur
    // dasar halaman Cart.
    return Scaffold(
      // Widget AppBar digunakan sebagai bagian atas
      // halaman Cart.
      appBar: AppBar(
        // Widget Text digunakan untuk menampilkan
        // judul halaman.
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        // Tombol kembali akan menggunakan Navigator.pop.
        leading: IconButton(
          // Widget IconButton digunakan sebagai tombol
          // untuk kembali ke halaman sebelumnya.
          icon: const Icon(Icons.arrow_back),

          // Navigator.pop digunakan untuk menghapus
          // halaman Cart dari navigation stack.
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      // Widget SafeArea digunakan agar isi halaman
      // tidak tertutup oleh area sistem perangkat.
      body: SafeArea(
        // Widget Padding digunakan untuk memberikan
        // jarak dari tepi layar.
        child: Padding(
          padding: const EdgeInsets.all(20),

          // Widget Column digunakan untuk menyusun
          // isi halaman Cart secara vertikal.
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Widget Text digunakan untuk menampilkan
              // judul bagian keranjang.
              const Text(
                'Your Collection',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Widget SizedBox digunakan untuk memberikan
              // jarak setelah judul.
              const SizedBox(height: 20),

              // Widget Container digunakan sebagai
              // kartu produk di dalam keranjang.
              Container(
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),

                  // BoxShadow digunakan untuk memberikan
                  // efek bayangan pada produk.
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),

                // Widget Row digunakan untuk menyusun
                // informasi produk secara horizontal.
                child: Row(
                  children: [

                    // Widget Container digunakan sebagai
                    // area visual kartu.
                    Container(
                      width: 80,
                      height: 100,

                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      // Widget Icon digunakan sebagai
                      // visual kartu TCG.
                      child: const Icon(
                        Icons.style,
                        size: 45,
                        color: Colors.red,
                      ),
                    ),

                    // Widget SizedBox digunakan untuk
                    // memberikan jarak antara gambar dan teks.
                    const SizedBox(width: 15),

                    // Widget Expanded digunakan agar informasi
                    // produk mengambil ruang yang tersedia.
                    const Expanded(
                      // Widget Column digunakan untuk menyusun
                      // nama, harga, dan jumlah produk.
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Widget Text digunakan untuk
                          // menampilkan nama kartu.
                          Text(
                            'Charizard',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // Widget SizedBox digunakan untuk
                          // memberikan jarak antar teks.
                          SizedBox(height: 6),

                          // Widget Text digunakan untuk
                          // menampilkan harga.
                          Text(
                            'Rp 250.000',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // Widget SizedBox digunakan untuk
                          // memberikan jarak sebelum jumlah.
                          SizedBox(height: 6),

                          // Widget Text digunakan untuk
                          // menampilkan jumlah kartu.
                          Text(
                            'Quantity: 1',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Widget Spacer digunakan untuk mendorong
              // total harga ke bagian bawah halaman.
              const Spacer(),

              // Widget Container digunakan sebagai
              // area total pembayaran.
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),

                // Widget Row digunakan untuk menyusun
                // tulisan Total dan harga.
                child: Row(
                  children: [

                    // Widget Expanded digunakan agar
                    // tulisan Total berada di kiri.
                    const Expanded(
                      child: Text(
                        'Total',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // Widget Text digunakan untuk
                    // menampilkan total harga.
                    const Text(
                      'Rp 250.000',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Widget SizedBox digunakan untuk memberikan
              // jarak antara total dan tombol.
              const SizedBox(height: 15),

              // Widget SizedBox digunakan untuk menentukan
              // tinggi tombol Checkout.
              SizedBox(
                width: double.infinity,
                height: 50,

                // Widget ElevatedButton digunakan sebagai
                // tombol checkout.
                child: ElevatedButton(
                  onPressed: () {
                    // Tombol checkout belum memiliki
                    // proses pembayaran.
                  },

                  // Widget Text digunakan sebagai
                  // tulisan pada tombol.
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}