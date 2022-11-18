// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:inventory_manager/repository/inventory_repository.dart';
import 'package:inventory_manager/serializers/products_list.dart';
import 'package:inventory_manager/serializers/response.dart';
import 'package:inventory_manager/services/config/shared_preference.dart';
import 'package:inventory_manager/services/helpers/extensions.dart';
import 'package:inventory_manager/utils/constants/user_roles.dart';
import 'package:inventory_manager/utils/util.dart';
import 'home_events.dart';
import 'home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.repository}) : super(const HomeInitialState(isLoading: false)) {
    on<GetUserDataEvent>(_handleGetUserDataEvent);
    on<LogOutButtonPressed>(mapLogOutUserToState);
  }
  final InventoryRepository repository;
  // List<ProductInfo> productslist = [];
  ProductsList? productsList;

  //
  Future<void> _handleGetUserDataEvent(
    GetUserDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const GetUserDataInitialState(isLoading: true));
    Response response;
    try {
      String? userName = await localStorage.getUserName();
      String? orgId = await localStorage.getUserOrgId();
      bool isRoleQC = await isUserRoleQC();
      if (userName.isNotNullOrEmpty && orgId.isNotNullOrEmpty) {
        if (kDebugMode) print('getTableData function calling in bloc');
        response = await repository.getTableData(
          userName: userName!,
          orgId: orgId!,
          forRole: isRoleQC ? UserRole.SURVEYOR_QC : UserRole.SURVEYOR,
        );
        if (kDebugMode) {
          print('getTableData function returned resoponse : ${response.body?.data ?? ''}');
          print('getTableData function returned status : ${response.status}');
        }
        if (response.status!) {
          if (response.body!.data is ProductsList) {
            productsList = response.body!.data;
            // productslist = response.body!.data;
            emit(GetUserDataSuccessState(
              productslist: productsList!,
              userRole: isRoleQC ? UserRole.SURVEYOR_QC : UserRole.SURVEYOR,
            ));
          } else if (response.body!.data is List) {
            //empty data state
            emit(const GetUserDataEmptyState(response: 'User don\'t have any data'));
          }
        } else {
          emit(GetUserDataFailedState(error: response.message ?? 'Data fetch failed'));
        }
      } else {
        emit(const UserInfoUnavailableLoginAgainState(error: 'User info Unavailable'));
      }
    } catch (e) {
      if (kDebugMode) print(e);
      emit(GetUserDataFailedState(error: e.toString()));
    }
  }

  //

  Future<void> mapLogOutUserToState(
    LogOutButtonPressed event,
    Emitter<HomeState> emit,
  ) async {
    emit(const LogoutInitialState(isLoading: true));
    Response response;
    try {
      if (kDebugMode) print('logout function calling in bloc');
      response = await repository.userLogOut();
      if (kDebugMode) {
        print('logout function returned resoponse : ${response.body?.data ?? ''}');
        print('logout function returned status : ${response.status}');
      }
      if (response.status!) {
        emit(LogoutSuccessState());
      } else {
        emit(LogoutFailedState(error: response.message ?? 'Login failed'));
      }
    } catch (e) {
      if (kDebugMode) print(e);
      emit(LogoutFailedState(error: e.toString()));
    }
  }
}
