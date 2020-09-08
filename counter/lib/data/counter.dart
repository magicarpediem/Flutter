import 'package:counter/data/record.dart';

class Counter {
  String name;
  String description;
  int index;
  int count;

  Counter();

  Counter.fromJson(Map<String, dynamic> jsonElement) {
    name = jsonElement['name'];
    description = jsonElement['description'];
    index = jsonElement['index'];
    count = jsonElement['count'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'index': index,
        'count': count,
      };

  reset() => count = 0;
  increment() => count++;
  decrement() {
    if (count > 0) {
      count--;
    }
  }

  @override
  String toString() {
    return 'Counter{name: $name, description: $description, index: $index, count: $count}';
  }
}
