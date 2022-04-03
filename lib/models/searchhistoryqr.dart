class ViewSearchQRHistory {
  int? rowid;
  String? docType;
  String? status;
  String? qrCode;
  String? level;
  double? quantity;
  String? createdDate;
  String? postingDate;
  String? qtyError;
  String? teamCode;
  String? userId;
  String? sourceCode;
  String? stageCode;
  String? responsibilityCenter;
  String? locationCode;
  String? itemNo;
  String? qrExtend;
  String? itemName;

  ViewSearchQRHistory(
      {this.rowid,
      this.docType,
      this.status,
      this.qrCode,
      this.level,
      this.quantity,
      this.createdDate,
      this.postingDate,
      this.qtyError,
      this.teamCode,
      this.userId,
      this.sourceCode,
      this.stageCode,
      this.responsibilityCenter,
      this.locationCode,
      this.itemNo,
      this.qrExtend,
      this.itemName});

  ViewSearchQRHistory.fromJson(Map<String, dynamic> json) {
    rowid = json['rowid'];
    docType = json['docType'];
    status = json['status'];
    qrCode = json['qrCode'];
    level = json['level'];
    quantity = json['quantity'] * 1.0;
    createdDate = json['createdDate'];
    postingDate = json['postingDate'];
    qtyError = json['qtyError'];
    teamCode = json['teamCode'];
    userId = json['userId'];
    sourceCode = json['sourceCode'];
    stageCode = json['stageCode'];
    responsibilityCenter = json['responsibilityCenter'];
    locationCode = json['locationCode'];
    itemNo = json['itemNo'];
    qrExtend = json['qrExtend'];
    itemName = json['itemName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rowid'] = rowid;
    data['docType'] = docType;
    data['status'] = status;
    data['qrCode'] = qrCode;
    data['level'] = level;
    data['quantity'] = quantity;
    data['createdDate'] = createdDate;
    data['postingDate'] = postingDate;
    data['qtyError'] = qtyError;
    data['teamCode'] = teamCode;
    data['userId'] = userId;
    data['sourceCode'] = sourceCode;
    data['stageCode'] = stageCode;
    data['responsibilityCenter'] = responsibilityCenter;
    data['locationCode'] = locationCode;
    data['itemNo'] = itemNo;
    data['qrExtend'] = qrExtend;
    data['itemName'] = itemName;
    return data;
  }
}
