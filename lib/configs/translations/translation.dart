import 'package:get/get.dart';
import 'package:lpt_client/configs/translations/common/en.dart';
import 'package:lpt_client/configs/translations/common/th.dart';
import 'package:lpt_client/configs/translations/message/en.dart';
import 'package:lpt_client/configs/translations/message/th.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {...EnCommon.keys, ...EnMessage.keys},
        'th_TH': {...ThCommon.keys, ...ThMessage.keys}
      };
}
