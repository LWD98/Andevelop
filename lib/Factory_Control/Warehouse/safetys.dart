import 'dart:convert';
import 'package:collection/src/iterable_extensions.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:xenoptics/Factory_Control/Warehouse/material.dart';
import 'package:xenoptics/Login/API.dart';
import 'package:xenoptics/Search/SafetyStock.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

Future<Mdata> postData(String safetyStock, String materialCode) async {
  final userID = await Auth().getUserID();
  final userToken = await Auth().getUserToken();
  final response =
      await http.post(Uri.parse('http://xendb/api/mfg/material/safety_stock'),
          body: jsonEncode(<String, dynamic>{
            'material_list': json.decode(jsonEncode(<String, dynamic>{
              'material_code': materialCode,
              'safety_stock': safetyStock,
              'userID': userID
            }))
          }),
          headers: {
        'Accept': 'application/json, text/plain, */*',
        "Content-Type": "application/json",
        'device': 'b5e28aaf1ace115bd521bea1fd26ced3',
        'token': userToken
      });
  if (response.statusCode == 200) {
    return Mdata.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Fail to post');
  }
}

class safetys extends StatefulWidget {
  //const safetys({ Key? key }) : super(key: key);

  @override
  _safetysState createState() => _safetysState();
}

Future<ProductDataGridSource1> getProdectDataGridSource1(String query) async {
  var productList = await fetchMdata();
  // ignore: unnecessary_null_comparison
  if (query != null) {
    productList = productList.where((element) {
      final _materialcode = element.materialCode!.toLowerCase();
      final _partno = element.partNo!.toLowerCase();
      final _search = query.toLowerCase();
      return _materialcode.contains(_search) || _partno.contains(_search);
    }).toList();
  }
  return ProductDataGridSource1(productList);
}

List<GridColumn> getColumns() {
  return <GridColumn>[
    GridColumn(
        columnName: 'Material Code',
        width: 130,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          color: Colors.grey[300],
          child: const Text(
            'Material Code',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'SKU',
        width: 290,
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
        columnName: 'Part No',
        width: 280,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Part No',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Part Revision',
        width: 180,
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
        columnName: 'Supplier',
        width: 260,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Supplier',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
    GridColumn(
        columnName: 'Safety Stock',
        width: 200,
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
        columnName: 'Last Update',
        width: 300,
        label: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          color: Colors.grey[300],
          child: const Text(
            'Last Update',
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),

  ];
}

class _safetysState extends State<safetys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[100],
          title: Text(
            'Safety Stock Management',
            style:
                TextStyle(color: Colors.grey[900], fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: SafetyStockSearch());
                },
                icon: const Icon(Icons.search))
          ],
          iconTheme: IconThemeData(color: Colors.grey[900]),
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getProdectDataGridSource1(''),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return snapshot.hasData
                      ? SfDataGrid(
                          source: snapshot.data,
                          allowEditing: true,
                          selectionMode: SelectionMode.single,
                          navigationMode: GridNavigationMode.cell,
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

class ProductDataGridSource1 extends DataGridSource {
  dynamic newCellValue;
  TextEditingController editingController = TextEditingController();
  ProductDataGridSource1(this.productList) {
    buildDataGridRow();
  }
  late List<DataGridRow> dataGridRows;
  late List<Mdata> productList;

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
    ]);
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  void onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex,
      GridColumn column) {
    // TODO: implement onCellSubmit
    final dynamic oldValue = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value ??
        '';
    final int dataRowIndex = dataGridRows.indexOf(dataGridRow);
    if (newCellValue == null || oldValue == newCellValue) {
      return;
    }
    if (column.columnName == 'Safety Stock') {
      dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
          DataGridCell<String>(columnName: 'Safety Stock', value: newCellValue);
      productList[dataRowIndex].safetyStock = newCellValue.toString();
      postData(productList[dataRowIndex].safetyStock as String,
          productList[dataRowIndex].materialCode as String);
    }
    //super.onCellSubmit(dataGridRow, rowColumnIndex, column);
  }

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow,
      RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) {
    final String displayText = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value
            ?.toString() ??
        '';
    newCellValue = null;
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      child: TextField(
        autofocus: true,
        controller: editingController..text = displayText,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 16.0),
        ),
        keyboardType: TextInputType.text,
        onChanged: (String value) {
          newCellValue = value;
        },
        onSubmitted: (String value) {
          submitCell();
        },
      ),
    );
  }

  void buildDataGridRow() {
    dataGridRows = productList.map<DataGridRow>((dataGridRow) {
      return DataGridRow(cells: [
        DataGridCell(
            columnName: 'Material Code', value: dataGridRow.materialCode),
        DataGridCell(columnName: 'SKU', value: dataGridRow.sku),
        DataGridCell(columnName: 'Part No', value: dataGridRow.partNo),
        DataGridCell(
            columnName: 'Part Revision', value: dataGridRow.partRevision),
        DataGridCell(columnName: 'Supplier', value: dataGridRow.supplierName),
        DataGridCell(
            columnName: 'Safety Stock', value: dataGridRow.safetyStock),
        DataGridCell(columnName: 'Last Update', value: dataGridRow.lastUpdate),
      ]);
    }).toList();
  }
}
