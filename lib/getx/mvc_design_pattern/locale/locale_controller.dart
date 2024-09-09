import 'package:get/get.dart';

// Change languages and translations
class LocaleController implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "it": {"1": "primapaggina"},
        "en": {"1": "homepage"}
      };
}
