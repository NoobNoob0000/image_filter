import 'dart:convert';
import 'package:image_filter/constants/index.dart';
import 'package:image_filter/data/index.dart';
import 'package:http/http.dart' as http;

class ImageRepository implements Repository {
  @override
  Future<List<ImageModel>> getImages(String topic) async {
    final images = <ImageModel>[];
    var url = Constants.NASA_API;
    url += '$topic&page=1&page_size=20';

    final uri = Uri.parse(url);

    final response = await http.get(uri);
    //Giải mã kết quả json trả về
    final jsonMap = json.decode(response.body) as Map<String, dynamic>;
    //=> Lấy list data
    final data = jsonMap['collection']['items'] as List;
    //Lặp tất cả phần tử trong list data => List<Course> => courses
    for (var json in data) {
      if (json != null) {
        final image = ImageModel.fromJson(json);

        if (image.url != null) {
          images.add(image);
        }
      }
    }

    return images;
  }
}
