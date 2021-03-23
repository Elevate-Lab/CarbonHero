import 'package:carbon_emission/models/user.dart';
import 'package:carbon_emission/screens/Profile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  var database = Firestore.instance;

  double _totalCarbonEmissionThisMonth = 0.00;
  double _totalCarbonEmissionLastMonth = 0.00;
  double _totalCarbonEmissionChange = 0.00;
  var user;

  double _transport_previous_month = 0.00;
  double _transport_this_month = 0.00;
  double _transport_percentage_change = 0.00;
  double _transport_percentage_affect = 0.00;

  double _lpg_previous_month = 0.00;
  double _lpg_this_month = 0.00;
  double _lpg_percentage_change = 0.00;
  double _lpg_percentage_affect = 0.00;

  double _electricity_previous_month = 0.00;
  double _electricity_this_month = 0.00;
  double _electricity_percentage_change = 0.00;
  double _electricity_percentage_affect = 0.00;

  double _homeApp_previous_month = 0.00;
  double _homeApp_this_month = 0.00;
  double _homeApp_percentage_change = 0.00;
  double _homeApp_percentage_affect = 0.00;

  double _waste_previous_month = 0.00;
  double _waste_this_month = 0.00;
  double _waste_percentage_change = 0.00;
  double _waste_percentage_affect = 0.00;

  double _television_previous_month = 0.00;
  double _television_this_month = 0.00;
  double _television_percentage_change = 0.00;
  double _television_percentage_affect = 0.00;

  String userName;

  Future<void> _updateTransport() async {
    var doc = await database
        .collection('users')
        .document(user.email_id)
        .collection('activities')
        .document('Personal Vehicle')
        .get();

    setState(() {
      _transport_previous_month =
          doc['totalCarbonEmissionLastMonth'].toDouble();
      _transport_this_month = doc['totalCarbonEmissionThisMonth'].toDouble();

      _transport_percentage_change =
          _transport_this_month - _transport_previous_month;
      _transport_percentage_change /= _transport_previous_month;
      _transport_percentage_change *= 100;

      _transport_percentage_affect =
          _transport_this_month / _totalCarbonEmissionThisMonth;
      _transport_percentage_affect *= 100;
    });
  }

  Future<void> _updateLPG() async {
    var doc = await database
        .collection('users')
        .document(user.email_id)
        .collection('activities')
        .document('Natural Gas')
        .get();

    setState(() {
      _lpg_previous_month = doc['totalCarbonEmissionLastMonth'].toDouble();
      _lpg_this_month = doc['totalCarbonEmissionThisMonth'].toDouble();

      _lpg_percentage_change = _lpg_this_month - _lpg_previous_month;
      _lpg_percentage_change /= _lpg_previous_month;
      _lpg_percentage_change *= 100;

      _lpg_percentage_affect = _lpg_this_month / _totalCarbonEmissionThisMonth;
      _lpg_percentage_affect *= 100;
    });
  }

  Future<void> _updateElectricity() async {
    var doc = await database
        .collection('users')
        .document(user.email_id)
        .collection('activities')
        .document('Electricity')
        .get();

    setState(() {
      _electricity_previous_month =
          doc['totalCarbonEmissionLastMonth'].toDouble();
      _electricity_this_month = doc['totalCarbonEmissionThisMonth'].toDouble();

      _electricity_percentage_change =
          _electricity_this_month - _electricity_previous_month;
      _electricity_percentage_change /= _electricity_previous_month;
      _electricity_percentage_change *= 100;

      _electricity_percentage_affect =
          _electricity_this_month / _totalCarbonEmissionThisMonth;
      _electricity_percentage_affect *= 100;
    });
  }

  Future<void> _updateHomeAppliances() async {
    var doc = await database
        .collection('users')
        .document(user.email_id)
        .collection('activities')
        .document('Home Appliances')
        .get();

    setState(() {
      _homeApp_previous_month = doc['totalCarbonEmissionLastMonth'].toDouble();
      _homeApp_this_month = doc['totalCarbonEmissionThisMonth'].toDouble();

      _homeApp_percentage_change =
          _homeApp_this_month - _homeApp_previous_month;
      _homeApp_percentage_change /= _homeApp_previous_month;
      _homeApp_percentage_change *= 100;

      _homeApp_percentage_affect =
          _homeApp_this_month / _totalCarbonEmissionThisMonth;
      _homeApp_percentage_affect *= 100;
    });
  }

  Future<void> _updateWaste() async {
    var doc = await database
        .collection('users')
        .document(user.email_id)
        .collection('activities')
        .document('Waste')
        .get();

    _waste_previous_month = doc['totalCarbonEmissionLastMonth'].toDouble();
    _waste_this_month = doc['totalCarbonEmissionThisMonth'].toDouble();

    _waste_percentage_change = _waste_this_month - _waste_previous_month;
    _waste_percentage_change /= _waste_previous_month;
    _waste_percentage_change *= 100;

    _waste_percentage_affect =
        _waste_this_month / _totalCarbonEmissionThisMonth;
    _waste_percentage_affect *= 100;
  }

  Future<void> _updateTelevision() async {
    var doc = await database
        .collection('users')
        .document(user.email_id)
        .collection('activities')
        .document('Television')
        .get();

    setState(() {
      _television_previous_month =
          doc['totalCarbonEmissionLastMonth'].toDouble();
      _television_this_month = doc['totalCarbonEmissionThisMonth'].toDouble();
      _television_percentage_change =
          (_television_this_month - _television_previous_month);
      _television_percentage_change /= _television_previous_month;
      _television_percentage_change *= 100;
      _television_percentage_affect =
          _television_this_month / _totalCarbonEmissionThisMonth;
      _television_percentage_affect *= 100;
    });
  }

  @override
  void initState() {
    super.initState();
    user = Provider.of<User>(context, listen: false);
    _updateTransport();
    _updateLPG();
    _updateElectricity();
    _updateHomeAppliances();
    _updateTelevision();
    _updateWaste();
  }

  @override
  Widget build(BuildContext context) {
    _totalCarbonEmissionThisMonth = user.total_carbon_emission_this_month;
    _totalCarbonEmissionLastMonth = user.total_carbon_emission_last_month;
    _totalCarbonEmissionChange =
        (_totalCarbonEmissionThisMonth - _totalCarbonEmissionLastMonth);
    _totalCarbonEmissionChange /= _totalCarbonEmissionLastMonth;
    _totalCarbonEmissionChange *= 100;

    userName = user.name;
    if (userName == null) {
      userName = "Test";
    }
    if (userName.length > 18) {
      userName = userName.substring(0, 18) + "...";
    }

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: _width * 0.1, right: _width * 0.1, top: _height * 0.06),
            child: Row(
              children: [
                Text(
                  userName,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Profile.routeName),
                  child: Icon(
                    Icons.account_circle_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: _width * 0.1),
              child: Text("See Your Carbon FootPrint Here\n",
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
            ),
          ),
          SizedBox(
            height: _height * 0.04,
          ),
          Container(
            width: _width,
            height: _height * 1.05,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: new BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Colors.white),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: _width * 0, right: _width * 0.04),
                  child:
                      DataTable(columnSpacing: _width * 0.06, columns: const <
                          DataColumn>[
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
                        DataCell(
                            Text(_transport_this_month.toStringAsFixed(1))),
                        DataCell(
                            Text(_transport_previous_month.toStringAsFixed(1))),
                        DataCell(Text(
                            _transport_percentage_change.toStringAsFixed(1) +
                                "%",
                            style: TextStyle(
                                color: (_transport_this_month >
                                        _transport_previous_month
                                    ? Colors.red
                                    : Colors.green)))),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('LPG')),
                        DataCell(Text(_lpg_this_month.toStringAsFixed(1))),
                        DataCell(Text(_lpg_previous_month.toStringAsFixed(1))),
                        DataCell(Text(
                            _lpg_percentage_change.toStringAsFixed(1) + "%",
                            style: TextStyle(
                                color: _lpg_this_month > _lpg_previous_month
                                    ? Colors.red
                                    : Colors.green)))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Electricity')),
                        DataCell(
                            Text(_electricity_this_month.toStringAsFixed(1))),
                        DataCell(Text(
                            _electricity_previous_month.toStringAsFixed(1))),
                        DataCell(Text(
                          _electricity_percentage_change.toStringAsFixed(1) +
                              "%",
                          style: TextStyle(
                              color: _electricity_this_month >
                                      _electricity_previous_month
                                  ? Colors.red
                                  : Colors.green),
                        ))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Home Appliances')),
                        DataCell(Text(_homeApp_this_month.toStringAsFixed(1))),
                        DataCell(
                            Text(_homeApp_previous_month.toStringAsFixed(1))),
                        DataCell(Text(
                            _homeApp_percentage_change.toStringAsFixed(1) + "%",
                            style: TextStyle(
                                color: _homeApp_this_month >
                                        _homeApp_previous_month
                                    ? Colors.red
                                    : Colors.green)))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Television')),
                        DataCell(
                            Text(_television_this_month.toStringAsFixed(1))),
                        DataCell(Text(
                            _television_previous_month.toStringAsFixed(1))),
                        DataCell(Text(
                            _television_percentage_change.toStringAsFixed(1) +
                                "%",
                            style: TextStyle(
                                color: _television_this_month >
                                        _television_previous_month
                                    ? Colors.red
                                    : Colors.green)))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Waste')),
                        DataCell(Text(_waste_this_month.toStringAsFixed(1))),
                        DataCell(
                            Text(_waste_previous_month.toStringAsFixed(1))),
                        DataCell(Text(
                            _waste_percentage_change.toStringAsFixed(1) + "%",
                            style: TextStyle(
                                color: _waste_this_month > _waste_previous_month
                                    ? Colors.red
                                    : Colors.green)))
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                          'Total FootPrint',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        DataCell(Text(
                            _totalCarbonEmissionThisMonth.toStringAsFixed(1),
                            style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Text(
                            _totalCarbonEmissionLastMonth.toStringAsFixed(1),
                            style: TextStyle(fontWeight: FontWeight.bold))),
                        DataCell(Text(
                            _totalCarbonEmissionChange.toStringAsFixed(1) + '%',
                            style: TextStyle(
                                color: _totalCarbonEmissionThisMonth >
                                        _totalCarbonEmissionLastMonth
                                    ? Colors.red
                                    : Colors.green,
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
              value: _transport_percentage_affect,
              title: _transport_percentage_affect.toStringAsFixed(1) + "%",
              radius: 50,
              titleStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black));
          break;
        case 1:
          return PieChartSectionData(
              color: Colors.green[300],
              value: _lpg_percentage_affect,
              title: _lpg_percentage_affect.toStringAsFixed(1) + "%",
              radius: 50,
              titleStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black));
          break;
        case 2:
          return PieChartSectionData(
            color: Colors.blue[400],
            value: _electricity_percentage_affect,
            title: _electricity_percentage_affect.toStringAsFixed(1) + "%",
            radius: 50,
            titleStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          );
          break;
        case 3:
          return PieChartSectionData(
            color: Colors.amber,
            value: _homeApp_percentage_affect,
            title: _homeApp_percentage_affect.toStringAsFixed(1) + "%",
            radius: 50,
            titleStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          );
          break;
        case 4:
          return PieChartSectionData(
            color: Colors.blue[50],
            value: _television_percentage_affect,
            title: _television_percentage_affect.toStringAsFixed(1) + "%",
            radius: 50,
            titleStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          );
          break;
        case 5:
          return PieChartSectionData(
            color: Colors.orange,
            value: _waste_percentage_affect,
            title: _waste_percentage_affect.toStringAsFixed(1) + "%",
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
