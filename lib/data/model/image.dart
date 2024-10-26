class ImageModel {
  final String imageId;
  final String title;
  final String? description;
  final String? url;
  final List<String>? keywords;

  ImageModel(
    this.imageId,
    this.title,
    this.description,
    this.url,
    this.keywords,
  );

  String get keywordsString => keywords!.join(', ');

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'][0];
    String imageId = json['data'][0]['nasa_id'];
    String title = json['data'][0]['title'];
    String description = json['data'][0]['description'];
    List<String>? keywords = data['keywords'] != null
        ? List<String>.from(
            data['keywords'].map((keyword) => keyword.toString()))
        : null;
    final String href = json['links'][0]['href'];
    String? imageUrl;

    if (href.contains('/image/')) {
      imageUrl = href;
    }

    return ImageModel(imageId, title, description, imageUrl, keywords);
  }
}
