//Tampilan awal pada halaman
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penjualan Mas Pedro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dasboard Sales'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SalesDataScreen()),
                );
              },

              child: Text('Sales Data'), //Tombol Sales
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => IncomingGoodsScreen()),
                );
              },
              child: Text(
                  'Data Barang yaang tersedia'), //Tombol Data Barang Yang Tersedia
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AvailableGoodsScreen()),
                );
              },
              child: Text('Sisa Barang'), //Tombol Sisa Barang
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SoldGoodsScreen()),
                );
              },
              child: Text('Barang Yang Terjual'), //Tombol Barang Yang Terjual
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RemainingGoodsScreen()),
                );
              },
              child: Text('Stok Barang'), // Tombol Stok Barang
            ),
          ],
        ),
      ),
    );
  }
}

//Tampilan pada Sales Data
class SalesDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Barang'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.add_shopping_cart),
                title: Text('Buku '),
                subtitle: Text('Harga: Rp. 100.000'),
              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart),
                title: Text('Pensil'),
                subtitle: Text('Harga: Rp. 200.000'),
              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart),
                title: Text('Pulpen'),
                subtitle: Text('Harga: Rp. 500.000'),
              ),
              ListTile(
                leading: Icon(Icons.add_shopping_cart),
                title: Text('Penggaris'),
                subtitle: Text('Harga: Rp. 150.000'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Selesai

//Tampialn pada Barang Yang Tersedia
class IncomingGoodsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> incomingGoods = [
    {'id': '1', 'name': 'Buku', 'price': 'Rp. 100.000', 'stok': '10Pcs'},
    {'id': '2', 'name': 'Pensil', 'price': 'Rp. 200.000', 'stok': '90Pcs'},
    {'id': '3', 'name': 'Pulpen', 'price': 'Rp. 500.000', 'stok': '100Pcs'},
    {'id': '4', 'name': 'Penggaris', 'price': 'Rp. 200.000', 'stok': '12Pcs'},
    {'id': '5', 'name': 'Penghapus', 'price': 'Rp. 200.000', 'stok': '12Pcs'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Barang yang tersedia'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: incomingGoods.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.add_shopping_cart),
              title: Text(incomingGoods[index]['name']),
              subtitle: Text(incomingGoods[index]['price']),
            );
          },
        ),
      ),
    );
  }
}
//Selesai

//Tampilan Pada Sisa Barang
class SisaBarang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabel Data Sisa Barang',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AvailableGoodsScreen(),
    );
  }
}

class AvailableGoodsScreen extends StatelessWidget {
  final List<Goods> availableGoods = [
    Goods(id: 1, name: 'Buku', quantity: 50),
    Goods(id: 2, name: 'Pulpen', quantity: 100),
    Goods(id: 3, name: 'Penggaris', quantity: 75),
    Goods(id: 4, name: 'Penghapus', quantity: 20),
    Goods(id: 5, name: 'Pensil Warna', quantity: 22),
    Goods(id: 6, name: 'Kertas HVS', quantity: 19),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sisa Barang'),
      ),
      body: Center(
        child: DataTable(
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Nama Barang')),
            DataColumn(label: Text('Jumlah')),
          ],
          rows: availableGoods
              .map(
                (goods) => DataRow(
                  cells: [
                    DataCell(Text(goods.id.toString())),
                    DataCell(Text(goods.name)),
                    DataCell(Text(goods.quantity.toString())),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class Goods {
  final int id;
  final String name;
  final int quantity;

  Goods({required this.id, required this.name, required this.quantity});
}
//Selesai

//Tampilan paada Barang Yang terjual
class SoldGoodsScreen extends StatelessWidget {
  List<DataColumn> _columns = [
    DataColumn(label: Text('ID')),
    DataColumn(label: Text('Name')),
    DataColumn(label: Text('Price')),
    DataColumn(label: Text('Quantity')),
  ];

  List<DataRow> _rows = [
    DataRow(cells: [
      DataCell(Text('1')),
      DataCell(Text('Spidol')),
      DataCell(Text('Rp 100.000')),
      DataCell(Text('5')),
    ]),
    DataRow(cells: [
      DataCell(Text('2')),
      DataCell(Text('Buku Gambar')),
      DataCell(Text('Rp 150.000')),
      DataCell(Text('3')),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barang yang terjual'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Barang Yang Terjual',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: _columns,
                rows: _rows,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//selesai

//Tampilan pada Stok Barang
class RemainingGoodsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stok Barang'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Stok Barang',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32), //PEMBUATAN TABEL STOK BARANG
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 16,
                    offset: Offset(0, 8),
                  ), //SELESAI
                ],
              ),
              child: Column(
                //ISI DARI BOX STOK BARANG
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Buku',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Buku gambar',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '90Pcs Dari ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '100 pcs',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ), //SELESAI
            ),
          ],
        ),
      ),
    );
  }
}
//Selesai tampilan stok Barang