class LoginUser {
  // String? id;
  String? locale;
  String? region;
  String? userLocation;
  String? orgName;
  String? orgId;
  String? userName;
  String? instance;
  String? role;

  LoginUser({
    this.locale,
    this.region,
    this.userLocation,
    this.orgName,
    this.orgId,
    this.userName,
    this.instance,
    this.role,
  });

  LoginUser.fromJson(Map<String, dynamic> json) {
    locale = json['ssLocale'];
    region = json['ssRegion'];
    userLocation = json['ssUserlocat'];
    orgName = json['ssOrgname'];
    orgId = json['ssOrgId'];
    userName = json['ssUsername'];
    instance = json['ssInstance'];
    role = json['ssRole'];
  }

  Map<String, dynamic> toJson(LoginUser user) {
    Map<String, dynamic> json = {};
    json.addAll({
      "ssLocale": user.locale,
      "ssRegion": user.region,
      "ssUserlocat": user.userLocation,
      "ssOrgname": user.orgName,
      "ssOrgId": user.orgId,
      "ssUsername": user.userName,
      "ssInstance": user.instance,
      "ssRole": user.role,
    });
    return json;
  }
}

//
// Record No
// Batch ID
// Entity
// Region
// City Name
// Area Name
// District Name
// Sector/Section Name
// Road/Street No.
// Road/Street Name
// Complex / Group
// Sub-Complex
// Space ID
// Level or Floor
// Space Name
// Discipline
// Asset
// Asset Description
// PiLog Description
// Size
// Number / Quantity
// Geographical Location (X,Y)
// Google Maps Link
// Asset Location Code
// RC_Asset Tag No.
// Operating & Maintenance Dept.
// Existing Tag No.
// Existing Parent Tag No.
// Condition Code
// Condition Meaning
// Installed Area
// Asset Operational Environment
// Complexity of Access
// Surface condition and repairs
// Stains
// Reinforcing
// Fixings
// Comments & Remarks Column
// Notes
// Review Status
// Pilog Surveyor
// Survey Status Change Date
// Pilog Surveyor QC
// Survey QC Status Change Date
// Pilog Data Importer
// Create Date
// Edit By
// Edit Date

// ---------------
// RECORD_NO
// REGISTER_COLUMN5
// CUSTOM_DH_COLUMN5
// CUSTOM_DH_COLUMN6
// CUSTOM_DH_COLUMN7
// CUSTOM_DH_COLUMN8
// CUSTOM_DH_COLUMN9
// CUSTOM_DH_COLUMN10
// CUSTOM_DH_COLUMN11
// CUSTOM_DH_COLUMN12
// CUSTOM_DH_COLUMN13
// CUSTOM_DH_COLUMN14
// CUSTOM_DH_COLUMN15
// BU_DH_CUST_COL16
// BU_DH_CUST_COL17
// BU_DH_CUST_COL18
// CLASS_TERM
// MASTER_COLUMN5
// PILOG_LONG_DESC
// BU_DH_CUST_COL52
// BU_DH_CUST_COL25
// BU_DH_CUST_COL34
// BU_DH_CUST_COL33
// BU_DH_CUST_COL31
// BU_DH_CUST_COL28
// BU_DH_CUST_COL29
// BU_DH_CUST_COL35
// BU_DH_CUST_COL36
// BU_DH_CUST_COL39
// CONDITION_MEANING
// BU_DH_CUST_COL40
// BU_DH_CUST_COL41
// BU_DH_CUST_COL42
// BU_DH_CUST_COL43
// BU_DH_CUST_COL44
// BU_DH_CUST_COL45
// BU_DH_CUST_COL46
// BU_DH_CUST_COL47
// BU_DH_CUST_COL48
// STATUS
// BU_DH_CUST_COL49
// SURVEYOR_STATUS_CHDATE
// BU_DH_CUST_COL50
// SURVEYORQC_STATUS_CHDATE
// CREATE_BY
// FILTER_CREATE_DATE
// EDIT_BY
// FILTER_EDIT_DATE
