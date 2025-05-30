abstract class NotificationServiceInterface{

  Future<dynamic> getList({dynamic offset = 1});
  Future<dynamic>  seenNotification(int id);

}