import 'package:flutter/material.dart';

class ValueDetailScreen extends StatelessWidget {
  final List<num?> nums;
  const ValueDetailScreen({
    Key? key,
    required this.nums,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortedNums = List.from(nums);
    sortedNums.removeWhere((element) => element == null);
    sortedNums.sort((a, b) {
      return a!.compareTo(b!);
    });
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: sortedNums.length,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: Colors.black,
              title: Text(
                sortedNums[index].toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
          }),
    ));
  }
}
