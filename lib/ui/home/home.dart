import 'package:flutter/material.dart';
import 'package:image_filter/constants/index.dart';
import 'package:image_filter/ui/image/list/images_page.dart';
import 'package:image_filter/ui/filter/Filter_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return FilterPage();
                },
              ));
            },
            icon: const Icon(
              Icons.filter_list,
            ),
          ),
        ],
      ),
      body: ImagesPage(),
    );
  }
}
