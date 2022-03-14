import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:xenoptics/Login/API.dart';
import 'package:xenoptics/Search/ShortStock.dart';

class ShortStock {
  String? description;
  int? locationID;
  String? locationName;
  String? materialCode;
  int? materialTypeID;
  String? partNo;
  String? partRevision;
  int? qty;
  int? revision;
  String? safetyStock;
  String? sku;
  String? substitute;
  int? supplierID;
  String? supplierName;
  String? typeName;
  String? unit;


  ShortStock(
      {this.description,
      this.locationID,
      this.locationName,
      this.materialCode,
      this.materialTypeID,
      this.partNo,
      this.partRevision,
      this.qty,
      this.revision,
      this.safetyStock,
      this.sku,
      this.substitute,
      this.supplierID,
      this.supplierName,
      this.typeName,
      this.unit});

  ShortStock.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    locationID = json['locationID'];
    locationName = json['location_name'];
    materialCode = json['material_code'];
    materialTypeID = json['material_typeID'];
    partNo = json['part_no'];
    partRevision = json['part_revision'];
    qty = json['qty'];
    revision = json['revision'];
    safetyStock = json['safety_stock'];
    sku = json['sku'];
    substitute = json['substitute'];
    supplierID = json['supplierID'];
    supplierName = json['supplier_name'];
    typeName = json['type_name'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['locationID'] = this.locationID;
    data['location_name'] = this.locationName;
    data['material_code'] = this.materialCode;
    data['material_typeID'] = this.materialTypeID;
    data['part_no'] = this.partNo;
    data['part_revision'] = this.partRevision;
    data['qty'] = this.qty;
    data['revision'] = this.revision;
    data['safety_stock'] = this.safetyStock;
    data['sku'] = this.sku;
    data['substitute'] = this.substitute;
    data['supplierID'] = this.supplierID;
    data['supplier_name'] = this.supplierName;
    data['type_name'] = this.typeName;
    data['unit'] = this.unit;
    return data;
  }
}

Future <List<ShortStock>> FetchShortStock(int combine, int locationID, String search, int sub_location_index) async{
  final userToken = await Auth().getUserToken();
 
  final response = await http.post(Uri.parse('http://xendb/api/mfg/material/short_stock'),
     body: jsonEncode(<String, dynamic>{
            'combine' : combine,
            'locationID': locationID,
            'search': search,
            'sub_location_index': sub_location_index
                }),
        
      headers: {
          'Accept': 'application/json, text/plain, */*',
          "Content-Type": "application/json",
          'device': 'b5e28aaf1ace115bd521bea1fd26ced3',
          'token': userToken
        });   
  
  if(response.statusCode == 200){
    final data = json.decode(response.body);
    final parsed2 = data['data'].cast<Map<String, dynamic>>();

    //return MdataList.map<Mdata>((json) => Mdata.fromJson(json)).toList();
    // List<Mdata> temp = (parsed['data'] as List)
    //     .map((itemWord) => Mdata.fromJson(itemWord))
    //     .toList();
    List<ShortStock> short_stock =
        await parsed2.map<ShortStock>((json) => ShortStock.fromJson(json)).toList();

    return short_stock;
  }else{
    throw Exception('Fail to post');
  }
  
}

Future<ProductDataGridSource> getProdectDataGridSource2(String query) async {
  
  var productList = await FetchShortStock(1,13,'',1);
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
        columnName: 'MatCode',
        width: 130,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.center,
          color: Colors.grey[300],
          child: const Text(
            'MatCode',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'SKU',
        width: 410,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'SKU',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Part_No',
        width: 390,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Part_No',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Part_Revision',
        width: 100,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Part_Revision',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Revision',
        width: 90,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Revision',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Safety Stock',
        width: 100,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Safety Stock',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Qty',
        width: 90,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Qty',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Unit',
        width: 100,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Unit',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
        GridColumn(
        columnName: 'Supplier_Name',
        width: 190,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Supplier_Name',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
  ];
}
class shorts extends StatefulWidget {
  //const shorts({ Key? key }) : super(key: key);

  @override
  _shortsState createState() => _shortsState();
}

class _shortsState extends State<shorts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'View Short Stock',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: ShortStockSearch());
                },
                icon: const Icon(Icons.search))
          ],
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getProdectDataGridSource2(''),
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
  late List<ShortStock> productList;

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
          style: TextStyle(color: Colors.redAccent),
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
      Container(
        child: Text(
          row.getCells()[8].value.toString(),
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
        DataGridCell(columnName: 'Material Type', value: dataGridRow.sku),
        DataGridCell(columnName: 'Description', value: dataGridRow.partNo),
        DataGridCell(columnName: 'SKU', value: dataGridRow.partRevision),
        DataGridCell(columnName: 'Part No', value: dataGridRow.revision),
        DataGridCell(
            columnName: 'Part Revision', value: dataGridRow.safetyStock),
        DataGridCell(columnName: 'Revision', value: dataGridRow.qty),
        DataGridCell(columnName: 'Supplier', value: dataGridRow.unit),
               DataGridCell(columnName: 'Supplier', value: dataGridRow.supplierName)
      ]);
    }).toList();
  }
}