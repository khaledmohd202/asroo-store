import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({required this.categoryInfo, super.key});

  final ({String categoryName, int categoryId}) categoryInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryInfo.categoryName),
      ),
      body: Center(
        child: Text('Category ID: ${categoryInfo.categoryId}'),
      ),
    );
  }
}
