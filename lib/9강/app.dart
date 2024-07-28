import 'package:bloc_study/9%EA%B0%95/components/buy_btn.dart';
import 'package:bloc_study/9%EA%B0%95/components/lock_widget.dart';
import 'package:bloc_study/9%EA%B0%95/components/products_widget.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bloc to comunication'),
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _DefaultItem(),
          SizedBox(height: 50),
          _PayItems(),
        ],
      ),
      bottomNavigationBar: BuyBtn(onTap: () {}),
    );
  }
}

class _DefaultItem extends StatelessWidget {
  const _DefaultItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, top: 20),
          child: Text(
            '기본 권한 아이템',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        const SizedBox(height: 20),
        ProductsWidget(
          item: List.generate(
            10,
            (index) => index.toString(),
          ),
        ),
      ],
    );
  }
}

class _PayItems extends StatelessWidget {
  const _PayItems({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text(
            '유료 권한 아이템',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        SizedBox(height: 20),
        LockWidget(),
      ],
    );
  }
}
