import 'package:pos_mobile_app/services/merchant.service.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../models/admin-stat.model.dart';
import '../../../../models/merchant-report-stat.model.dart';
import '../../../../services/admin.service.dart';

class HistoryAnalyticWidgetViewModel extends BaseViewModel {
  final _adminService = locator<AdminService>();
  final _merchantService = locator<MerchantService>();

  AdminStat? get stat => _adminService.stat;

  MerchantReportStat? get reportStat => _merchantService.reportStat;
}
