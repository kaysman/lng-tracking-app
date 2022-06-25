import 'package:v2_tracking_page/data/models/track-order.model.dart';
import 'package:v2_tracking_page/data/service/api_client.dart';
import 'package:v2_tracking_page/shared/helpers.dart';

class TrackOrderService {
  static Future<TrackOrder> getTrackOrderById(String orderId) async {
    var uri = Uri.https(apiUrl, "/api/v1/public/track/$orderId");
    try {
      var res = await ApiClient.instance.get(uri, headers: await headers);
      return TrackOrder.fromJson(res.data);
    } catch (_) {
      throw _;
    }
  }
}
