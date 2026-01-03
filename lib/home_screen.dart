import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dummy = [
      {
        "tanggal": "3 Jan 26",
        "jumlah": "+Rp30.000",
        "kategori": "Piutang",
        "tipe": "plus",
      },
      {
        "tanggal": "2 Jan 26",
        "jumlah": "-Rp10.000",
        "kategori": "Makan Berat",
        "tipe": "minus",
      },
      {
        "tanggal": "2 Jan 26",
        "jumlah": "-Rp8.000",
        "kategori": "Jajan",
        "tipe": "minus",
      },
      {
        "tanggal": "1 Jan 26",
        "jumlah": "-Rp10.000",
        "kategori": "Makan Berat",
        "tipe": "minus",
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 30),

          // Info box
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.teal[800],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pengeluaran hari ini",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                Text(
                  "Rp10.000 / Rp30.000",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // History
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "History",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add, size: 27),
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: [
                  TableRow(
                    children: [
                      Text(
                        "Tanggal",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Jumlah",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Kategori",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(""),
                    ],
                  ),
                  for (var data in dummy)
                    TableRow(
                      children: [
                        Text(
                          data["tanggal"]!,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          data["jumlah"]!,
                          style: TextStyle(
                            color: data["tipe"] == "plus"
                                ? Colors.green[600]
                                : Colors.red[700],
                          ),
                        ),
                        Text(
                          data["kategori"]!,
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.remove_red_eye, size: 20),
                              color: Colors.white,
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit, size: 20),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
