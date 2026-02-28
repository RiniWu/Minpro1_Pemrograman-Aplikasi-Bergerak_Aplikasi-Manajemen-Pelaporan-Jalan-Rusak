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

## Penjelasan Fitur Aplikasi
### 1. HomePage
- HomePage ini merupakan halaman utama dari aplikasi Pelaporan Jalan Rusak yang memiliki fungsi sebagai pusat navigasi dan pengelolaan data laporan.

- Pada bagian atas halaman terdapat hero section yang menampilkan judul aplikasi berserta deskripsi singkat, serta terdapat tombol 'Buat Laporan' sebagai akses untuk menambahkan laporan baru.

- Bagian bawah HomePage menampilkan daftar laporan, yang dimana jika belum ada data laporan baru yang ditambahkan maka aplikasi menampilkan ikon dan pesan 'Belum ada laporan'.

- Halaman ini menggunakan StatefulWidget dan setState() untuk mengelola perubahan data seperti menambah, memperbarui, dan menghapus laporan, sehingga tampilan dapat diperbarui secara langsung saat terjadi perubahan.

<img width="595" height="1007" alt="image" src="https://github.com/user-attachments/assets/dd0d97b3-b589-43bc-8764-288c20bdd50f" />

**(Tampilan ketika adanya pelaporan baru yang masuk dalam aplikasi)**

<img width="595" height="1008" alt="image" src="https://github.com/user-attachments/assets/80ac818b-fb9c-417d-86f3-75adc7cefd03" />



### 2. FormPage
- Halaman FormPage merupakan halaman yang digunakan untuk memasukkan data laporan kerusakan jalan. Pada halaman ini tersedia beberapa TextField dan satu Dropdown yang dibungkus dalam Form dan menggunakan validasi agar tidak ada data yang kosong sebelum disimpan, yaitu:
1. Nama Pelapor
2. Lokasi
3. Jenis Kerusakan (Lubang, Retak dan Amblas)
4. Deskripsi
5. Tanggal

- Selanjutnya, terdapat tombol 'Simpan' yang berfungsi untuk mengirim data kembali ke HomePage. Jika data valid, laporan akan ditambahkan ke daftar laporan dan langsung ditampilkan pada halaman utama.

<img width="597" height="1005" alt="image" src="https://github.com/user-attachments/assets/830338a7-94a5-4f00-9b5a-9c88c4a964d3" />

**(Tampilan Halaman ketika diisi dan tidak boleh ada inputan yang kosong)**

<img width="595" height="1006" alt="image" src="https://github.com/user-attachments/assets/68bfe210-28f6-4ee7-82ff-94a92885f460" />



### 3. DetailPage
- DetailPage berfungsi untuk menampilkan informasi lengkap dari laporan yang telah dibuat. Pada halaman ini ditampilan lokasi sebagai judul utama, diikuti dengan data pelapor, jenis kerusakan, tanggal, serta status laporan yang di tampilkan.
- Status laporan ketika baru dibuat akan berstatus 'Baru' tetapi pengguna dapat mengubah status laporan menjadi Baru, Diproses, atau Selesai dengan cara mengklik laporan lalu memilik tombol yang tersedia.
- Selain itu, terdapat tombol Edit yang memungkinkan pengguna memperbarui data laporan.

<img width="594" height="1005" alt="image" src="https://github.com/user-attachments/assets/2de095f5-b4f3-48b0-b5e9-d4ba39ce216c" />

**(Tampilan ketika status ingin diubah)**

<img width="596" height="981" alt="image" src="https://github.com/user-attachments/assets/0b16f872-570b-4ec6-a693-54d84f7f1f7b" />

**(Tampilan ketika status laporan telah diubah)**

<img width="596" height="981" alt="image" src="https://github.com/user-attachments/assets/2f143070-99a0-4e34-9693-e1ce6cd85b0a" />



### 4. Menghapus Laporan
- Untuk menghapus laporan bisa langsung klik ikon tempat sampah berwarna merah pada sebelah kanan laporan, setelah diklik akan muncul konfirmasi untuk memastikan bahwa pengguna benar-benar ingin menghapus data yang dipilih.
- Terdapat dua pilihan tombol, yaitu Batal untuk membatalkan proses dan kembali ke halaman sebelumnya, serta Hapus untuk melanjutkan penghapusan. Jika pengguna memilih Hapus, data akan dihapus dari daftar laporan dan tampilan akan diperbarui secara otomatis.

<img width="593" height="980" alt="image" src="https://github.com/user-attachments/assets/bd2cc553-6b33-4634-b630-e1a1d1263a27" />

**(Tampilan setelah laporan dihapus)**

Setelah laporan dihapus di bagian bawah layar muncul notifikasi berupa SnackBar dengan pesan “Laporan berhasil dihapus” sebagai bentuk umpan balik kepada pengguna bahwa proses penghapusan telah berhasil dilakukan.

<img width="594" height="982" alt="image" src="https://github.com/user-attachments/assets/cb63981d-af1e-4307-adc1-8aeb577b42e0" />




## Widget Yang Digunakan
Berikut widget yang digunakan dalam aplikasi berdasarkan kode:

**Struktur & Layout**
- MaterialApp → Widget utama untuk mengatur tema, routing, dan struktur dasar aplikasi.
- Scaffold → Kerangka halaman (punya AppBar, body, drawer, dll).
- AppBar → Bar di bagian atas aplikasi (judul, icon, dll).
- Container → Pembungkus widget untuk styling (warna, margin, padding, ukuran).
- Column → Menyusun widget secara vertikal (atas ke bawah).
- Row → Menyusun widget secara horizontal (kiri ke kanan).
- Padding → Memberi jarak di dalam widget.
- SizedBox → Memberi jarak atau ukuran tetap.
- SingleChildScrollView → Membuat 1 widget agar bisa di-scroll.
- ListView → Menampilkan daftar yang bisa di-scroll (list panjang).
- Wrap → Menyusun widget otomatis pindah baris jika penuh.

**Input & Form**
- Form → Wadah untuk mengelola input (validasi, submit).
- GlobalKey<FormState> → Mengontrol dan validasi Form.
- TextFormField → Input teks + validasi.
- DropdownButtonFormField → Input pilihan (dropdown).
- TextEditingController → Mengambil dan mengontrol isi TextField.

**Navigasi**
- Navigator.push() → Pindah ke halaman baru.
- Navigator.pop() → Kembali ke halaman sebelumnya.
- MaterialPageRoute → Membungkus halaman tujuan saat navigasi.

**Tampilan & Interaksi**
- ElevatedButton → Tombol dengan efek timbul (utama).
- TextButton → Tombol tanpa background (ringan).
- Icon → Menampilkan ikon.
- IconButton → Tombol berbentuk ikon.
- CircleAvatar → Menampilkan gambar/profil berbentuk lingkaran.
- AlertDialog → Popup dialog (konfirmasi/info).
- SnackBar → Notifikasi singkat di bawah layar.

InkWell → Memberi efek klik (ripple) pada widget.
**State Management**
- StatefulWidget → Widget yang bisa berubah (punya state).
- setState() → Mengupdate tampilan saat data berubah.
