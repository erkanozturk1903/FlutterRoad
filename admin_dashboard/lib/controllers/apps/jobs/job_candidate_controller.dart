import 'package:admin_dashboard/controllers/my_controller.dart';
import 'package:admin_dashboard/models/discover.dart';

class JobCandidateController extends MyController {
  List<Discover> jobCandidate = [];

  String selectJob = "Select Job";
  String selectRating = "Select Rating";

  @override
  void onInit() {
    super.onInit();
    Discover.dummyList.then((value) {
      jobCandidate = value.sublist(0, 16);
      update();
    });
  }

  void onSelectedJob(String job) {
    selectJob = job;
    update();
  }

  void onSelectedRating(String rating) {
    selectRating = rating;
    update();
  }
}
