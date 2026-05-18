// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'ನನ್ನ ಆಪ್';

  @override
  String get welcome => 'ಸ್ವಾಗತ';

  @override
  String helloUser(Object name) {
    return 'ಹಲೋ $name';
  }

  @override
  String helloUser1(Object lastName, Object name) {
    return 'ಹಲೋ $name $lastName';
  }
}
