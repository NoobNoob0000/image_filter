import 'package:flutter/material.dart';
import 'package:image_filter/data/index.dart';
import 'package:image_filter/state/filter_state_controller.dart';
import 'package:image_filter/ui/image/list/image_controller.dart';
import 'package:image_filter/ui/index.dart';

class ImagesPage extends StatefulWidget {
  const ImagesPage({super.key});

  @override
  State<ImagesPage> createState() => _ImagesPageState();
}

class _ImagesPageState extends State<ImagesPage> {
  final _controller = ImageController(ImageRepository());
  late FilterState state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = FilterStateContainer.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.fetchCourses(state.filterValue),
      builder: (context, snapshot) {
        final courses = snapshot.data;
        print('snapshot: $snapshot');
        if (snapshot.hasError) {
          return Center(child: Text('${snapshot.error}'));
        }

        if (courses == null ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          //itemCount: Cho ListView biết có bao nhiêu phần tử con chứa trong nó.
          itemCount: courses.length,
          //itemBuilder: Được gọi cho mỗi phần tử
          //Nó được truyền vào với context và vị trí trong danh sách (index)
          itemBuilder: (context, index) {
            //=> Sử dụng 2 thuộc tính này,
            //bạn có thể lấy vị trí trong ds và sau đó trả về một widget để hiển thị trong ds.
            final course = courses[index];
            return _buildRow(course);
          },
          //padding: Thêm khoảng đệm xung quanh các phần tử con trong ds
          //Mặc định là const EdgeInsets.only(bottom: 8)
          // padding: EdgeInsets.zero,
        );
      },
    );
  }

  Widget _buildRow(ImageModel image) {
    return ListTile(
      title: Text(image.title),
      trailing: Hero(
        //Hero +> Phải sử dụng cùng một tag (thẻ id)
        //=> Widget Hero nó biết vị cũ và mới của các widget cần được chuyển đổi trong quá trình hoạt ảnh (animation)
        tag: 'cardArtwork-${image.imageId}',
        transitionOnUserGestures: true,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image.network(
            image.url!,
            width: 100,
            height: 100,
          ),
        ),
      ),
      subtitle: Text(image.keywordsString),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return ImageDetail(image: image);
          },
        ));
      },
    );
  }
}
