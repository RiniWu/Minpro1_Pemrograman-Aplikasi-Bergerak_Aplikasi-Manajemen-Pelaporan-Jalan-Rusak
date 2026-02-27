import 'package:flutter/material.dart';
import '../models/laporan.dart';
import 'form_page.dart';

class DetailPage extends StatefulWidget {
  final Laporan laporan;
  const DetailPage({super.key, required this.laporan});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Laporan laporan;

  @override
  void initState() {
    super.initState();
    laporan = widget.laporan;
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Baru":
        return const Color(0xFFE57373);
      case "Diproses":
        return const Color(0xFFFFB74D);
      case "Selesai":
        return const Color(0xFF81C784);
      default:
        return Colors.grey;
    }
  }

  void updateStatus(String status) async {
    final confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text("Ubah Status"),
          content: Text(
            "Apakah Anda yakin ingin mengubah status menjadi \"$status\"?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text("Ya"),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      setState(() => laporan.status = status);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Status berhasil diperbarui")),
      );

      Navigator.pop(context, laporan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Laporan")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              laporan.lokasi,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

            Text("Pelapor: ${laporan.namaPelapor}"),
            Text("Jenis: ${laporan.jenisKerusakan}"),
            Text("Tanggal: ${laporan.tanggal}"),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: getStatusColor(laporan.status),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                laporan.status,
                style: const TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 10,
              children: ["Baru", "Diproses", "Selesai"]
                  .map(
                    (e) => ElevatedButton(
                      onPressed: () => updateStatus(e),
                      child: Text(e),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FormPage(laporan: laporan)),
                );
                if (result != null) {
                  setState(() => laporan = result);
                  Navigator.pop(context, laporan);
                }
              },
              child: const Text("Edit"),
            ),
          ],
        ),
      ),
    );
  }
}
