import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductsWidget extends StatelessWidget {
  const ProductsWidget({super.key, required this.item});
  final List<String> item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 100,
          height: 80,
          color: Colors.grey.withOpacity(0.5),
          child: Center(
            child: Text('item [${item[index]}]'),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 20,
        ),
        itemCount: item.length,
      ),
    );
  }
}
