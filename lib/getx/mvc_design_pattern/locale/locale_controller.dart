import 'package:get/get.dart';

// Preparing the content of the app to be available in different languages (translations)
class LocaleController implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "it": {"1": "primapaggina"},
        "en": {"1": "homepage"}
      };
}
