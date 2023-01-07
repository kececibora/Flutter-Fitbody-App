import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
// required: associates our `main.dart` with the code generated by Freezed
part 'record.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'record.g.dart';

@freezed
class Record with _$Record {
  const factory Record({
    required int weight,
    required DateTime dateTime,
    required String photoUrl,
    required String note,
  }) = _Record;

  factory Record.fromJson(Map<String, Object?> json) => _$RecordFromJson(json);
}
