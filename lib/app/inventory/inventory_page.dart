import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InventoryPage extends ConsumerWidget {
  const InventoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return Container(
      child: Center(
        child: Text('inventory'),
      ),
    );
  }
}
