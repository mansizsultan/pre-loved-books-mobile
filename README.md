# Platform-Based Programming: Individual Assignment with Flutter

| NAME               | ID         | PBP CLASS |
| ------------------ | ---------- | --------- |
| Sultan Ibnu Mansiz | 2306275840 | D         |

Pada tugas ini, saya membuat suatu projek aplikasi mobile e-commerce sederhana bernama "Second Chapters <3" dengan ide menjual buku-buku bekas. Saya menggunakan framework Flutter untuk membangun dan mengembangkan projek ini.

# Assignment 7: Flutter Basic Elements

## _Checklist_ Tugas

- [x] Membuat sebuah program Flutter baru dengan tema _E-Commerce_ yang sesuai dengan tugas-tugas sebelumnya.

- [x] Membuat tiga tombol sederhana dengan ikon dan teks untuk:
  - [x] Melihat daftar produk (`Lihat Daftar Produk)`)
  - [x] Menambah produk (`Tambah Produk`)
  - [x] Logout (`Logout`)

- [x] Mengimplementasikan warna-warna yang berbeda untuk setiap tombol (`Lihat Daftar Produk`, `Tambah Produk`, dan `Logout`).

- [x] Memunculkan `Snackbar` dengan tulisan:
  - [x] "Kamu telah menekan tombol Lihat Daftar Produk" ketika tombol `Lihat Daftar Produk` ditekan.
  - [x] "Kamu telah menekan tombol Tambah Produk" ketika tombol `Tambah Produk` ditekan.
  - [x] "Kamu telah menekan tombol Logout" ketika tombol `Logout` ditekan.


- [x] Menjawab beberapa pertanyaan berikut pada `README.md` pada _root folder_.

### Jelaskan apa yang dimaksud dengan _stateless widget_ dan _stateful widget_, dan jelaskan perbedaan dari keduanya!
- _Stateless Widget_
    
    _Stateless Widget_ adalah jenis _widget_ yang tidak berubah dari state internal yang dapat berubah seiring waktu. Artinya, tampilan dari widget ini akan tetap sama setelah pertama kali dibangun. _Stateless Widget_ hanya memiliki properti _final_ yang akan ditampilkan di layar. Pada tugas kali ini, saya menggunakan _stateless widget_ untuk menampilkan _info card_ dan _item card_ yang mana hal tersebut merupakan hal statis dan tidak berubah 

- _Stateful Widget_

    _Stateful Widget_ adalah jenis _widget_ yang memiliki state internal yang dapat berubah seiring waktu. Perubahan pada state akan menyebabkan _widget_ tersebut membangun ulang atau merubah tampilannya.

Salah satu perbedaan utama antara _Stateless Widget_ dan _Stateful Widget_ adalah dalam hal menampilkan _widget_ pada aplikasi kita. Gunakan _Stateless Widget_ ketika kita ingin menampilkan _widget_ yang sederhana dan statis, seperti gambar dan teks. Gunakan _Stateful Widget_ ketika kita ingin menampilkan _widget_ yang dapat berubah seiring interaksi dengan user, seperti form dan list.

### Sebutkan _widget_ apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya!

Dalam tugas kali ini, saya membuat dua buah _stateless widget_ yang saya implementasikan dalam kelas `InfoCard` dan `ItemCard`. _Widget_ pada kelas `InfoCard` berfungsi untuk menampilkan data diri saya, seperti nama, npm, dan kelas. _Widget_ pada kelas `ItemCard` berfungsi untuk menampilkan tiga buah _button card_. Untuk tugas kali ini, tiga buah _button card_ tersebut hanya berfungsi untuk menampilkan _snackbar_ ketika dipencet.

### Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut!

Singkatnya, `setState()` berfungsi untuk memberi tahu _framework_ bahwa ada perubahan pada suatu variabel di dalam _widget_. Perubahan tersebut mengharuskan tampilan untuk diperbarui agar sesuai dengan perubahan data. Variabel-variabel yang terdampak dari fungsi `setState()` di antaranya adalah variabel yang ada di kelas _Stateful Widget_ dan _database_ sesuai dengan perubahan apa yang terjadi (menampilkan data atau menambahkan data).

### Jelaskan perbedaan antara `const` dengan `final`!

`const` dan `final` sama-sama digunakan untuk mendeklarasikan data yang tidak dapat diubah. Perbedaan utama keduanya adalah:

- `const`

    Nilai pada variabel `const` harus ditentukan sebelum program dijalankan dan tidak dapat menerima nilai yang dihasilkan saat _runtime_.
    ```dart
      const pi = 3.14159;
    ```

- `final`

    Nilai pada variabel `final` dapat ditentukan baik saaat waktu _runtime_ maupun sebelum. Ketika nilai variabelnya ditentukan, hal tersebut hanya dapat dilakukan sekali dan tidak akan berubah.
    ```dart
      class ItemHomepage {
        final String name;
        final IconData icon;

        ItemHomepage(this.name, this.icon);
      }
    ```


###  Jelaskan bagaimana cara kamu mengimplementasikan _checklist-checklist_ di atas!

- Saya membuat projek Flutter baru dengan menjalankan command di bawah
  ```dart
    flutter create pre_loved_books
  ```

- Untuk membuat tiga tombol sederhana dengan ikon dan teks, saya membuat file baru bernama `menu.dart` yang saya isi dengan kelas benama `ItemCard`. Kelas `ItemCard` akan menerima 2 buah variabel, yaitu `item` sebagai digunakan sebagai nama card dan icon, dan `backgroundColor` sebagai warna untuk masing-masing card yang dibuat.

  ```dart
  class ItemCard extends StatelessWidget {
    // Menampilkan kartu dengan ikon dan nama.
    final ItemHomepage item;
    final Color backgroundColor;

    const ItemCard(this.item, {required this.backgroundColor, super.key});
    ...

  ```

- Untuk mengimplementasikan warna yang berbeda, saya membuat variabel baru yang berisi warna-warna yang akan digunakan, lalu, akan diinisialisasi di kelas `ItemCard`.
  ```dart
  ...
  // Variabel warna 
  final List<Color> itemColors = [
    Colors.blue, 
    Colors.green, 
    Colors.red, 
  ];
  ...
  // Inisialisasi warna
  children: items.asMap().entries.map((entry) {
    int index = entry.key;
    ItemHomepage item = entry.value;

    return ItemCard(item, backgroundColor: itemColors[index]);
  }).toList(),
  ...
  // Menggunakan warna yang telah diinisialisasi
  class ItemCard extends StatelessWidget {
    final ItemHomepage item;
    final Color backgroundColor;

    const ItemCard(this.item, {required this.backgroundColor, super.key});
    @override
    Widget build(BuildContext context) {
      return Material(
        color: backgroundColor,
        ...
      )
    }
  }
  ```

- Untuk memunculkan `snackbar` yang sesuai dengan ketentuan, saya mengimplementasi kode di bawah di dalam kelas `ItemCard`
  ```dart
    onTap: () {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
            content: Text("Kamu telah menekan tombol ${item.name}!")));
    },
  ```

- [x] Melakukan `add`-`commit`-`push` ke suatu repositori baru di GitHub.



