import 'package:flutter/material.dart';

class AppDetailColumn {
  final String header;
  final dynamic value;

  AppDetailColumn({
    required this.header,
    required this.value,
  });
}

class AppDetailCard extends StatelessWidget {
  final String title;
  final String? subTitle;
  final Map<String, dynamic>? data;
  final List<AppDetailColumn> columns;
  final double? elevation;
  final Widget Function(Map<String, dynamic>? row)? actionBuilder;

  const AppDetailCard(
      {Key? key,
      required this.data,
      required this.columns,
      this.actionBuilder,
      required this.title,
      this.subTitle, this.elevation})
      : super(key: key);

  static const TextStyle headerStyle = TextStyle(
      fontWeight: FontWeight.normal, color: Color.fromARGB(255, 71, 85, 105));
  static const TextStyle cellStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 71, 85, 105));

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation ?? 1,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    if (subTitle != null)
                      const SizedBox(
                        height: 1,
                      ),
                    if (subTitle != null)
                      Text(subTitle!, style: const TextStyle(fontSize: 11))
                  ],
                ),
              ],
            ),
            const Divider(
              height: 12,
              thickness: 1,
            ),
            if (data == null)
              const Center(
                child: Text(
                  "No data!",
                  style: TextStyle(fontSize: 11),
                ),
              ),
            if (data != null)
              ...columns.map(
                (col) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          col.header,
                          style: headerStyle,
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    )
                  ],
                ),
              ),
            if (actionBuilder != null)
              SizedBox(
                child: actionBuilder!(data),
              ),
          ],
        ),
      ),
    );
  }
}
