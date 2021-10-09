import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CampPage extends ConsumerWidget {
  const CampPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    return Container(
      child: Center(child: Text('camp')),
    );
  }
}
