// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "background_text_1": MessageLookupByLibrary.simpleMessage(
            "Диапазон поиска не должен превышать 4294967295."),
        "background_text_2": MessageLookupByLibrary.simpleMessage(
            "Минимальная граница поиска -9999999999."),
        "background_text_3": MessageLookupByLibrary.simpleMessage(
            "Максимальная граница поиска 9999999999."),
        "background_text_list_ex":
            MessageLookupByLibrary.simpleMessage("Список пустой"),
        "enter": MessageLookupByLibrary.simpleMessage("ввод"),
        "from": MessageLookupByLibrary.simpleMessage("от"),
        "massage_blank_boundaries":
            MessageLookupByLibrary.simpleMessage("Введи диапазон поиска"),
        "massage_blank_field_generator":
            MessageLookupByLibrary.simpleMessage("Сгенерируй случайное сичло"),
        "massage_blank_fields_boundaries": MessageLookupByLibrary.simpleMessage(
            "Установи границы генерации чисел"),
        "massage_error_ex": MessageLookupByLibrary.simpleMessage(
            "Откорректируй список исключений"),
        "massage_error_fields_boundaries": MessageLookupByLibrary.simpleMessage(
            "Настрой границы генерации чисел"),
        "massage_ex_add":
            MessageLookupByLibrary.simpleMessage("Исключение добавлено"),
        "massage_ex_fill": MessageLookupByLibrary.simpleMessage(
            "Исключение уже есть в списке"),
        "massage_ex_no_add":
            MessageLookupByLibrary.simpleMessage("Исключение не добавлено"),
        "title_app": MessageLookupByLibrary.simpleMessage("Any Randomizer"),
        "to": MessageLookupByLibrary.simpleMessage("до"),
        "widget_add_exclude":
            MessageLookupByLibrary.simpleMessage("Введи значение"),
        "widget_boundaries":
            MessageLookupByLibrary.simpleMessage("Границы поиска"),
        "widget_excluded":
            MessageLookupByLibrary.simpleMessage("Исключенные значения"),
        "widget_generator":
            MessageLookupByLibrary.simpleMessage("Генератор чисел"),
        "widget_history":
            MessageLookupByLibrary.simpleMessage("История сгенерированых чисел")
      };
}
