import 'package:flutter_sixvalley_ecommerce/data/model/image_full_url.dart';

class NotificationItemModel {
  dynamic totalSize;
  dynamic limit;
  dynamic offset;
  dynamic newNotificationItem;
  List<NotificationItem>? notification;

  NotificationItemModel(
      {this.totalSize,
        this.limit,
        this.offset,
        this.newNotificationItem,
        this.notification});

  NotificationItemModel.fromJson(Map<String, dynamic> json) {
    totalSize = json['total_size'];
    limit = json['limit'];
    offset = json['offset'];
    newNotificationItem = json['new_notification'];
    if (json['notification'] != null) {
      notification = <NotificationItem>[];
      json['notification'].forEach((v) {
        notification!.add(NotificationItem.fromJson(v));
      });
    }
  }
}

class NotificationItem {
  dynamic id;
  dynamic sentBy;
  dynamic sentTo;
  dynamic title;
  dynamic description;
  dynamic notificationCount;
  dynamic image;
  ImageFullUrl? imageFullUrl;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  NotificationSeenBy? seen;


  NotificationItem(
      {this.id,
        this.sentBy,
        this.sentTo,
        this.title,
        this.description,
        this.notificationCount,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.seen,
        this.imageFullUrl
      });

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sentBy = json['sent_by'];
    sentTo = json['sent_to'];
    title = json['title'];
    description = json['description'];
    notificationCount = int.parse(json['notification_count'].toString());
    image = json['image'];
    imageFullUrl = json['image_full_url'] != null
      ? ImageFullUrl.fromJson(json['image_full_url'])
      : null;
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    seen = json['notification_seen_by'] != null ? NotificationSeenBy.fromJson(json['notification_seen_by']) : null;

  }
}

class NotificationSeenBy {
  dynamic id;
  dynamic userId;
  dynamic notificationId;
  dynamic createdAt;


  NotificationSeenBy(
      {this.id,
        this.userId,
        this.notificationId,
        this.createdAt,
        });

  NotificationSeenBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = int.parse(json['user_id'].toString());
    notificationId = int.parse(json['notification_id'].toString());
    createdAt = json['created_at'];
  }
}