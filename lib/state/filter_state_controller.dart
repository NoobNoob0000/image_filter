import 'package:flutter/material.dart';
import 'package:image_filter/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FilterStateContainer extends StatefulWidget {
  const FilterStateContainer({super.key, required this.child});

  final Widget child;

  @override
  State<FilterStateContainer> createState() => FilterState();

  static FilterState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<_FilterInheritedWidget>()!
        .state;
  }
}

class FilterState extends State<FilterStateContainer> {
  String filterValue = ' ';
  late SharedPreferences _prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadValue();
  }

  _loadValue() {
    SharedPreferences.getInstance().then((value) {
      _prefs = value;
      setState(() {
        filterValue = _prefs.getString(Constants.filterKey) ?? Strings.nature;
      });
    });
  }

  void updateFilterValue(String value) {
    setState(() {
      _prefs.setString(Constants.filterKey, value);
      filterValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _FilterInheritedWidget(
      state: this,
      child: widget.child,
    );
  }
}

class _FilterInheritedWidget extends InheritedWidget {
  final FilterState state;

  _FilterInheritedWidget({
    super.key,
    required this.state,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
