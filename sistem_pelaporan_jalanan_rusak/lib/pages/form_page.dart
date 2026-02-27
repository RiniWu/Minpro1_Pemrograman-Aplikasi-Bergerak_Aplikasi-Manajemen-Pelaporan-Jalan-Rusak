import 'package:flutter/material.dart';
import '../models/laporan.dart';

class FormPage extends StatefulWidget {
  final Laporan? laporan;
  const FormPage({super.key, this.laporan});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();

  final namaController = TextEditingController();
  final lokasiController = TextEditingController();
  final deskripsiController = TextEditingController();
  final tanggalController = TextEditingController();

  String selectedJenis = "Lubang";

  @override
  void initState() {
    super.initState();
    if (widget.laporan != null) {
      namaController.text = widget.laporan!.namaPelapor;
      lokasiController.text = widget.laporan!.lokasi;
      deskripsiController.text = widget.laporan!.deskripsi;
      tanggalController.text = widget.laporan!.tanggal;
      selectedJenis = widget.laporan!.jenisKerusakan;
    }
  }

  void simpan() {
    if (!_formKey.currentState!.validate()) return;

    final laporan = Laporan(
      id:
          widget.laporan?.id ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      namaPelapor: namaController.text,
      lokasi: lokasiController.text,
      jenisKerusakan: selectedJenis,
      deskripsi: deskripsiController.text,
      tanggal: tanggalController.text,
      status: widget.laporan?.status ?? "Baru",
    );

    Navigator.pop(context, laporan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.laporan == null ? "Tambah Laporan" : "Edit Laporan"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(labelText: "Nama Pelapor"),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: lokasiController,
                decoration: const InputDecoration(labelText: "Lokasi"),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 20),

              DropdownButtonFormField(
                value: selectedJenis,
                decoration: const InputDecoration(labelText: "Jenis Kerusakan"),
                items: ["Lubang", "Retak", "Amblas"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (v) => setState(() => selectedJenis = v!),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: deskripsiController,
                decoration: const InputDecoration(labelText: "Deskripsi"),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: tanggalController,
                decoration: const InputDecoration(labelText: "Tanggal"),
                validator: (value) =>
                    value!.isEmpty ? "Tidak boleh kosong" : null,
              ),
              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: simpan,
                child: Text(widget.laporan == null ? "Simpan" : "Update"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
