class SessionModel {
  String id;
  DateTime chargeDate;
  DateTime paymentDate;
  double cost;
  String receivingBank;
  bool receipt;
  String notes;

  SessionModel(
      this.id,
      this.chargeDate,
      this.paymentDate,
      this.cost,
      this.receivingBank,
      this.receipt,
      this.notes);

  Map<String, dynamic> toFirestore() {
    Map<String, dynamic> session = {
      "chargeDt": chargeDate.toIso8601String(),
      "paymentDt": paymentDate.toIso8601String(),
      "cost": cost,
      "bank" : receivingBank,
      "receipt" : receipt,
      "notes" : notes
    };

    if(id != '') session['id'] = id;

    return session;
  }


}