import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/admin-stat.model.dart';
import '../../../../services/admin.service.dart';

class HistoryAnalyticWidgetViewModel extends BaseViewModel {
  final _adminService = locator<AdminService>();
  AdminStat? get stat => _adminService.stat;
}
