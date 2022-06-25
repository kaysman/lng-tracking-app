import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v2_tracking_page/data/models/track-order.model.dart';
import 'package:v2_tracking_page/data/service/track-order.service.dart';

enum GetTrackOrderStatus { idle, loading, error, success }

class TrackOrderState {
  final TrackOrder? trackOrder;
  final GetTrackOrderStatus? status;

  TrackOrderState({
    this.trackOrder,
    this.status = GetTrackOrderStatus.idle,
  });

  TrackOrderState copyWith({
    TrackOrder? trackOrder,
    GetTrackOrderStatus? status,
  }) {
    return TrackOrderState(
      status: status ?? this.status,
      trackOrder: trackOrder ?? this.trackOrder,
    );
  }
}

class TrackOrderBloc extends Cubit<TrackOrderState> {
  TrackOrderBloc() : super(TrackOrderState());

  Future<void> fetchTrackOrder(String orderId) async {
    emit(state.copyWith(status: GetTrackOrderStatus.loading));

    try {
      var res = await TrackOrderService.getTrackOrderById(orderId);
      print("bloc res:  " "${res.toJson()}");
      emit(state.copyWith(
        status: GetTrackOrderStatus.idle,
        trackOrder: res,
      ));
    } catch (_) {
      emit(state.copyWith(status: GetTrackOrderStatus.error));
      throw _;
    }
  }
}
