// ignore_for_file: non_constant_identifier_names

class ProductInfo {
  String? recordNo;
  String? batchID;
  String? entity;
  String? region;
  String? cityName;
  String? areaName;
  String? districtName;
  String? sectorOrSectionName;
  String? roadOrStreetNo;
  String? roadOrStreetName;
  String? complexOrGroup;
  String? subComplex;
  String? spaceID;
  String? levelOrFloor;
  String? spaceName;
  String? discipline;
  String? asset;
  String? assetDescription;
  String? piLogDescription;
  String? size;
  String? numberOrQuantity;
  String? geographicalLocation;
  String? googleMapsLink;
  String? assetLocationCode;
  String? rcAssetTagNo;
  String? operatingAndMaintenanceDept;
  String? existingTagNo;
  String? existingParentTagNo;
  String? conditionCode;
  String? conditionMeaning;
  String? installedArea;
  String? assetOperationalEnvironment;
  String? complexityOfAccess;
  String? surfaceConditionAndRepairs;
  String? stains;
  String? reinforcing;
  String? fixings;
  String? commentsAndRemarksColumn;
  String? notes;
  String? reviewStatus;
  String? pilogSurveyor;
  String? surveyStatusChangeDate;
  String? pilogSurveyorQC;
  String? surveyQcStatusChangeDate;
  String? pilogDataImporter;
  String? createDate;
  String? editBy;
  String? editDate;

  ProductInfo({
    this.recordNo,
    this.batchID,
    this.entity,
    this.region,
    this.cityName,
    this.areaName,
    this.districtName,
    this.sectorOrSectionName,
    this.roadOrStreetNo,
    this.roadOrStreetName,
    this.complexOrGroup,
    this.subComplex,
    this.spaceID,
    this.levelOrFloor,
    this.spaceName,
    this.discipline,
    this.asset,
    this.assetDescription,
    this.piLogDescription,
    this.size,
    this.numberOrQuantity,
    this.geographicalLocation,
    this.googleMapsLink,
    this.assetLocationCode,
    this.rcAssetTagNo,
    this.operatingAndMaintenanceDept,
    this.existingTagNo,
    this.existingParentTagNo,
    this.conditionCode,
    this.conditionMeaning,
    this.installedArea,
    this.assetOperationalEnvironment,
    this.complexityOfAccess,
    this.surfaceConditionAndRepairs,
    this.stains,
    this.reinforcing,
    this.fixings,
    this.commentsAndRemarksColumn,
    this.notes,
    this.reviewStatus,
    this.pilogSurveyor,
    this.surveyStatusChangeDate,
    this.pilogSurveyorQC,
    this.surveyQcStatusChangeDate,
    this.pilogDataImporter,
    this.createDate,
    this.editBy,
    this.editDate,
  });

  ProductInfo.fromJson(Map<String, dynamic> json) {
    recordNo = json['RECORD_NO'];
    batchID = json['REGISTER_COLUMN5'];
    entity = json['CUSTOM_DH_COLUMN5'];
    region = json['CUSTOM_DH_COLUMN6'];
    cityName = json['CUSTOM_DH_COLUMN7'];
    areaName = json['CUSTOM_DH_COLUMN8'];
    districtName = json['CUSTOM_DH_COLUMN9'];
    sectorOrSectionName = json['CUSTOM_DH_COLUMN10'];
    roadOrStreetNo = json['CUSTOM_DH_COLUMN11'];
    roadOrStreetName = json['CUSTOM_DH_COLUMN12'];
    complexOrGroup = json['CUSTOM_DH_COLUMN13'];
    subComplex = json['CUSTOM_DH_COLUMN14'];
    spaceID = json['CUSTOM_DH_COLUMN15'];
    levelOrFloor = json['CUSTOM_DH_COLUMN16'];
    spaceName = json['CUSTOM_DH_COLUMN17'];
    discipline = json['CUSTOM_DH_COLUMN18'];
    asset = json['CLASS_TERM'];
    assetDescription = json['MASTER_COLUMN5'];
    piLogDescription = json['PILOG_LONG_DESC'];
    size = json['BU_DH_CUST_COL52'];
    numberOrQuantity = json['BU_DH_CUST_COL25'];
    geographicalLocation = json['BU_DH_CUST_COL34'];
    googleMapsLink = json['BU_DH_CUST_COL33'];
    assetLocationCode = json['BU_DH_CUST_COL31'];
    rcAssetTagNo = json['BU_DH_CUST_COL28'];
    operatingAndMaintenanceDept = json['BU_DH_CUST_COL29'];
    existingTagNo = json['BU_DH_CUST_COL35'];
    existingParentTagNo = json['BU_DH_CUST_COL36'];
    conditionCode = json['BU_DH_CUST_COL39'];
    conditionMeaning = json['CONDITION_MEANING'];
    installedArea = json['BU_DH_CUST_COL40'];
    assetOperationalEnvironment = json['BU_DH_CUST_COL41'];
    complexityOfAccess = json['BU_DH_CUST_COL42'];
    surfaceConditionAndRepairs = json['BU_DH_CUST_COL43'];
    stains = json['BU_DH_CUST_COL44'];
    reinforcing = json['BU_DH_CUST_COL45'];
    fixings = json['BU_DH_CUST_COL46'];
    commentsAndRemarksColumn = json['BU_DH_CUST_COL47'];
    notes = json['BU_DH_CUST_COL48'];
    reviewStatus = json['STATUS'];
    pilogSurveyor = json['BU_DH_CUST_COL49'];
    surveyStatusChangeDate = json['SURVEYOR_STATUS_CHDATE'];
    pilogSurveyorQC = json['BU_DH_CUST_COL50'];
    surveyQcStatusChangeDate = json['SURVEYORQC_STATUS_CHDATE'];
    pilogDataImporter = json['CREATE_BY'];
    createDate = json['FILTER_CREATE_DATE'];
    editBy = json['EDIT_BY'];
    editDate = json['FILTER_EDIT_DATE'];
  }

  Map<String, dynamic> toJson(ProductInfo user) {
    Map<String, dynamic> json = {};
    json.addAll({
      "RECORD_NO": user.recordNo,
      "REGISTER_COLUMN5": user.batchID,
      "CUSTOM_DH_COLUMN5": user.entity,
      "CUSTOM_DH_COLUMN6": user.region,
      "CUSTOM_DH_COLUMN7": user.cityName,
      "CUSTOM_DH_COLUMN8": user.areaName,
      "CUSTOM_DH_COLUMN9": user.districtName,
      "CUSTOM_DH_COLUMN10": user.sectorOrSectionName,
      "CUSTOM_DH_COLUMN11": user.roadOrStreetNo,
      "CUSTOM_DH_COLUMN12": user.roadOrStreetName,
      "CUSTOM_DH_COLUMN13": user.complexOrGroup,
      "CUSTOM_DH_COLUMN14": user.subComplex,
      "CUSTOM_DH_COLUMN15": user.spaceID,
      "BU_DH_CUST_COL16": user.levelOrFloor,
      "BU_DH_CUST_COL17": user.spaceName,
      "BU_DH_CUST_COL18": user.discipline,
      "CLASS_TERM": user.asset,
      "MASTER_COLUMN5": user.assetDescription,
      "PILOG_LONG_DESC": user.piLogDescription,
      "BU_DH_CUST_COL52": user.size,
      "BU_DH_CUST_COL25": user.numberOrQuantity,
      "BU_DH_CUST_COL34": user.geographicalLocation,
      "BU_DH_CUST_COL33": user.googleMapsLink,
      "BU_DH_CUST_COL31": user.assetLocationCode,
      "BU_DH_CUST_COL28": user.rcAssetTagNo,
      "BU_DH_CUST_COL29": user.operatingAndMaintenanceDept,
      "BU_DH_CUST_COL35": user.existingTagNo,
      "BU_DH_CUST_COL36": user.existingParentTagNo,
      "BU_DH_CUST_COL39": user.conditionCode,
      "CONDITION_MEANING": user.conditionMeaning,
      "BU_DH_CUST_COL40": user.installedArea,
      "BU_DH_CUST_COL41": user.assetOperationalEnvironment,
      "BU_DH_CUST_COL42": user.complexityOfAccess,
      "BU_DH_CUST_COL43": user.surfaceConditionAndRepairs,
      "BU_DH_CUST_COL44": user.stains,
      "BU_DH_CUST_COL45": user.reinforcing,
      "BU_DH_CUST_COL46": user.fixings,
      "BU_DH_CUST_COL47": user.commentsAndRemarksColumn,
      "BU_DH_CUST_COL48": user.notes,
      "STATUS": user.reviewStatus,
      "BU_DH_CUST_COL49": user.pilogSurveyor,
      "SURVEYOR_STATUS_CHDATE": user.surveyStatusChangeDate,
      "BU_DH_CUST_COL50": user.pilogSurveyorQC,
      "SURVEYORQC_STATUS_CHDATE": user.surveyQcStatusChangeDate,
      "CREATE_BY": user.pilogDataImporter,
      "FILTER_CREATE_DATE": user.createDate,
      "EDIT_BY": user.editBy,
      "FILTER_EDIT_DATE": user.editDate,
    });
    return json;
  }

  // //
  // Map<ProductLabelEnums, List<dynamic>> productEnumAttachedData = {
  //   ProductLabelEnums.recordNo: [],
  // };
}

enum ProductLabelEnums {
  recordNo,
  batchID,
  entity,
  region,
  cityName,
  areaName,
  districtName,
  sectorOrSectionName,
  roadOrStreetNo,
  roadOrStreetName,
  complexOrGroup,
  subComplex,
  spaceID,
  levelOrFloor,
  spaceName,
  discipline,
  asset,
  assetDescription,
  piLogDescription,
  size,
  numberOrQuantity,
  geographicalLocation,
  googleMapsLink,
  assetLocationCode,
  rcAssetTagNo,
  operatingAndMaintenanceDept,
  existingTagNo,
  existingParentTagNo,
  conditionCode,
  conditionMeaning,
  installedArea,
  assetOperationalEnvironment,
  complexityOfAccess,
  surfaceConditionAndRepairs,
  stains,
  reinforcing,
  fixings,
  commentsAndRemarksColumn,
  notes,
  reviewStatus,
  pilogSurveyor,
  surveyStatusChangeDate,
  pilogSurveyorQC,
  surveyQcStatusChangeDate,
  pilogDataImporter,
  createDate,
  editBy,
  editDate,
}

//
Map ProductFieldsData = {
  "RECORD_NO": [
    "Record No",
    "DISP_ONLY",
  ],
  "REGISTER_COLUMN5": [
    "Batch ID",
    "DISP_ONLY",
  ],
  "CUSTOM_DH_COLUMN5": [
    "Entity",
    "DISP_ONLY",
  ],
  "CUSTOM_DH_COLUMN6": [
    "Region",
    "DISP_ONLY",
  ],
  "CUSTOM_DH_COLUMN7": [
    "City Name",
    "DISP_ONLY",
  ],
  "CUSTOM_DH_COLUMN8": [
    "Area Name",
    "DISP_ONLY",
  ],
  "CUSTOM_DH_COLUMN9": [
    "District Name",
    "DISP_ONLY",
  ],
  "CUSTOM_DH_COLUMN10": [
    "Sector/Section Name",
    "DISP_ONLY",
  ],
  "CUSTOM_DH_COLUMN11": [
    "Road/Street No.",
    "DISP_ONLY",
  ],
  "CUSTOM_DH_COLUMN12": [
    "Road/Street Name",
    "DISP_ONLY",
  ],
  "CUSTOM_DH_COLUMN13": [
    "Complex / Group",
    "DISP_ONLY",
  ],
  "CUSTOM_DH_COLUMN14": [
    "Sub-Complex",
    "DISP_ONLY",
  ],
  "CUSTOM_DH_COLUMN15": [
    "Space ID",
    "DISP_ONLY",
  ],
  "BU_DH_CUST_COL16": [
    "Level or Floor",
    "DISP_ONLY",
  ],
  "BU_DH_CUST_COL17": [
    "Space Name",
    "DISP_ONLY",
  ],
  "BU_DH_CUST_COL18": [
    "Discipline",
    "DISP_ONLY",
  ],
  "CLASS_TERM": [
    "Asset",
    "DISP_ONLY",
  ],
  "MASTER_COLUMN5": [
    "Asset Description",
    "DISP_ONLY",
  ],
  "PILOG_LONG_DESC": [
    "PiLog Description",
    "DISP_ONLY",
  ],
  "BU_DH_CUST_COL52": [
    "Size",
    "TEXT INPUT",
  ],
  "BU_DH_CUST_COL25": [
    "Number / Quantity",
    "DISP_ONLY",
  ],
  "BU_DH_CUST_COL34": [
    "Geographical Location (X,Y)",
    "TEXT INPUT",
  ],
  "BU_DH_CUST_COL33": [
    "Google Maps Link",
    "TEXT INPUT",
  ],
  "BU_DH_CUST_COL31": [
    "Asset Location Code",
    "DISP_ONLY",
  ],
  "BU_DH_CUST_COL28": [
    "RC_Asset Tag No.",
    "TEXT INPUT",
  ],
  "BU_DH_CUST_COL29": [
    "Operating & Maintenance Dept.",
    "TEXT INPUT",
  ],
  "BU_DH_CUST_COL35": [
    "Existing Tag No.",
    "DISP_ONLY",
  ],
  "BU_DH_CUST_COL36": [
    "Existing Parent Tag No.",
    "DISP_ONLY",
  ],
  "BU_DH_CUST_COL39": [
    "Condition Code",
    "DROPDOWN",
  ],
  "CONDITION_MEANING": [
    "Condition Meaning",
    "DISP_ONLY",
  ],
  "BU_DH_CUST_COL40": [
    "Installed Area",
    "DROPDOWN",
  ],
  "BU_DH_CUST_COL41": [
    "Asset Operational Environment",
    "DROPDOWN",
  ],
  "BU_DH_CUST_COL42": [
    "Complexity of Access",
    "DROPDOWN",
  ],
  "BU_DH_CUST_COL43": [
    "Surface condition and repairs",
    "TEXT INPUT",
  ],
  "BU_DH_CUST_COL44": [
    "Stains",
    "TEXT INPUT",
  ],
  "BU_DH_CUST_COL45": [
    "Reinforcing",
    "TEXT INPUT",
  ],
  "BU_DH_CUST_COL46": [
    "Fixings",
    "TEXT INPUT",
  ],
  "BU_DH_CUST_COL47": [
    "Comments & Remarks Column",
    "DISP_ONLY",
  ],
  "BU_DH_CUST_COL48": [
    "Notes",
    "TEXT INPUT",
  ],
  "STATUS": [
    "Review Status",
    "DROPDOWN",
  ],
  "BU_DH_CUST_COL49": [
    "Pilog Surveyor",
    "DISP_ONLY",
  ],
  "SURVEYOR_STATUS_CHDATE": [
    "Survey Status Change Date",
    "DISP_ONLY",
  ],
  "BU_DH_CUST_COL50": [
    "Pilog Surveyor QC",
    "DISP_ONLY",
  ],
  "SURVEYORQC_STATUS_CHDATE": [
    "Survey QC Status Change Date",
    "DISP_ONLY",
  ],
  "CREATE_BY": [
    "Pilog Data Importer",
    "DISP_ONLY",
  ],
  "FILTER_CREATE_DATE": [
    "Create Date",
    "DISP_ONLY",
  ],
  "EDIT_BY": [
    "Edit By",
    "DISP_ONLY",
  ],
  "FILTER_EDIT_DATE": [
    "Edit Date",
    "DISP_ONLY",
  ],
};
