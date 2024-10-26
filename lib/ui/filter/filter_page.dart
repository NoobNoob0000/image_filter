import 'package:flutter/material.dart';
import 'package:image_filter/constants/index.dart';
import 'package:image_filter/data/index.dart';
import 'package:image_filter/state/filter_state_controller.dart';
import 'package:image_filter/ui/filter/filter_widget.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late FilterState state;
  String _filterValue = Strings.nature;
  //var _filterValueNotifier = ValueNotifier<int>(Constants.allFilter);

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    state = FilterStateContainer.of(context);
  }

  void _handleRadioValueChange(String? value) async {
    // setState(() {
    //   _filterValue = selectedValue;
    // });
    //_filterValueNotifier.value = value ?? Constants.allFilter;
    state.updateFilterValue(value ?? Strings.nature);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(_filterValue);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: Column(
        children: Topic.filters
            .map(
              (e) => FilterWidget(
                value: e.topic,
                text: e.name,
                groupValue: state.filterValue,
                onChanged: _handleRadioValueChange,
              ),
            )
            .toList(),
      ),
    );
  }
}
