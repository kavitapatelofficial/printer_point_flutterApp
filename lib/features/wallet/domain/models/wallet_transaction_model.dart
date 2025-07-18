import 'package:flutter_sixvalley_ecommerce/helper/date_converter.dart';

class WalletTransactionModel {
  dynamic limit;
  dynamic offset;
  dynamic totalSize;
  double? totalWalletBalance;
  dynamic filterBy;
  DateTime? startDate;
  DateTime? endDate;
  List<String>? transactionTypes;
  List<WalletTransactionList>? walletTransactionList;
  

  WalletTransactionModel.fromJson(Map<String, dynamic> json) {
    limit = int.tryParse('${json['limit']}');
    offset = int.tryParse('${json['offset']}');
    totalSize = int.tryParse('${json['total_size']}');
    filterBy = json['filter_by'];
    startDate = DateConverter.convertDurationDateTimeFromString(json['start_date']);
    endDate = DateConverter.convertDurationDateTimeFromString(json['end_date']);

    if (json['transaction_types'] != null) {
      transactionTypes = List<String>.from(json['transaction_types'].map((id) => id.toString()));
    }

    if(json['total_wallet_balance'] != null){
      totalWalletBalance = json['total_wallet_balance'].toDouble( );
    }else{
      totalWalletBalance = 0.0;
    }

    if (json['wallet_transaction_list'] != null) {
      walletTransactionList = <WalletTransactionList>[];
      json['wallet_transaction_list'].forEach((v) {
        walletTransactionList!.add(WalletTransactionList.fromJson(v));
      });
    }
  }

}

class WalletTransactionList {
  dynamic _id;
  dynamic _userId;
  dynamic _transactionId;
  double? _credit;
  double? _debit;
  double? _adminBonus;
  double? _balance;
  dynamic _transactionType;
  dynamic _reference;
  dynamic _createdAt;
  dynamic _updatedAt;
  dynamic paymentMethod;

  WalletTransactionList(
      {dynamic id,
        dynamic userId,
        dynamic transactionId,
        double? credit,
        double? debit,
        double? adminBonus,
        double? balance,
        dynamic transactionType,
        dynamic reference,
        dynamic createdAt,
        dynamic updatedAt,
        dynamic paymentMethod
      }) {
    if (id != null) {
      _id = id;
    }
    if (userId != null) {
      _userId = userId;
    }
    if (transactionId != null) {
      _transactionId = transactionId;
    }
    if (credit != null) {
      _credit = credit;
    }
    if (debit != null) {
      _debit = debit;
    }
    if (adminBonus != null) {
      _adminBonus = adminBonus;
    }
    if (balance != null) {
      _balance = balance;
    }
    if (transactionType != null) {
      _transactionType = transactionType;
    }
    if (reference != null) {
      _reference = reference;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    this.paymentMethod;
  }

  dynamic get id => _id;
  dynamic get userId => _userId;
  dynamic get transactionId => _transactionId;
  double? get credit => _credit;
  double? get debit => _debit;
  double? get adminBonus => _adminBonus;
  double? get balance => _balance;
  dynamic get transactionType => _transactionType;
  dynamic get reference => _reference;
  dynamic get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  WalletTransactionList.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _transactionId = json['transaction_id'];
    _credit = json['credit'].toDouble();
    _debit = json['debit'].toDouble();
    _adminBonus = json['admin_bonus'].toDouble();
    _balance = json['balance'].toDouble();
    _transactionType = json['transaction_type'];
    _reference = json['reference'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    paymentMethod = json['payment_method'];
  }

}
