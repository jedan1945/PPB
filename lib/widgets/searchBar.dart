import 'package:flutter/material.dart';

// Widget SearchBar digunakan untuk menerima input pencarian.
class SearchBarWidget extends StatelessWidget {
  // Callback akan dijalankan ketika teks berubah.
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Padding memberikan jarak di sekitar TextField.
    return Padding(
      padding: const EdgeInsets.all(16),

      // TextField digunakan untuk memasukkan kata pencarian.
      child: TextField(
        // onChanged mengirimkan teks ke HomePage.
        onChanged: onChanged,

        // Decoration mengatur tampilan TextField.
        decoration: InputDecoration(
          hintText: 'Cari kartu TCG...',
          prefixIcon: const Icon(Icons.search),

          // Border digunakan untuk membuat garis input.
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}