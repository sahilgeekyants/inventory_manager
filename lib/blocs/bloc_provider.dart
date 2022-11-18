import 'package:inventory_manager/blocs/home/home_bloc.dart';
import 'package:inventory_manager/blocs/login/login_bloc.dart';
import 'package:inventory_manager/models/bloc_models.dart';
import 'package:inventory_manager/repository/inventory_repository.dart';
import 'package:inventory_manager/routes/route_util.dart';

class BlocProvider {
  EnumPageIntent? pageIntent;
  late bool forceCreateNewInstance;
  LoginPageBlocModel? _loginPageBlocModel;
  HomePageBlocModel? _homePageBlocModel;
  AllBlocModel? _allBlocModel;

  static final BlocProvider _singleton = BlocProvider._internal();

  BlocProvider._internal();

  factory BlocProvider(EnumPageIntent? pageIntent, {bool forceCreateNewInstance = false}) {
    _singleton.pageIntent = pageIntent;
    _singleton.forceCreateNewInstance = forceCreateNewInstance;
    return _singleton;
  }

  static InventoryRepository? _inventoryRepository;
  InventoryRepository get getAppRepository => _getAppRepository();
  InventoryRepository _getAppRepository() {
    _inventoryRepository ??= InventoryRepository();

    return _inventoryRepository!;
  }

  //
  LoginBloc? _loginBloc;
  HomeBloc? _homeBloc;
  dynamic getBlocModel({bool getAllBlocModel = false}) {
    _loginBloc ??= LoginBloc(repository: _getAppRepository());
    _homeBloc ??= HomeBloc(repository: _getAppRepository());

    if (getAllBlocModel) {
      return _allBlocModel =
          (forceCreateNewInstance || _allBlocModel == null) ? AllBlocModel(_loginBloc!, _homeBloc!) : _allBlocModel;
    } else if (pageIntent == EnumPageIntent.Login) {
      return _loginPageBlocModel = (forceCreateNewInstance || _loginPageBlocModel == null)
          ? LoginPageBlocModel(_loginBloc!, _homeBloc!)
          : _loginPageBlocModel;
    } else if (pageIntent == EnumPageIntent.Home) {
      return _homePageBlocModel = (forceCreateNewInstance || _homePageBlocModel == null)
          ? HomePageBlocModel(_loginBloc!, _homeBloc!)
          : _homePageBlocModel;
    }
  }
}
