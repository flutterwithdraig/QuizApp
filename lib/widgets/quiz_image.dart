import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class QuizImage extends StatelessWidget {
  const QuizImage({
    Key? key,
    required this.url,
    this.width = 70,
    this.height = 60,
  }) : super(key: key);

  final String url;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return url.isNotEmpty
        ? CachedNetworkImage(
            imageUrl: url,
            height: height,
            width: width,
            fit: BoxFit.cover,
            placeholder: (context, url) => Image.asset(
              'assets/question.jpg',
              fit: BoxFit.cover,
            ),
            errorWidget: (context, url, error) => Image.asset(
              'assets/question.jpg',
              fit: BoxFit.cover,
            ),
          )
        : Image.asset(
            'assets/question.jpg',
            fit: BoxFit.cover,
            width: height,
            height: width,
          );
  }
}
