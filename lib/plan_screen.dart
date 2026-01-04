import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  List<Map> dummyPlan = [
    {
      "id": 0,
      "title": "Plan #1",
      "body": <String, dynamic>{
        "monthly": {"Makan": 900000, "Kas UKM": 20000},
        "daily": {"Makan": 30000},
        "total": 920000,
      },
      "isActive": true,
    },
    {
      "id": 1,
      "title": "Plan #2",
      "body": <String, dynamic>{
        "monthly": {"Makan": 300000, "Kas UKM": 20000},
        "daily": {"Makan": 10000},
        "total": 320000,
      },
      "isActive": false,
    },
    {
      "id": 2,
      "title": "Plan #3",
      "body": <String, dynamic>{
        "monthly": {"Makan": 480000},
        "daily": {"Makan": 16000},
        "total": 480000,
      },
      "isActive": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              "My Plans",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 20),

            // add button
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.tealAccent[700]!),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Add New Plan",
                  style: TextStyle(color: Colors.tealAccent[700]),
                ),
              ),
            ),

            SizedBox(height: 20),

            // plan list
            for (var data in dummyPlan)
              ExpansionTile(
                leading: IconButton(
                  onPressed: () {
                    setState(() {
                      for(int i = 0; i < dummyPlan.length; i++) {
                        dummyPlan[i]["isActive"] = false;
                      }

                      data["isActive"] = true;
                    });
                  },
                  icon: Icon(Icons.radio_button_off, size: 16, color: data["isActive"] ? Colors.green : Colors.grey[800]),
                ),
                collapsedIconColor: Colors.grey[800],
                iconColor: Colors.grey[800],
                subtitle: Text("Rp${data["body"]["total"]}/month", style: TextStyle(color: Colors.grey),),
                expandedAlignment: Alignment.centerLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                childrenPadding: EdgeInsets.symmetric(horizontal: 70),

                title: Text(
                  data["title"],
                  style: TextStyle(color: Colors.white),
                ),
                children: [
                  Text(
                    "Per Bulan",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  for (var monthly in data["body"]["monthly"].entries)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(monthly.key, style: TextStyle(color: Colors.grey)),
                        Text(
                          "Rp${monthly.value}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),

                  SizedBox(height: 10),

                  Text(
                    "Per Hari",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  for (var daily in data["body"]["daily"].entries)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(daily.key, style: TextStyle(color: Colors.grey)),
                        Text(
                          "Rp${daily.value}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),

                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data["body"]["total"].toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
