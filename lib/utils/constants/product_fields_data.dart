// ignore_for_file: non_constant_identifier_names, constant_identifier_names

class ProductFieldsData {
  static bool isFieldTypeDropDown(String fieldType) {
    // 3 types of fields types here
    // "DISP_ONLY", "TEXT INPUT" , "DROPDOWN"
    return fieldType == "DROPDOWN";
  }

  static List<String> getRecordFieldData(String fieldName) {
    return ProductAllFieldsData[fieldName]!;
  }

  static int get allRecordLengthCount => ProductAllFieldsData.keys.toList().length;

  static const Map<String, List<String>> ProductAllFieldsData = {
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
      "Comments & Remarks",
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
}
