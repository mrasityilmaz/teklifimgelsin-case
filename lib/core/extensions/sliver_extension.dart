import 'package:flutter/material.dart';

extension SliverExtension on Widget {
  SliverToBoxAdapter wrapInSliverToBoxAdapter() {
    return SliverToBoxAdapter(
      child: this,
    );
  }
}
