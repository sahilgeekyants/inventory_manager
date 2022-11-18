import 'package:inventory_manager/blocs/bloc_provider.dart';
import 'package:inventory_manager/routes/route_util.dart';

class PageService {
  EnumPageIntent? pageIntent;
  PageService(this.pageIntent);

  dynamic getBlocModel({bool forceCreateNewInstance = false, bool getAllBlocModel = false}) {
    return BlocProvider(pageIntent, forceCreateNewInstance: forceCreateNewInstance)
        .getBlocModel(getAllBlocModel: getAllBlocModel);
  }
}
