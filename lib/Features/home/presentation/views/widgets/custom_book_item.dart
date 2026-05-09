import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child:
          //   CachedNetworkImage(
          //     imageUrl: "http://via.placeholder.com/350x150",
          //     placeholder: (context, url) => CircularProgressIndicator(),
          //     errorWidget: (context, url, error) => Icon(Icons.error),
          //  ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.red,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(image),
                // AssetImage(AssetsData.testImage),
              ),
            ),
          ),
    );
  }
}
