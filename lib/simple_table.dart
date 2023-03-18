library simple_table;

import 'package:flutter/material.dart';

class SimpleTable<T> extends StatefulWidget {
  const SimpleTable({
    Key? key,
    required this.list,
    required this.columns,
    required this.onRefresh,
    this.width,
  }) : super(key: key);
  final List<T> list;
  final List<SimpleData<T>> columns;
  final Future Function() onRefresh;
  final double? width;

  @override
  State<SimpleTable<T>> createState() => _SimpleTableState<T>();
}

class _SimpleTableState<T> extends State<SimpleTable<T>> {
  late List<SimpleData<T>> columns;

  @override
  void initState() {
    columns = widget.columns;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        width: widget.width ?? MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ///topic
            IntrinsicHeight(
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: columns.map((element) {
                    var index = columns.indexOf(element);
                    return SimpleColumn<T>(
                        flex: element.flex,
                        topic: element.topic,
                        ascending: element.ascending,
                        isSort: element.isSort,
                        onTap: element.isSort == true
                            ? () {
                                for (var e in columns) {
                                  var i = columns.indexOf(e);
                                  if (index != i) e.ascending = null;
                                }
                                element.ascending = element.ascending == null
                                    ? true
                                    : element.ascending == true
                                        ? false
                                        : true;

                                _sort(index, element.ascending);
                              }
                            : null);
                  }).toList()),
            ),

            ///data
            Expanded(
              child: RefreshIndicator(
                onRefresh: widget.onRefresh,
                child: ListView(
                    children: widget.list.map((e) {
                  var i = widget.list.indexOf(e);
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        border:
                            Border(bottom: BorderSide(color: Colors.black38))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: columns.map((element) {
                        return SimpleRow<T>(
                          flex: element.flex,
                          data: element.data != null
                              ? element.data!(i, widget.list[i])
                              : null,
                          action: element.action != null
                              ? element.action!(i, widget.list[i])
                              : const SizedBox(),
                        );
                      }).toList(),
                    ),
                  );
                }).toList()),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _sort(int columnIndex, bool? ascending) {
    setState(() {
      widget.list.sort((dynamic a, dynamic b) {
        int result = 0;
        var aValue = columns[columnIndex].data!(0, a);
        var bValue = columns[columnIndex].data!(0, b);
        result = ascending == true
            ? aValue.compareTo(bValue)
            : bValue.compareTo(aValue);
        return result;
      });
    });
  }
}

class SimpleData<T> {
  String topic;
  final int flex;
  final TextAlign textAlign;
  final Function(int index, T data)? data;
  bool? ascending;
  final bool isSort;
  final Widget Function(int index, T data)? action;

  SimpleData({
    required this.topic,
    this.flex = 1,
    this.textAlign = TextAlign.center,
    this.data,
    this.ascending,
    this.isSort = false,
    this.action,
  }) : assert(action != null ? (data == null && !isSort) : (data != null));
}

class SimpleColumn<T> extends StatelessWidget {
  const SimpleColumn({
    Key? key,
    this.flex = 1,
    required this.topic,
    this.textAlign = TextAlign.center,
    this.ascending,
    this.isSort = false,
    required this.onTap,
  }) : super(key: key);
  final int flex;
  final TextAlign textAlign;
  final String topic;
  final bool? ascending;
  final bool isSort;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 1),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          decoration: const BoxDecoration(
            color: Colors.black26,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  topic,
                  textAlign: textAlign,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
              if (isSort == true && ascending != null)
                Icon(
                  ascending == true ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 16,
                )
            ],
          ),
        ),
      ),
    );
  }
}

class SimpleRow<T> extends StatelessWidget {
  const SimpleRow({
    Key? key,
    this.flex = 1,
    this.data,
    this.textAlign = TextAlign.center,
    this.action,
  }) : super(key: key);
  final int flex;
  final TextAlign textAlign;
  final dynamic data;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: data != null
            ? Text('$data', textAlign: textAlign)
            : Center(child: action),
      ),
    );
  }
}
