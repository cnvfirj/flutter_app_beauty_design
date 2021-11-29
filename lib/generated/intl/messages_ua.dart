// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ua locale. All the
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
  String get localeName => 'ua';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "background_text_1": MessageLookupByLibrary.simpleMessage(
            "Діапазон пошуку випадкового числа не може перевищувати 4294967295."),
        "background_text_2": MessageLookupByLibrary.simpleMessage(
            "Мінімальна межа пошуку обмежена значенням -9999999999."),
        "background_text_3": MessageLookupByLibrary.simpleMessage(
            "Максимальна межа пошуку обмежена значенням 9999999999."),
        "background_text_list_ex":
            MessageLookupByLibrary.simpleMessage("Список порожній"),
        "enter": MessageLookupByLibrary.simpleMessage("Готово"),
        "from": MessageLookupByLibrary.simpleMessage("від"),
        "massage_blank_boundaries":
            MessageLookupByLibrary.simpleMessage("Введи діапазон пошуку"),
        "massage_blank_field_generator":
            MessageLookupByLibrary.simpleMessage("Згенеруй випадкове число"),
        "massage_blank_fields_boundaries": MessageLookupByLibrary.simpleMessage(
            "Встановіть межі генерації чисел"),
        "massage_error_ex":
            MessageLookupByLibrary.simpleMessage("Відкоригуй список виключень"),
        "massage_error_fields_boundaries": MessageLookupByLibrary.simpleMessage(
            "Налаштуй межі генерації чисел"),
        "massage_ex_add":
            MessageLookupByLibrary.simpleMessage("Виключення додано"),
        "massage_ex_fill":
            MessageLookupByLibrary.simpleMessage("Виключення вже є у списку"),
        "massage_ex_no_add":
            MessageLookupByLibrary.simpleMessage("Виключення не додано"),
        "title_app": MessageLookupByLibrary.simpleMessage("Any Randomizer"),
        "to": MessageLookupByLibrary.simpleMessage("до"),
        "widget_add_exclude":
            MessageLookupByLibrary.simpleMessage("Введи значення"),
        "widget_boundaries":
            MessageLookupByLibrary.simpleMessage("Межі пошуку"),
        "widget_excluded":
            MessageLookupByLibrary.simpleMessage("Виключені значення"),
        "widget_generator":
            MessageLookupByLibrary.simpleMessage("Генератор чисел"),
        "widget_history":
            MessageLookupByLibrary.simpleMessage("Історія сгенерованих чисел")
      };
}
