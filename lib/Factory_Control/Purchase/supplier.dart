import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:xenoptics/Login/API.dart';
import 'package:xenoptics/Search/searchSupplier.dart';
class Supplier {
  bool? active;
  String? email;
  String? eventTime;
  String? phone;
  String? remark;
  int? supplierID;
  String? supplierCode;
  String? supplierName;
  int? userID;

  Supplier(
      {this.active,
      this.email,
      this.eventTime,
      this.phone,
      this.remark,
      this.supplierID,
      this.supplierCode,
      this.supplierName,
      this.userID});

  Supplier.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    email = json['email'];
    eventTime = json['event_time'];
    phone = json['phone'];
    remark = json['remark'];
    supplierID = json['supplierID'];
    supplierCode = json['supplier_code'];
    supplierName = json['supplier_name'];
    userID = json['userID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['email'] = this.email;
    data['event_time'] = this.eventTime;
    data['phone'] = this.phone;
    data['remark'] = this.remark;
    data['supplierID'] = this.supplierID;
    data['supplier_code'] = this.supplierCode;
    data['supplier_name'] = this.supplierName;
    data['userID'] = this.userID;
    return data;
  }
}


Future<List<Supplier>> fetchSupplier() async {
  final userToken = await Auth().getUserToken();
  final response = await http
      .get(Uri.parse('http://xendb/api/mfg/material/listSupplier'), headers: {
    'device': 'b5e28aaf1ace115bd521bea1fd26ced3',
    'token': userToken
  });

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final parsed2 = data['data'].cast<Map<String, dynamic>>();

    //return MdataList.map<Mdata>((json) => Mdata.fromJson(json)).toList();
    // List<Mdata> temp = (parsed['data'] as List)
    //     .map((itemWord) => Mdata.fromJson(itemWord))
    //     .toList();
    List<Supplier> materialdata =
        await parsed2.map<Supplier>((json) => Supplier.fromJson(json)).toList();

    return materialdata;
  } else {
    throw Exception('Failed to load Data.');
  }
}

Future<ProductDataGridSource> getSupplier(String query) async {
  var productList = await fetchSupplier();
  // ignore: unnecessary_null_comparison
  if (query != null) {
    productList = productList.where((element) {
      final _materialcode = element.supplierCode!.toLowerCase();
      final _partno = element.supplierName!.toLowerCase();
      final _search = query.toLowerCase();
      return _materialcode.contains(_search) || _partno.contains(_search);
    }).toList();
  }
  return ProductDataGridSource(productList);
}

List<GridColumn> getColumns() {
  return <GridColumn>[
    GridColumn(
        columnName: 'Supplier Code',
        width: 130,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          color: Colors.grey[300],
          child: const Text(
            'Supplier Code',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Supplier Name',
        width: 190,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Supplier Name',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Phone',
        width: 130,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Phone',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Email',
        width: 150,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Email',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Remark',
        width: 290,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Remark',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
  ];
}
class supplier extends StatefulWidget {
  //const supplier({ Key? key }) : super(key: key);

  @override
  _supplierState createState() => _supplierState();
}

class _supplierState extends State<supplier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Supplier',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: searchSupplier());
                },
                icon: const Icon(Icons.search))
          ],
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
      body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getSupplier(''),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return snapshot.hasData
                      ? SfDataGrid(
                          source: snapshot.data,
                          columns: getColumns(),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ],
        )
    );
  }
}

class ProductDataGridSource extends DataGridSource {
  ProductDataGridSource(this.productList) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<Supplier> productList;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    //MainAxisSize.min;

    return DataGridRowAdapter(cells: [
      Container(
          child: Text(
            row.getCells()[0].value.toString(),
            overflow: TextOverflow.fade,
          ),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.all(8.0)),
      Container(
        child: Text(
          row.getCells()[1].value.toString(),
          overflow: TextOverflow.fade,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[2].value.toString(),
          overflow: TextOverflow.fade,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[3].value.toString(),
          overflow: TextOverflow.fade,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[4].value.toString(),
          overflow: TextOverflow.fade,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  void buildDataGridRow() {
    dataGridRows = productList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell(
            columnName: 'Material Code', value: dataGridRow.supplierCode),
        DataGridCell(columnName: 'Material Type', value: dataGridRow.supplierName),
        DataGridCell(columnName: 'Description', value: dataGridRow.phone),
        DataGridCell(columnName: 'SKU', value: dataGridRow.email),
        DataGridCell(columnName: 'Part No', value: dataGridRow.remark),
      ]);
    }).toList();
  }
}