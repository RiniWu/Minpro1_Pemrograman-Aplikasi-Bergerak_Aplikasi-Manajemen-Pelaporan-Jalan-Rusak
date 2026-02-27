# Minpro1_Pemrograman Aplikasi Bergerak

## Nama: Rini Wulandari

## NIM: 2409116048

## Kelas: Sistem Informasi B 2024


# Aplikasi Manajemen Pelaporan Jalan Rusak
## Deskripsi Aplikasi
Aplikasi Pelaporan Jalan Rusak merupakan aplikasi mobile berbasis Flutter yang dirancang untuk mencatat dan mengelola laporan kerusakan jalan secara sederhana.
Aplikasi ini memungkinkan pengguna untuk:
- Menambahkan laporan kerusakan jalan
- Melihat daftar laporan
- Melihat detail laporan
- Mengubah status laporan
- Mengedit dan menghapus laporan

## Fitur Aplikasi
### 1. Create (Tambah Laporan)
Pengguna dapat menambahkan laporan baru melalui halaman form. Data yang diinput:
- Nama Pelapor
- Lokasi
- Jenis Kerusakan (Lubang, Retak, Amblas)
- Deskripsi
- Tanggal

Data divalidasi agar tidak boleh kosong.

### 2. Read (Menampilkan Laporan)
Semua laporan ditampilkan pada halaman utama dalam bentuk card. Jika belum ada laporan, akan muncul tampilan “Belum ada laporan”.

### 3. Update
Pengguna dapat:
- Mengedit isi laporan
- Mengubah status laporan (Baru, Diproses, Selesai)
Perubahan status memiliki konfirmasi sebelum disimpan.

### 4. Delete
Laporan dapat dihapus. Sebelum dihapus, muncul dialog konfirmasi untuk mencegah penghapusan tidak sengaja.


## Widget Yang Digunakan
Berikut widget yang digunakan dalam aplikasi berdasarkan kode:
**Struktur & Layout**
- MaterialApp
- Scaffold
- AppBar
- Container
- Column
- Row
- Padding
- SizedBox
- SingleChildScrollView
- ListView
- Wrap

**Input & Form**
- Form
- GlobalKey<FormState>
- TextFormField
- DropdownButtonFormField
- TextEditingController

**Navigasi**
- Navigator.push()
- Navigator.pop()
- MaterialPageRoute

**Tampilan & Interaksi**
- ElevatedButton
- TextButton
- Icon
- IconButton
- CircleAvatar
- AlertDialog
- SnackBar
- InkWell

**State Management**
- StatefulWidget
- setState()
