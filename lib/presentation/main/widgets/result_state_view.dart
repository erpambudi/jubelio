import 'package:flutter/material.dart';
import 'package:jubelio/common/constants/app_values.dart';
import 'package:jubelio/common/styles/app_text_styles.dart';

class ResultStateView extends StatelessWidget {
  final String image;
  final String message;

  const ResultStateView(
    this.image,
    this.message, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: AppValues.margin_40,
          ),
          Image.asset(
            image,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: AppValues.margin_20,
          ),
          Text(
            message,
            style: AppTextStyle.title.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: AppValues.margin_40,
          ),
        ],
      ),
    );
  }
}
