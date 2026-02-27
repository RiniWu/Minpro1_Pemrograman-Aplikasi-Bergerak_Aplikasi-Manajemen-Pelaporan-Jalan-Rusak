import 'package:flutter/material.dart';
import '../models/laporan.dart';
import '../widgets/laporan_card.dart';
import '../pages/form_page.dart';
import '../pages/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Laporan> laporanList = [];

  void tambahLaporan(Laporan laporan) {
    setState(() => laporanList.add(laporan));
  }

  void updateLaporan(int index, Laporan laporan) {
    setState(() => laporanList[index] = laporan);
  }

  void hapusLaporan(int index) {
    setState(() => laporanList.removeAt(index));
  }

  Widget buildStat(String angka, String label) {
    return Column(
      children: [
        Text(
          angka,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.white70),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF4F8EF7),
                    Color.fromARGB(255, 147, 188, 253),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.25),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Pelaporan Jalan Rusak",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "Segera sampaikan laporan Anda\njika terdapat kerusakan jalan di sekitar Anda",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 15),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4F8EF7),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const FormPage()),
                      );
                      if (result != null) tambahLaporan(result);
                    },
                    child: const Text(
                      "Buat Laporan",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: laporanList.isEmpty
                  ? Column(
                      children: [
                        Icon(
                          Icons.inbox_outlined,
                          size: 70,
                          color: const Color.fromARGB(
                            255,
                            49,
                            87,
                            117,
                          ).withOpacity(0.3),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Belum ada laporan",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          "Tekan tombol 'Buat Laporan' untuk memulai",
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        ),
                      ],
                    )
                  : Column(
                      children: List.generate(laporanList.length, (index) {
                        return LaporanCard(
                          laporan: laporanList[index],
                          onDelete: () => hapusLaporan(index),
                          onTap: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    DetailPage(laporan: laporanList[index]),
                              ),
                            );
                            if (result != null) {
                              updateLaporan(index, result);
                            }
                          },
                        );
                      }),
                    ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
