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
        "background_text": MessageLookupByLibrary.simpleMessage(
            "Random values are generated in real-time in the laboratory of Australian National University by measuring vacuum state fluctuations. This service will be used if the internet connection is present."),
        "title_app": MessageLookupByLibrary.simpleMessage("Any Randomizer"),
        "widget_generator":
            MessageLookupByLibrary.simpleMessage("Number generator"),
        "widget_history":
            MessageLookupByLibrary.simpleMessage("Number generation history")
      };
}
