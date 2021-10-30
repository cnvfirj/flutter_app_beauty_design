// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "background_text_1": MessageLookupByLibrary.simpleMessage(
            "The search range for a random number cannot exceed 4294967295."),
        "background_text_2": MessageLookupByLibrary.simpleMessage(
            "The minimum search boundary must not be less than -9999999999."),
        "background_text_3": MessageLookupByLibrary.simpleMessage(
            "The maximum search boundary must not be greater than 9999999999."),
        "from": MessageLookupByLibrary.simpleMessage("from"),
        "massage_blank_boundaries":
            MessageLookupByLibrary.simpleMessage("Enter the search range"),
        "massage_blank_field_generator":
            MessageLookupByLibrary.simpleMessage("Generate a random number"),
        "massage_blank_fields_boundaries": MessageLookupByLibrary.simpleMessage(
            "Set the boundaries of number generation"),
        "massage_error_ex": MessageLookupByLibrary.simpleMessage(
            "Adjust the list of exclusions"),
        "massage_error_fields_boundaries": MessageLookupByLibrary.simpleMessage(
            "Adjust the number generation boundaries"),
        "title_app": MessageLookupByLibrary.simpleMessage("Any Randomizer"),
        "to": MessageLookupByLibrary.simpleMessage("to"),
        "widget_boundaries":
            MessageLookupByLibrary.simpleMessage("Search boundaries"),
        "widget_excluded":
            MessageLookupByLibrary.simpleMessage("Excluded values"),
        "widget_generator":
            MessageLookupByLibrary.simpleMessage("Number generator"),
        "widget_history":
            MessageLookupByLibrary.simpleMessage("Number generation history")
      };
}
