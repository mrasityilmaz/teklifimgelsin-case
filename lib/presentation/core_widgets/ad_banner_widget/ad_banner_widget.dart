import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

@immutable
final class AdBannerWidget extends StatelessWidget {
  const AdBannerWidget({required this.imageUrl, super.key, this.redirectUrl, this.height, this.shape});
  final String imageUrl;
  final String? redirectUrl;
  final double? height;

  final Decoration? shape;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (redirectUrl != null) {
          // OpenUrlService().openUrl(redirectUrl!);
        }
      },
      child: Container(
        height: height,
        decoration: shape,
        child: CachedNetworkImage(imageUrl: imageUrl),
      ),
    );
  }
}
