import 'package:flutter/material.dart';
import 'models/client_model.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
// Initial Selected Value
  String monthValue = 'Ιανουάριος';
  String yearValue = '2023';
  // List of items in our dropdown menu
  var months = [
    'Ιανουάριος',
    'Φεβρουάριος',
    'Μάρτιος',
    'Απρίλιος',
    'Μαίος',
    'Ιούνιος',
    'Ιούλιος',
    'Αύγουστος',
    'Σεπτέμβριος',
    'Οκτώβριος',
    'Νοέμβριος',
    'Δεκέμβριος',
  ];

  var years = [
    '2022',
    '2023',
    '2024'
  ];
  List<ClientModel> clients = [];


  @override
  void initState() {
    super.initState();
    print("initState");
  }


  @override
  Widget build(BuildContext context) {
    var headerRow = const TableRow(
      children: [
        TableCell(child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Θεραπευόμενος"),
        )),
        TableCell(child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Αριθμός Συνεδριών"),
        )),
        TableCell(child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Χρεώθηκαν"),
        )),
        TableCell(child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Ξεπληρώθηκαν"),
        )),
        TableCell(child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Νόμισμα"),
        )),
      ]
    );

    var clientsRows = clients.map((client) {
      int sessionNum = client.sessions.length;
      double totalCharged = 0.0;
      double totalPaid = 0.0;
      client.sessions.map((e) {
        totalCharged += e.cost;
        totalPaid += e.cost;
      });
      return  TableRow(
          children: [
            TableCell(child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("${client.lastName} ${client.firstName}"),
            )),
            TableCell(child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("$sessionNum"),
            )),
            TableCell(child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("$totalCharged"),
            )),
            TableCell(child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("$totalPaid"),
            )),
            TableCell(child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(client.preferredCurrency),
            ))
          ]
      );
    }).toList();

    List<TableRow> tableRows = [];
    tableRows.add(headerRow);
    tableRows.addAll(clientsRows);

    return Center(
      child: Column(
        children: [
          const Text("Καλωσήρθες Αναστασία"),
          const SizedBox(height: 20),
          const Text("Έλεγχος Εσόδων"),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                value: monthValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: months.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() { monthValue = newValue!; });
                },
              ),

              const SizedBox(width: 20,),

              DropdownButton(
                value: yearValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: years.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() { yearValue = newValue!; });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Table(
              border: TableBorder.all(),
              columnWidths: const <int, TableColumnWidth>{
                0: FlexColumnWidth(),
                1: IntrinsicColumnWidth(),
                2: IntrinsicColumnWidth(),
                3: IntrinsicColumnWidth(),
                4: IntrinsicColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: tableRows
            ),
          )
        ],
      ),
    );
  }
}