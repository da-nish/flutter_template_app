import 'package:ps_ui/util/util_assets.dart';

enum MockJson {
  // ======Overview======
  overview("/sales_overview/overview_call_summary.json"),
  overviewCallSummary("/sales_overview/overview_call_summary.json"),
  overviewNotesList("/sales_overview/overview_notes.json"),
  overviewFilterOption("/sales_overview/overview_filter.json"),

  overviewLiveAssetList("/sales_overview/overview_live_asset_list.json"),
  overviewLiveAssetDetails("/sales_overview/overview_live_asset_details.json"),

  // ======Invest Now======
  investnowList("/sales_invest_now/invest_now_list.json"),
  investnowFilter("/sales_invest_now/invest_now_filter.json"),

  // ======IN Details======
  inDetailsInfo("/in_details/in_info.json"),
  inDetailsEmail("/in_details/in_email.json"),
  inDetailsCallHistry("/in_details/in_call_history.json"),
  inDetailsInvestment("/in_details/in_investment.json"),
  inDetailsInvestNowClick("/in_details/in_investnow_click.json"),
  inDetailsEdit("/in_details/in_edit.json"),
  inDetailsUserNotes("/in_details/in_user_notes.json"),

  // ======Post Activity======
  inDetailPostActivityCloseReason("/post_activity/close_reason.json"),
  inDetailPostActivityList("/post_activity/post_activity_list.json"),
  inDetailPostActivityDocumentPreview("/post_activity/preview.json"),

  // ======Schedule Call======
  scheduleCallTimezoneList("/schedule_call/appointment_timezones.json"),
  scheduleCallAvailableTimeSlotList("/schedule_call/available_dates.json"),
  scheduleCallOverviewInfo("/schedule_call/call_overview.json"),

  // ========Create Invest=========
  createInvestAssetList("/create_invest/asset_list.json"),
  createInvestEmailList("/create_invest/email_list.json"),
  createInvestProfileList("/create_invest/profile_list.json"),
  createInvestPartnerList("/create_invest/partner_list.json"),
  createInvestTaggedPartnerStatus("/create_invest/tag_partner_status.json"),

  // ======Asset management======
  assetListFilter("/asset_management/asset_list_filter.json"),
  assetList("/asset_management/asset_list.json"),
  assetDetails("/asset_management/asset_details.json"),
  assetRentHistory("/asset_management/asset_rent_history.json"),
  assetRentHistoryFilter("/asset_management/asset_rent_history_filter.json"),
  assetRentSchedule("/asset_management/asset_rent_schedule.json"),

  // ======Marketing======
  inboundSummary("/marketing/inbound_summary.json"),
  inboundSummaryFilter("/marketing/inbound_summary_filter.json"),
  utmSource("/marketing/utm_source_list.json"),
  ;

  const MockJson(this.name);
  final String name;
  final String _base = "packages/ps_ui/assets/json/api_mock_data";
  String get path {
    return _base + name;
  }
}

class MockJsonData {
  static Future<Map<String, dynamic>> get({required MockJson mockData}) async {
    return await parseJsonFromAssets(mockData.path);
  }
}
