import 'dart:convert';

import 'dart:js';

import 'package:flutter/material.dart';

import 'package:xenoptics/Factory_Control/Warehouse/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Materialsearch extends SearchDelegate<String> {
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
            future: getProdectDataGridSource(query),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return snapshot.hasData
                  ? SfDataGrid(
                      source: snapshot.data,
                      columns: getColumns(),
                    )
                  : Center(
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
