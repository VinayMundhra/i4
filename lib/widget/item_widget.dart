import 'package:flutter/material.dart';
import 'package:i4_consulting_app/models/json_file.dart';

class ItemWidget  extends StatelessWidget {
  final Item item;

  // ignore: sort_constructors_first
  const ItemWidget ({Key? key, required this.item})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: ListTile(
        onTap: (){},
        title: Text(item.response as String),
      ),
    );
  }
}