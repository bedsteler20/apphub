import 'package:freezed_annotation/freezed_annotation.dart';
const dList = JsonKey(defaultValue: []);
const dMap = JsonKey(defaultValue: {});
const dString = JsonKey(defaultValue: '');
const dInt = JsonKey(defaultValue: 0);
const dBool = JsonKey(defaultValue: false);
const dDou = JsonKey(defaultValue: 0.0);

const kebabCase = JsonSerializable(fieldRename: FieldRename.kebab);
const snakeCase = JsonSerializable(fieldRename: FieldRename.snake);

const strToBool = StrToBoolConverter();
const strToInt = StrToIntConverter();

class StrToBoolConverter extends JsonConverter<bool, String> {
  const StrToBoolConverter();

  @override
  bool fromJson(String json) {
    return json == 'true';
  }

  @override
  String toJson(bool? object) {
    return object.toString();
  }
}

class StrToIntConverter extends JsonConverter<int, String> {
  const StrToIntConverter();

  @override
  int fromJson(String json) {
    return int.tryParse(json) ?? 0;
  }

  @override
  String toJson(int object) {
    return object.toString();
  }
}
