import 'dart:convert';

class DataClass {
  final int counter;
  final int age;
  final bool ageGreaterThanFive;
  DataClass({
    required this.counter,
    required this.age,
    required this.ageGreaterThanFive,
  });

  DataClass copyWith({
    int? counter,
    int? age,
    bool? greaterThanFive,
  }) {
    return DataClass(
      counter: counter ?? this.counter,
      age: age ?? this.age,
      ageGreaterThanFive: greaterThanFive ?? this.ageGreaterThanFive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'counter': counter,
      'age': age,
      'greaterThanFive': ageGreaterThanFive,
    };
  }

  factory DataClass.fromMap(Map<String, dynamic> map) {
    return DataClass(
      counter: map['counter'],
      age: map['age'],
      ageGreaterThanFive: map['greaterThanFive'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataClass.fromJson(String source) =>
      DataClass.fromMap(json.decode(source));

  @override
  String toString() =>
      'DataClass(counter: $counter, age: $age, greaterThanFive: $ageGreaterThanFive)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataClass &&
        other.counter == counter &&
        other.age == age &&
        other.ageGreaterThanFive == ageGreaterThanFive;
  }

  @override
  int get hashCode =>
      counter.hashCode ^ age.hashCode ^ ageGreaterThanFive.hashCode;
}
