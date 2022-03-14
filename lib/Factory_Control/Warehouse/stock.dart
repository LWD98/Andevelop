import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:xenoptics/Login/API.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:xenoptics/Search/searchStock.dart';

class stock extends StatefulWidget {
  //const stock({ Key? key }) : super(key: key);

  @override
  _stockState createState() => _stockState();
}

class Stock {
  String? addDate;
  String? description;
  String? lastUpdate;
  int? locationID;
  String? locationName;
  String? materialCode;
  String? materialLotName;
  int? materialLotNo;
  int? materialStockID;
  int? materialTypeID;
  String? partNo;
  String? partRevision;
  int? qtyReserve;
  int? qtyShelf;
  int? revision;
  String? safetyStock;
  String? sku;
  int? subLocationID;
  int? subLocationIndex;
  String? subLocationName;
  String? substitute;
  int? supplierID;
  String? supplierName;
  String? typeName;
  String? unit;

  Stock(
      {this.addDate,
      this.description,
      this.lastUpdate,
      this.locationID,
      this.locationName,
      this.materialCode,
      this.materialLotName,
      this.materialLotNo,
      this.materialStockID,
      this.materialTypeID,
      this.partNo,
      this.partRevision,
      this.qtyReserve,
      this.qtyShelf,
      this.revision,
      this.safetyStock,
      this.sku,
      this.subLocationID,
      this.subLocationIndex,
      this.subLocationName,
      this.substitute,
      this.supplierID,
      this.supplierName,
      this.typeName,
      this.unit});

  Stock.fromJson(Map<String, dynamic> json) {
    addDate = json['add_date'];
    description = json['description'];
    lastUpdate = json['last_update'];
    locationID = json['locationID'];
    locationName = json['location_name'];
    materialCode = json['material_code'];
    materialLotName = json['material_lot_name'];
    materialLotNo = json['material_lot_no'];
    materialStockID = json['material_stockID'];
    materialTypeID = json['material_typeID'];
    partNo = json['part_no'];
    partRevision = json['part_revision'];
    qtyReserve = json['qty_reserve'];
    qtyShelf = json['qty_shelf'];
    revision = json['revision'];
    safetyStock = json['safety_stock'];
    sku = json['sku'];
    subLocationID = json['sub_locationID'];
    subLocationIndex = json['sub_location_index'];
    subLocationName = json['sub_location_name'];
    substitute = json['substitute'];
    supplierID = json['supplierID'];
    supplierName = json['supplier_name'];
    typeName = json['type_name'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['add_date'] = this.addDate;
    data['description'] = this.description;
    data['last_update'] = this.lastUpdate;
    data['locationID'] = this.locationID;
    data['location_name'] = this.locationName;
    data['material_code'] = this.materialCode;
    data['material_lot_name'] = this.materialLotName;
    data['material_lot_no'] = this.materialLotNo;
    data['material_stockID'] = this.materialStockID;
    data['material_typeID'] = this.materialTypeID;
    data['part_no'] = this.partNo;
    data['part_revision'] = this.partRevision;
    data['qty_reserve'] = this.qtyReserve;
    data['qty_shelf'] = this.qtyShelf;
    data['revision'] = this.revision;
    data['safety_stock'] = this.safetyStock;
    data['sku'] = this.sku;
    data['sub_locationID'] = this.subLocationID;
    data['sub_location_index'] = this.subLocationIndex;
    data['sub_location_name'] = this.subLocationName;
    data['substitute'] = this.substitute;
    data['supplierID'] = this.supplierID;
    data['supplier_name'] = this.supplierName;
    data['type_name'] = this.typeName;
    data['unit'] = this.unit;
    return data;
  }
}

Future<List<Stock>> fetchStock(
    int combine, int locationID, String search, int sub_location_index) async {
  final userToken = await Auth().getUserToken();

  final response =
      await http.post(Uri.parse('http://xendb/api/mfg/material/stock'),
          body: jsonEncode(<String, dynamic>{
            'combine': combine,
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

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final parsed2 = data['data'].cast<Map<String, dynamic>>();
    List<Stock> stock =
        await parsed2.map<Stock>((json) => Stock.fromJson(json)).toList();

    return stock;
  } else {
    throw Exception('Fail to post');
  }
}

Future<ProductDataGridSource> getProdectDataGridSource2(String query) async {
  var productList = await fetchStock(1, 11, '', 5);
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
        columnName: 'Lot',
        width: 90,
        label: Container(
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Lot',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'LotName',
        width: 150,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'LotName',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'SKU',
        width: 390,
        label: Container(
          padding: const EdgeInsets.all(8),
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
        width: 290,
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
        columnName: 'Part Revision',
        width: 90,
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
        width: 90,
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
        columnName: 'Qty',
        width: 90,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Qty',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Unit',
        width: 120,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Unit',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Supplier',
        width: 150,
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
    GridColumn(
        columnName: 'Location',
        width: 180,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Location',
            overflow: TextOverflow.fade,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
  ];
}

class _stockState extends State<stock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'View Stock',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: StockSearch());
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
        ));
  }
}

class ProductDataGridSource extends DataGridSource {
  ProductDataGridSource(this.productList) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<Stock> productList;

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
      Container(
        child: Text(
          row.getCells()[8].value.toString(),
          overflow: TextOverflow.fade,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[9].value.toString(),
          overflow: TextOverflow.fade,
        ),
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(8.0),
      ),
      Container(
        child: Text(
          row.getCells()[10].value.toString(),
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
        DataGridCell(
            columnName: 'Material Type', value: dataGridRow.materialLotNo),
        DataGridCell(
            columnName: 'Description', value: dataGridRow.materialLotName),
        DataGridCell(columnName: 'SKU', value: dataGridRow.sku),
        DataGridCell(columnName: 'Part No', value: dataGridRow.partNo),
        DataGridCell(
            columnName: 'Part Revision', value: dataGridRow.partRevision),
        DataGridCell(columnName: 'Revision', value: dataGridRow.revision),
        DataGridCell(columnName: 'Supplier', value: dataGridRow.qtyShelf),
        DataGridCell(columnName: 'Supplier', value: dataGridRow.unit),
        DataGridCell(columnName: 'Supplier', value: dataGridRow.supplierName),
        DataGridCell(columnName: 'Supplier', value: dataGridRow.locationName)
      ]);
    }).toList();
  }
}
