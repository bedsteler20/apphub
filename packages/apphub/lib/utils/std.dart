import 'dart:ffi';

import 'package:ffi/ffi.dart';

extension DateTimeExtension on DateTime {
  String toYYYYMMDD() {
    var year = this.year.toString();
    var month = this.month.toString();
    var day = this.day.toString();

    year = year.padLeft(4, '0');
    month = month.padLeft(2, '0');
    day = day.padLeft(2, '0');

    return '$year-$month-$day';
  }

  int get dayOfYear {
    return difference(DateTime(year, 1, 1)).inDays;
  }
}

extension FileSizeExtensions on num {
  /// method returns a human readable string representing a file size
  /// size can be passed as number or as string
  /// the optional parameter 'round' specifies the number of numbers after comma/point (default is 2)
  /// the optional boolean parameter 'useBase1024' specifies if we should count in 1024's (true) or 1000's (false). e.g. 1KB = 1024B (default is true)
  String toFileSize({int round = 2, bool useBase1024 = true}) {
    const List<String> affixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];

    num divider = useBase1024 ? 1024 : 1000;

    num size = this;
    num runningDivider = divider;
    num runningPreviousDivider = 0;
    int affix = 0;

    while (size >= runningDivider && affix < affixes.length - 1) {
      runningPreviousDivider = runningDivider;
      runningDivider *= divider;
      affix++;
    }

    String result =
        (runningPreviousDivider == 0 ? size : size / runningPreviousDivider)
            .toStringAsFixed(round);

    //Check if the result ends with .00000 (depending on how many decimals) and remove it if found.
    if (result.endsWith("0" * round)) {
      result = result.substring(0, result.length - round - 1);
    }

    return "$result ${affixes[affix]}";
  }
}

extension Unique<E, Id> on Iterable<E> {
  Iterable<E> unique(Id Function(E element) id) {
    final list = <E>[];
    final ids = <Id>{};
    for (final element in this) {
      final elementId = id(element);
      if (!ids.contains(elementId)) {
        list.add(element);
        ids.add(elementId);
      }
    }
    return list;
  }
}

extension FirstWhereOrNull<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E element) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}


extension Utf8PointerNull on Pointer<Utf8> {
  String? toDartStringOrNull() {
    if (this == nullptr) {
      return null;
    }
    return toDartString();
  }
}
