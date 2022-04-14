import 'package:get/route_manager.dart';

/// [ISO Language Codes](https://www.andiamo.co.uk/resources/iso-language-codes/)
class AppTranslations extends Translations {
  AppTranslations();
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'helloWorld': 'Hello world!',
        },
        'zh_CN': {
          'helloWorld': '你好，世界！',
        },
      };
}
