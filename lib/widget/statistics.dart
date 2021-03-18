import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Statistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 35, right: 35, top: 40),
            child: Row(
              children: [
                Text(
                  "Pranshu Tripathi",
                  style: TextStyle(color: Colors.white, fontSize: 27),
                ),
                Spacer(),
                Icon(
                  Icons.account_circle_outlined,
                  size: 40,
                  color: Colors.white,
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 35),
              child: Text("See Your Carbon FootPrint Here\n",
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
            ),
          ),
          SizedBox(
            height: _height * 0.04,
          ),
          Container(
            width: _width,
            height: _height * 1,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: DataTable(columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        "Activity",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Present",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        "Previous",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        " % ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    )
                  ], rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Personal Vehicle')),
                        DataCell(Text('190')),
                        DataCell(Text('205')),
                        DataCell(Text('-14%',
                            style: TextStyle(color: Colors.green))),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('LPG')),
                        DataCell(Text('150')),
                        DataCell(Text('140')),
                        DataCell(
                            Text('14%', style: TextStyle(color: Colors.red)))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Electricity')),
                        DataCell(Text('167')),
                        DataCell(Text('178')),
                        DataCell(Text(
                          '-13%',
                          style: TextStyle(color: Colors.green),
                        ))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Home Appliances')),
                        DataCell(Text('167')),
                        DataCell(Text('178')),
                        DataCell(
                            Text('-13%', style: TextStyle(color: Colors.green)))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Television')),
                        DataCell(Text('167')),
                        DataCell(Text('178')),
                        DataCell(
                            Text('13%', style: TextStyle(color: Colors.red)))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Waste')),
                        DataCell(Text('167')),
                        DataCell(Text('178')),
                        DataCell(
                            Text('13%', style: TextStyle(color: Colors.red)))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                          'Total FootPrint',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataCell(Text('667',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Text('878',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Text('23%',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold)))
                      ],
                    ),
                  ]),
                ),
                SizedBox(
                  height: _height * 0.01,
                ),
                Text(
                  "Carbon Footprint Distribution\n",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: PieChart(
                    PieChartData(
                      centerSpaceRadius: 70,
                      sectionsSpace: 0,
                      sections: showsections(),
                      borderData: FlBorderData(
                        show: false,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          color: Colors.pink[200],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Personal Vehicle")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          color: Colors.green[300],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("LPG")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Electricity")
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Home Appliances")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          color: Colors.blue[50],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Television")
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Waste")
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  List<PieChartSectionData> showsections() {
    return List.generate(6, (index) {
      switch (index) {
        case 0:
          return PieChartSectionData(
              color: Colors.pink[200],
              value: 40,
              title: '40%',
              radius: 50,
              titleStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black));
          break;
        case 1:
          return PieChartSectionData(
              color: Colors.green[300],
              value: 30,
              title: '30%',
              radius: 50,
              titleStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black));
          break;
        case 2:
          return PieChartSectionData(
            color: Colors.blue[400],
            value: 15,
            title: '15%',
            radius: 50,
            titleStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          );
          break;
        case 3:
          return PieChartSectionData(
            color: Colors.amber,
            value: 10,
            title: '10%',
            radius: 50,
            titleStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          );
          break;
        case 4:
          return PieChartSectionData(
            color: Colors.blue[50],
            value: 5,
            title: '5%',
            radius: 50,
            titleStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          );
          break;
        case 5:
          return PieChartSectionData(
            color: Colors.orange,
            value: 5,
            title: '5%',
            radius: 50,
            titleStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          );
          break;
        default:
          return null;
      }
    });
  }
}
