import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TypeTag extends StatelessWidget {
  final List<String> typeList;
  final bool horizontal;
  const TypeTag({Key key, this.typeList, this.horizontal = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getTags(typeList);
  }

  Widget getTags(List<String> types) {
    List<Widget> tags = new List<Widget>();
    for (var type in types) {
      tags.add(buildTag(type));
    }
    if (this.horizontal) {
      return new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: tags,
      );
    }
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tags,
    );
  }

  Widget buildTag(String type) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color.fromARGB(100, 255, 255, 255)),
      child: Text(type),
    );
  }
}
