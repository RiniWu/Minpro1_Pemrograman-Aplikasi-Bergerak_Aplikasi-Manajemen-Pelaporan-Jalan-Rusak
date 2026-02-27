class Laporan {
  String id;
  String namaPelapor;
  String lokasi;
  String jenisKerusakan;
  String deskripsi;
  String tanggal;
  String status;

  Laporan({
    required this.id,
    required this.namaPelapor,
    required this.lokasi,
    required this.jenisKerusakan,
    required this.deskripsi,
    required this.tanggal,
    this.status = "Baru",
  });
}
