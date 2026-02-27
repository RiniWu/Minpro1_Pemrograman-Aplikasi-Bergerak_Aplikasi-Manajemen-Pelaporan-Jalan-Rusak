import 'package:flutter/material.dart';
import '../models/laporan.dart';

class LaporanCard extends StatelessWidget {
  final Laporan laporan;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  const LaporanCard({
    super.key,
    required this.laporan,
    required this.onDelete,
    required this.onTap,
  });

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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: getStatusColor(laporan.status).withOpacity(0.2),
              child: Icon(Icons.warning, color: getStatusColor(laporan.status)),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    laporan.lokasi,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text("Pelapor: ${laporan.namaPelapor}"),
                  Text("${laporan.jenisKerusakan} • ${laporan.tanggal}"),
                ],
              ),
            ),

            IconButton(
              icon: const Icon(Icons.delete, color: Colors.redAccent),
              onPressed: () async {
                final confirm = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: const Text("Hapus Laporan"),
                      content: const Text(
                        "Apakah Anda yakin ingin menghapus laporan ini?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: const Text("Batal"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                          ),
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: const Text("Hapus"),
                        ),
                      ],
                    );
                  },
                );

                if (confirm == true) {
                  onDelete();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Laporan berhasil dihapus")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
