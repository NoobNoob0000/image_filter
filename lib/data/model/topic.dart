import 'package:image_filter/constants/index.dart';

enum Topic {
  nature(Strings.nature),
  oceans(Strings.oceans),
  planets(Strings.planets),
  galaxy(Strings.galaxy),
  unknown(Strings.unknown);

  final String topic;

  const Topic(this.topic);

  static List<Topic> get filters =>
      values.where((e) => e != Topic.unknown).toList();
}
