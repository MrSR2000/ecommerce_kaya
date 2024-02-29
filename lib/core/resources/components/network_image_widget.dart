import 'package:flutter/material.dart';

enum ImageLoadingType {
  circularLoading,
  shimmerLoading,
}

Widget networkImageWidget({
  required String imageUrl,
  double? height,
  double width = double.infinity,
  BoxFit boxFit = BoxFit.contain,
  double borderRadius = 8,
  ImageLoadingType imageLoadingType = ImageLoadingType.shimmerLoading,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.network(
        imageUrl,
        fit: boxFit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          } else {
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          }
        },
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Icon(Icons.error),
          );
        },
      ),
    ),
  );
}
