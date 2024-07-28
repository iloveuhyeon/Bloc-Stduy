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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: 100,
          height: 80,
          color: Colors.grey.withOpacity(0.5),
          child: Center(
            child: Text('item [${item[index]}]'),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 5,
        ),
        itemCount: item.length,
      ),
    );
  }
}
