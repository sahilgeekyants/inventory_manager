import 'package:inventory_manager/services/config/shared_preference.dart';

Future<bool> isUserRoleQC() async {
  String? userRole = await localStorage.getUserRole();
  return userRole?.contains('QC') ?? false;
}
