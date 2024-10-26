import 'package:image_filter/data/index.dart';

class ImageController {
  ImageController(this._repository);
  //Sử dụng interface Repository => Giảm sự phụ thuộc vào tầng Repo
  final Repository _repository;

  Future<List<ImageModel>> fetchCourses(String topic) {
    return _repository.getImages(topic);
  }
}
