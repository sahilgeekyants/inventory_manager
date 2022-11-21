Map<String, Map<String, dynamic>> getFilteredArray(
    Map<String, Map<String, dynamic>> allRecords, List<bool> checkedProperties) {
  Map<String, Map<String, dynamic>> filteredArray = {...allRecords};
  String initialRecordNumber = allRecords.keys.toList()[0];
  List<String> properties = allRecords[initialRecordNumber]!.keys.toList();
  for (int i = 0; i < checkedProperties.length; i++) {
    if (!checkedProperties[i]) {
      for (String key in filteredArray.keys.toList()) {
        filteredArray[key]!.remove(properties[i]);
      }
    }
  }
  return filteredArray;
}
