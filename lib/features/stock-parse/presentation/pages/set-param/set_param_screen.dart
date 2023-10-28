import 'package:flutter/material.dart';
import 'package:stock_scan/core/utils/strings.dart';
import 'package:stock_scan/core/utils/utils.dart';

import 'package:stock_scan/features/stock-parse/domain/entities/subvariable/subvariable.dart';

class SetParamScreen extends StatelessWidget {
  final SubVariable params;
  const SetParamScreen({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(
      text: params.defaultValue.toString(),
    );
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _headerWidget(),
              mainWidget(controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainWidget(TextEditingController controller) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text(
            firstUpperCase(params.parameterName),
            style: const TextStyle(color: Colors.white),
          )),
          Expanded(
            child: SizedBox(
              height: 20,
              child: TextFormField(
                controller: controller,
                style: const TextStyle(color: Colors.white),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (value) => validateValue(value, params),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _headerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(params.studyType!.toUpperCase(),
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        const SizedBox(height: 5),
        const Text('Set Parameters'),
        const SizedBox(height: 10),
      ],
    );
  }
}
