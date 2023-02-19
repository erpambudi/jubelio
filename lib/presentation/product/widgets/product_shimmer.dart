import 'package:flutter/material.dart';
import 'package:jubelio/common/constants/app_values.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppValues.extraLargePadding,
              vertical: AppValues.padding,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppValues.halfPadding,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 12,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppValues.padding_4,
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 10,
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: AppValues.halfPadding,
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 8,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
