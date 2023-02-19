import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jubelio/common/constants/app_images.dart';
import 'package:shimmer/shimmer.dart';

class AppImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const AppImageNetwork(this.imageUrl,
      {super.key, this.height = 50, this.width = 50, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          color: Colors.white,
          height: height,
          width: width,
        ),
      ),
      errorWidget: (context, url, error) {
        return Image.asset(
          AppImages.emptyImage,
          height: height,
          width: width,
          fit: BoxFit.cover,
        );
      },
      fit: fit,
    );
  }
}
