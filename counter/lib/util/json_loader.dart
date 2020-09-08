import 'dart:convert';

import 'package:counter/data/counter.dart';
import 'package:counter/util/constants.dart';
import 'package:flutter/services.dart';

class JsonLoader {
  List<Counter> _counters = [];
  Future<List<Counter>> loadCounters() async {
    if (_counters.isNotEmpty) {
      return _counters;
    }
    print('**********loading**********');
    List<Counter> output = [];
    String jsonString = await rootBundle.loadString(kJsonPath);
    List jsonList = json.decode(jsonString);
    jsonList.forEach((element) => output.add(Counter.fromJson(element)));
    _counters = output;
    return output;
  }
}
