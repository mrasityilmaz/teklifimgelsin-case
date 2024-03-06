import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

@immutable
final class AdBannerWidget extends StatelessWidget {
  const AdBannerWidget({required this.imageUrl, super.key, this.redirectUrl, this.height, this.borderRadius = BorderRadius.zero, this.padding = EdgeInsets.zero, this.border = const Border()});
  final String imageUrl;
  final String? redirectUrl;
  final double? height;

  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;
  final BoxBorder border;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: border,
      ),
      child: GestureDetector(
        onTap: () {
          if (redirectUrl != null) {
            // OpenUrlService().openUrl(redirectUrl!);
          }
        },
        child: ClipRRect(
          borderRadius: borderRadius * .85,
          child: SizedBox(
            height: height,
            child: CachedNetworkImage(imageUrl: imageUrl),
          ),
        ),
      ),
    );
  }
}
