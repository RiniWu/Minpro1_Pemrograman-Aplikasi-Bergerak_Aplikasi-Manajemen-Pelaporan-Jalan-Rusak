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

## Penjelasan Alur Aplikasi
### HomePage
- HomePage ini merupakan halaman utama dari aplikasi Pelaporan Jalan Rusak yang memiliki fungsi sebagai pusat navigasi dan pengelolaan data laporan.

- Pada bagian atas halaman terdapat hero section yang menampilkan judul aplikasi berserta deskripsi singkat, serta terdapat tombol 'Buat Laporan' sebagai akses untuk menambahkan laporan baru.

- Bagian bawah HomePage menampilkan daftar laporan, yang dimana jika belum ada data laporan baru yang ditambahkan maka aplikasi menampilkan ikon dan pesan 'Belum ada laporan'.

- Halaman ini menggunakan StatefulWidget dan setState() untuk mengelola perubahan data seperti menambah, memperbarui, dan menghapus laporan, sehingga tampilan dapat diperbarui secara langsung saat terjadi perubahan.

<img width="1919" height="1199" alt="image" src="https://github.com/user-attachments/assets/11b983a7-f182-4456-9256-1a3462824a5c" />

<img width="595" height="1007" alt="image" src="https://github.com/user-attachments/assets/dd0d97b3-b589-43bc-8764-288c20bdd50f" />

**(Tampilan ketika adanya pelaporan baru yang masuk dalam aplikasi)**

<img width="595" height="1008" alt="image" src="https://github.com/user-attachments/assets/80ac818b-fb9c-417d-86f3-75adc7cefd03" />



### TambahLaporan
- Halaman TambahLaporan merupakan halaman yang digunakan untuk memasukkan data laporan kerusakan jalan. Pada halaman ini tersedia beberapa TextField dan satu Dropdown yang dibungkus dalam Form dan menggunakan validasi agar tidak ada data yang kosong sebelum disimpan, yaitu:
1. Nama Pelapor
2. Lokasi
3. Jenis Kerusakan (Lubang, Retak dan Amblas)
4. Deskripsi
5. Tanggal

- Selanjutnya, terdapat tombol Simpan yang berfungsi untuk mengirim data kembali ke HomePage. Jika data valid, laporan akan ditambahkan ke daftar laporan dan langsung ditampilkan pada halaman utama.

<img width="1919" height="1199" alt="image" src="https://github.com/user-attachments/assets/a8f9b270-7e2c-49ca-8b8b-c7bfd31ef3d2" />

<img width="597" height="1005" alt="image" src="https://github.com/user-attachments/assets/830338a7-94a5-4f00-9b5a-9c88c4a964d3" />

**(Tampilan Halaman ketika di isi dan tidak boleh ada inputan yang kosong**

<img width="595" height="1006" alt="image" src="https://github.com/user-attachments/assets/68bfe210-28f6-4ee7-82ff-94a92885f460" />



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
