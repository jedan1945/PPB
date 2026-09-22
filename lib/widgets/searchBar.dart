import 'package:flutter/material.dart';

// Widget SearchBarWidget digunakan untuk membuat
// kolom pencarian kartu TCG.
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget Container digunakan sebagai wadah
    // untuk membuat tampilan search bar.
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),

      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
      ),

      // Widget Row digunakan untuk menyusun
      // icon search dan TextField secara horizontal.
      child: Row(
        children: [

          // Widget Icon digunakan untuk menampilkan
          // icon pencarian.
          const Icon(
            Icons.search,
            color: Colors.grey,
          ),

          // Widget SizedBox digunakan untuk memberikan
          // jarak antara icon dan TextField.
          const SizedBox(width: 10),

          // Widget Expanded digunakan agar TextField
          // memenuhi ruang yang tersisa.
          const Expanded(
            // Widget TextField digunakan sebagai
            // input untuk mencari kartu.
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your cards...',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}