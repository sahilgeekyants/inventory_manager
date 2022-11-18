import 'dart:convert';

Pattern emailValidationPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

extension StringX on String {
  bool containsIgnoreCase(String stringToMatch) {
    return toLowerCase().contains(stringToMatch.toLowerCase());
  }

  bool hasValidData() {
    return trim().isNotEmpty;
  }

  String getSafeData() {
    return hasValidData() ? this : '';
  }

  Iterable<String> toIterable() sync* {
    for (var i = 0; i < length; i++) {
      yield (this[i]);
    }
  }

  /// Same as contains, but allows for case insensitive searching
  ///
  /// [caseInsensitive] defaults to false
  bool containsX(String string, {bool caseInsensitive = false}) {
    if (caseInsensitive) {
      // match even if case doesn't match
      return toLowerCase().contains(string.toLowerCase());
    } else {
      return contains(string);
    }
  }

  String? extractSubstring(Pattern pattern) {
    final match = RegExp(pattern as String).firstMatch(this)!;
    if (match.groupCount > 0) {
      return match.group(1);
    }
    return '';
  }

  String substringUntil(Pattern occurrence) {
    final index = indexOf(occurrence);
    if (index == -1) {
      return this;
    }
    return substring(0, index);
  }

  String toLowerCaseNoSpaces() => toLowerCase().replaceAll(' ', '');
  String toLowerCaseNoSpecialCharacters() =>
      toLowerCase().replaceAll(' ', '').replaceAll(RegExp(r'(?:_|[^\w\s])+'), '');
}

extension EmptyAndNullStringValidation on String? {
  bool isNotNullAndNotEmpty() {
    return !(['', null].contains(this));
  }

  bool get isNotNullOrEmpty => !(['', null].contains(this));

  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    } else if (this is String && this == 'null') {
      return true;
    } else {
      return this!.isEmpty;
    }
  }

  bool containsIgnoreCase(String stringToMatch) {
    if (this == null) {
      return false;
    }
    return this!.toLowerCase().contains(stringToMatch.toLowerCase());
  }
}

extension ValidEmailStringValidation on String? {
  bool hasValidEmail() {
    return isNotNullAndNotEmpty() && RegExp(emailValidationPattern as String).hasMatch(this ?? '');
  }
}

extension NullValidation on dynamic {
  bool isNotNull() {
    return this != null;
  }
}

extension SwapList on List<dynamic> {
  List<T?> swap<T>(int index1, int index2) {
    T? temp = this[index1];
    this[index1] = this[index2];
    this[index2] = temp;
    return this as List<T?>;
  }
}

extension IterableX on Iterable? {
  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    } else {
      return this!.isEmpty;
    }
  }

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

extension ListEmptyValidation<E> on Iterable<E>? {
  bool hasData() => this != null && this!.isNotEmpty;
}

extension MapX<K, V> on Map<K, V> {
  T? get<T>(K key) => this[key] as T?;

  String jsonEncode() => json.encode(this);
}
