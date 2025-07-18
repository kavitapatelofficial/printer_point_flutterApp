class WalletBonusModel {
  List<BonusList>? bonusList;

  WalletBonusModel({this.bonusList});

  WalletBonusModel.fromJson(Map<String, dynamic> json) {
    if (json['bonus_list'] != null) {
      bonusList = <BonusList>[];
      json['bonus_list'].forEach((v) {
        bonusList!.add(BonusList.fromJson(v));
      });
    }
  }


}

class BonusList {
  dynamic id;
  dynamic title;
  dynamic description;
  dynamic bonusType;
  double? bonusAmount;
  double? minAddMoneyAmount;
  double? maxBonusAmount;
  dynamic startDateTime;
  dynamic endDateTime;
  dynamic isActive;
  dynamic createdAt;
  dynamic updatedAt;

  BonusList(
      {this.id,
        this.title,
        this.description,
        this.bonusType,
        this.bonusAmount,
        this.minAddMoneyAmount,
        this.maxBonusAmount,
        this.startDateTime,
        this.endDateTime,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  BonusList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    bonusType = json['bonus_type'];
    bonusAmount = json['bonus_amount'].toDouble();
    minAddMoneyAmount = json['min_add_money_amount'].toDouble();
    maxBonusAmount = json['max_bonus_amount'].toDouble();
    startDateTime = json['start_date_time'];
    endDateTime = json['end_date_time'];
    isActive = json['is_active']? 1 : 0;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

}
