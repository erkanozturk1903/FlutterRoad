import 'package:admin_dashboard/controllers/my_controller.dart';
import 'package:admin_dashboard/helpers/widgets/my_text_utils.dart';

class SuccessController extends MyController {
  List<String> dummyTexts =
      List.generate(12, (index) => MyTextUtils.getDummyText(60));
}
