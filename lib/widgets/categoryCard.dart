import 'package:flutter/material.dart';

// Widget CategoryCard digunakan untuk menampilkan
// kategori TCG seperti Pokémon, Yu-Gi-Oh!, dan One Piece.
class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color iconColor;
  final Color backgroundColor;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.iconColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // Widget Container digunakan sebagai wadah
    // untuk setiap kategori kartu.
    return Container(
      padding: const EdgeInsets.all(15),

      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(15),
      ),

      // Widget Column digunakan untuk menyusun
      // icon dan nama kategori secara vertikal.
      child: Column(
        children: [

          // Widget Icon digunakan untuk menampilkan
          // icon yang mewakili kategori.
          Icon(
            icon,
            size: 35,
            color: iconColor,
          ),

          // Widget SizedBox digunakan untuk memberikan
          // jarak antara icon dan nama kategori.
          const SizedBox(height: 8),

          // Widget Text digunakan untuk menampilkan
          // nama kategori TCG.
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}