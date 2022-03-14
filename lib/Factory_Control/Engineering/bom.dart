import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:xenoptics/Login/API.dart';
import 'package:http/http.dart' as http;
import 'package:xenoptics/Search/BomList.dart';

class BOM {
  String? description;
  String? eventTime;
  String? materialCode;
  int? materialTypeID;
  String? partNo;
  String? partRevision;
  String? remark;
  int? revision;
  String? sku;
  String? substitute;
  int? supplierID;
  String? supplierName;
  String? typeName;
  String? unit;
  int? userID;
  String? username;

  BOM(
      {this.description,
      this.eventTime,
      this.materialCode,
      this.materialTypeID,
      this.partNo,
      this.partRevision,
      this.remark,
      this.revision,
      this.sku,
      this.substitute,
      this.supplierID,
      this.supplierName,
      this.typeName,
      this.unit,
      this.userID,
      this.username});

  BOM.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    eventTime = json['event_time'];
    materialCode = json['material_code'];
    materialTypeID = json['material_typeID'];
    partNo = json['part_no'];
    partRevision = json['part_revision'];
    remark = json['remark'];
    revision = json['revision'];
    sku = json['sku'];
    substitute = json['substitute'];
    supplierID = json['supplierID'];
    supplierName = json['supplier_name'];
    typeName = json['type_name'];
    unit = json['unit'];
    userID = json['userID'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['event_time'] = this.eventTime;
    data['material_code'] = this.materialCode;
    data['material_typeID'] = this.materialTypeID;
    data['part_no'] = this.partNo;
    data['part_revision'] = this.partRevision;
    data['remark'] = this.remark;
    data['revision'] = this.revision;
    data['sku'] = this.sku;
    data['substitute'] = this.substitute;
    data['supplierID'] = this.supplierID;
    data['supplier_name'] = this.supplierName;
    data['type_name'] = this.typeName;
    data['unit'] = this.unit;
    data['userID'] = this.userID;
    data['username'] = this.username;
    return data;
  }
}


Future<List<BOM>> fetchBomList() async {
  final userToken = await Auth().getUserToken();
  final response = await http
      .get(Uri.parse('http://xendb/api/mfg/material/listBom'), headers: {
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
    List<BOM> materialdata =
        await parsed2.map<BOM>((json) => BOM.fromJson(json)).toList();

    return materialdata;
  } else {
    throw Exception('Failed to load Data.');
  }
}

Future<ProductDataGridSource> getBomList(String query) async {
  var productList = await fetchBomList();
  // ignore: unnecessary_null_comparison
  if (query != null) {
    productList = productList.where((element) {
      final _materialcode = element.materialCode!.toLowerCase();
      final _partno = element.partNo!.toLowerCase();
      final _search = query.toLowerCase();
      return _materialcode.contains(_search) || _partno.contains(_search);
    }).toList();
  }
  return ProductDataGridSource(productList);
}

List<GridColumn> getColumns() {
  return <GridColumn>[
    GridColumn(
        columnName: 'Material Code',
        width: 130,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          color: Colors.grey[300],
          child: const Text(
            'Material Code',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Material Type',
        width: 150,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Material Type',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Description',
        width: 350,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Description',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'SKU',
        width: 350,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'SKU',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Part No',
        width: 130,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Part No',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Part Revision',
        width: 130,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Part Revision',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )), 
        GridColumn(
        columnName: 'Revision',
        width: 130,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Revision',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )), 
    GridColumn(
        columnName: 'Supplier',
        width: 180,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Supplier',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
  ];
}
class bom extends StatefulWidget {
  //const bom({ Key? key }) : super(key: key);

  @override
  _bomState createState() => _bomState();
}

class _bomState extends State<bom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'BOM List',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: searchBomList());
                },
                icon: const Icon(Icons.search))
          ],
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
         body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getBomList(''),
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
  late List<BOM> productList;

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
      Container(
        child: Text(
          row.getCells()[5].value.toString(),
          overflow: TextOverflow.fade,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[6].value.toString(),
          overflow: TextOverflow.fade,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[7].value.toString(),
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
            columnName: 'Material Code', value: dataGridRow.materialCode),
        DataGridCell(columnName: 'Material Type', value: dataGridRow.typeName),
        DataGridCell(columnName: 'Description', value: dataGridRow.description),
        DataGridCell(columnName: 'SKU', value: dataGridRow.sku),
        DataGridCell(columnName: 'Part No', value: dataGridRow.partNo),
        DataGridCell(
            columnName: 'Part Revision', value: dataGridRow.partRevision),
        DataGridCell(columnName: 'Revision', value: dataGridRow.revision),
        DataGridCell(columnName: 'Supplier', value: dataGridRow.supplierName)
      ]);
    }).toList();
  }
}