import 'dart:convert';

import 'dart:js';

import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:xenoptics/Factory_Control/Warehouse/safetys.dart';

class SafetyStockSearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear)),
          
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
        
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getProdectDataGridSource1(query),
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
        );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      
      child: Text('Filter Material Code or Part No.'),
    );
  }
}
