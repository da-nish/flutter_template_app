// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'मेरा ऐप';

  @override
  String get welcome => 'स्वागत है';

  @override
  String helloUser(Object name) {
    return 'नमस्ते $name';
  }

  @override
  String helloUser1(Object lastName, Object name) {
    return 'नमस्ते $name $lastName';
  }
}
