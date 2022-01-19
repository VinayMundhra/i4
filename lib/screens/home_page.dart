import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i4_consulting_app/models/json_file.dart';
import 'package:i4_consulting_app/widget/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final collectionJson =
        await rootBundle.loadString('assets/files/collection.json');
    final decodeData = jsonDecode(collectionJson);
    //var productData = decodeData['info'];
    final List<dynamic> productData1 = decodeData['item'] as List<dynamic>;
    CatalogModel.item = List<dynamic>.from(productData1)
        .map<Item>(
            (dynamic data) => Item.fromJson((data as Map<String, dynamic>)))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: CatalogModel.item!.length,
            itemBuilder: (ctx, index) {
              return ItemWidget(item: CatalogModel.item![index]);
            }),
      ),
     drawer: const Drawer(),
    );
  }
}
