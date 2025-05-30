import 'package:image_picker/image_picker.dart';

abstract class RefundServiceInterface{
  Future<dynamic> refundRequest(dynamic orderDetailsId, double? amount, String refundReason, List<XFile?> file);

  Future<dynamic> getRefundInfo(dynamic orderDetailsId);

  Future<dynamic> getRefundResult(dynamic orderDetailsId);
}