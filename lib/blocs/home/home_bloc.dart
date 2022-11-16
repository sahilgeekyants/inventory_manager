// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:inventory_manager/repository/inventory_repository.dart';
import 'package:inventory_manager/serializers/login_user.dart';
import 'package:inventory_manager/serializers/product_info.dart';
import 'package:inventory_manager/serializers/response.dart';
import 'package:inventory_manager/services/config/shared_preference.dart';
import 'package:inventory_manager/services/helpers/extensions.dart';
import 'home_events.dart';
import 'home_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitialState(isLoading: false)) {
    on<GetUserDataEvent>(_handleGetUserDataEvent);
  }
  final InventoryRepository _repository = InventoryRepository();

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
      if (userName.isNotNullOrEmpty && orgId.isNotNullOrEmpty) {
        if (kDebugMode) {
          print('getTableData function calling in bloc');
        }
        response = await _repository.getTableData(userName: userName!, orgId: orgId!);
        if (kDebugMode) {
          print('getTableData function returned resoponse : ${response.body?.data ?? ''}');
          print('getTableData function returned status : ${response.status}');
        }
        if (response.status!) {
          List<ProductInfo> productslist = response.body!.data;
          emit(GetUserDataSuccessState(productslist: productslist));
        } else {
          emit(GetUserDataFailedState(error: response.message ?? 'Data fetch failed'));
        }
      } else {
        emit(const UserInfoUnavailableLoginAgainState(error: 'User info Unavailable'));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(GetUserDataFailedState(error: e.toString()));
    }
  }
}
