// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Any Randomizer`
  String get title_app {
    return Intl.message(
      'Any Randomizer',
      name: 'title_app',
      desc: '',
      args: [],
    );
  }

  /// `The search range for a random number cannot exceed 4294967295.`
  String get background_text_1 {
    return Intl.message(
      'The search range for a random number cannot exceed 4294967295.',
      name: 'background_text_1',
      desc: '',
      args: [],
    );
  }

  /// `Minimum search boundary is limited by value -9999999999.`
  String get background_text_2 {
    return Intl.message(
      'Minimum search boundary is limited by value -9999999999.',
      name: 'background_text_2',
      desc: '',
      args: [],
    );
  }

  /// `Maximum search boundary is limited by value 9999999999.`
  String get background_text_3 {
    return Intl.message(
      'Maximum search boundary is limited by value 9999999999.',
      name: 'background_text_3',
      desc: '',
      args: [],
    );
  }

  /// `Number generator`
  String get widget_generator {
    return Intl.message(
      'Number generator',
      name: 'widget_generator',
      desc: '',
      args: [],
    );
  }

  /// `Number generation history`
  String get widget_history {
    return Intl.message(
      'Number generation history',
      name: 'widget_history',
      desc: '',
      args: [],
    );
  }

  /// `Excluded values`
  String get widget_excluded {
    return Intl.message(
      'Excluded values',
      name: 'widget_excluded',
      desc: '',
      args: [],
    );
  }

  /// `Search boundaries`
  String get widget_boundaries {
    return Intl.message(
      'Search boundaries',
      name: 'widget_boundaries',
      desc: '',
      args: [],
    );
  }

  /// `from`
  String get from {
    return Intl.message(
      'from',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Generate a random number`
  String get massage_blank_field_generator {
    return Intl.message(
      'Generate a random number',
      name: 'massage_blank_field_generator',
      desc: '',
      args: [],
    );
  }

  /// `Set the boundaries of number generation`
  String get massage_blank_fields_boundaries {
    return Intl.message(
      'Set the boundaries of number generation',
      name: 'massage_blank_fields_boundaries',
      desc: '',
      args: [],
    );
  }

  /// `Adjust the number generation boundaries`
  String get massage_error_fields_boundaries {
    return Intl.message(
      'Adjust the number generation boundaries',
      name: 'massage_error_fields_boundaries',
      desc: '',
      args: [],
    );
  }

  /// `Adjust the list of exclusions`
  String get massage_error_ex {
    return Intl.message(
      'Adjust the list of exclusions',
      name: 'massage_error_ex',
      desc: '',
      args: [],
    );
  }

  /// `Enter the search range`
  String get massage_blank_boundaries {
    return Intl.message(
      'Enter the search range',
      name: 'massage_blank_boundaries',
      desc: '',
      args: [],
    );
  }

  /// `Exception added`
  String get massage_ex_add {
    return Intl.message(
      'Exception added',
      name: 'massage_ex_add',
      desc: '',
      args: [],
    );
  }

  /// `No exception added`
  String get massage_ex_no_add {
    return Intl.message(
      'No exception added',
      name: 'massage_ex_no_add',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
