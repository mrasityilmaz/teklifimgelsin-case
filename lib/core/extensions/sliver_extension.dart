import 'package:flutter/material.dart';

extension SliverExtension on Widget {
  SliverToBoxAdapter get wrapInSliverToBoxAdapter {
    return SliverToBoxAdapter(
      child: this,
    );
  }
}
