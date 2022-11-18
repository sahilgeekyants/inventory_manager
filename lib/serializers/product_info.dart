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

  Map<String, dynamic> toJson(ProductInfo product) {
    Map<String, dynamic> json = {};
    json.addAll({
      "RECORD_NO": product.recordNo,
      "REGISTER_COLUMN5": product.batchID,
      "CUSTOM_DH_COLUMN5": product.entity,
      "CUSTOM_DH_COLUMN6": product.region,
      "CUSTOM_DH_COLUMN7": product.cityName,
      "CUSTOM_DH_COLUMN8": product.areaName,
      "CUSTOM_DH_COLUMN9": product.districtName,
      "CUSTOM_DH_COLUMN10": product.sectorOrSectionName,
      "CUSTOM_DH_COLUMN11": product.roadOrStreetNo,
      "CUSTOM_DH_COLUMN12": product.roadOrStreetName,
      "CUSTOM_DH_COLUMN13": product.complexOrGroup,
      "CUSTOM_DH_COLUMN14": product.subComplex,
      "CUSTOM_DH_COLUMN15": product.spaceID,
      "BU_DH_CUST_COL16": product.levelOrFloor,
      "BU_DH_CUST_COL17": product.spaceName,
      "BU_DH_CUST_COL18": product.discipline,
      "CLASS_TERM": product.asset,
      "MASTER_COLUMN5": product.assetDescription,
      "PILOG_LONG_DESC": product.piLogDescription,
      "BU_DH_CUST_COL52": product.size,
      "BU_DH_CUST_COL25": product.numberOrQuantity,
      "BU_DH_CUST_COL34": product.geographicalLocation,
      "BU_DH_CUST_COL33": product.googleMapsLink,
      "BU_DH_CUST_COL31": product.assetLocationCode,
      "BU_DH_CUST_COL28": product.rcAssetTagNo,
      "BU_DH_CUST_COL29": product.operatingAndMaintenanceDept,
      "BU_DH_CUST_COL35": product.existingTagNo,
      "BU_DH_CUST_COL36": product.existingParentTagNo,
      "BU_DH_CUST_COL39": product.conditionCode,
      "CONDITION_MEANING": product.conditionMeaning,
      "BU_DH_CUST_COL40": product.installedArea,
      "BU_DH_CUST_COL41": product.assetOperationalEnvironment,
      "BU_DH_CUST_COL42": product.complexityOfAccess,
      "BU_DH_CUST_COL43": product.surfaceConditionAndRepairs,
      "BU_DH_CUST_COL44": product.stains,
      "BU_DH_CUST_COL45": product.reinforcing,
      "BU_DH_CUST_COL46": product.fixings,
      "BU_DH_CUST_COL47": product.commentsAndRemarksColumn,
      "BU_DH_CUST_COL48": product.notes,
      "STATUS": product.reviewStatus,
      "BU_DH_CUST_COL49": product.pilogSurveyor,
      "SURVEYOR_STATUS_CHDATE": product.surveyStatusChangeDate,
      "BU_DH_CUST_COL50": product.pilogSurveyorQC,
      "SURVEYORQC_STATUS_CHDATE": product.surveyQcStatusChangeDate,
      "CREATE_BY": product.pilogDataImporter,
      "FILTER_CREATE_DATE": product.createDate,
      "EDIT_BY": product.editBy,
      "FILTER_EDIT_DATE": product.editDate,
    });
    return json;
  }
}

////To be used later in mapping
// enum ProductLabelEnums {
//   recordNo,
//   batchID,
//   entity,
//   region,
//   cityName,
//   areaName,
//   districtName,
//   sectorOrSectionName,
//   roadOrStreetNo,
//   roadOrStreetName,
//   complexOrGroup,
//   subComplex,
//   spaceID,
//   levelOrFloor,
//   spaceName,
//   discipline,
//   asset,
//   assetDescription,
//   piLogDescription,
//   size,
//   numberOrQuantity,
//   geographicalLocation,
//   googleMapsLink,
//   assetLocationCode,
//   rcAssetTagNo,
//   operatingAndMaintenanceDept,
//   existingTagNo,
//   existingParentTagNo,
//   conditionCode,
//   conditionMeaning,
//   installedArea,
//   assetOperationalEnvironment,
//   complexityOfAccess,
//   surfaceConditionAndRepairs,
//   stains,
//   reinforcing,
//   fixings,
//   commentsAndRemarksColumn,
//   notes,
//   reviewStatus,
//   pilogSurveyor,
//   surveyStatusChangeDate,
//   pilogSurveyorQC,
//   surveyQcStatusChangeDate,
//   pilogDataImporter,
//   createDate,
//   editBy,
//   editDate,
// }
