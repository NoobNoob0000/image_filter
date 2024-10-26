import 'package:flutter/material.dart';
import 'package:image_filter/data/index.dart';

class ImageDetail extends StatelessWidget {
  const ImageDetail({super.key, required this.image});
  final ImageModel image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(image.title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBanner(context),
            _buildMain(context),
            _buildDetail(context),
          ],
        ));
  }

  Widget _buildBanner(BuildContext context) {
    return Hero(
      tag: 'card_art_work_${image.imageId}',
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          // ignore: unnecessary_null_comparison
          image: DecorationImage(image: NetworkImage(image.url!)),
        ),
      ),
    );
  }

  Widget _buildMain(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            image.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            image.description ?? '',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.black54,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Keywords: ${image.keywordsString}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
