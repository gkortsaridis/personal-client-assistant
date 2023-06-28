import 'session_model.dart';

class ClientModel {
  String id;
  String firstName;
  String lastName;
  String preferredCurrency;
  List<SessionModel> sessions;

  ClientModel(
      this.id,
      this.firstName,
      this.lastName,
      this.preferredCurrency,
      this.sessions
  );

  Map<String, dynamic> toFirestore() {
    Map<String, dynamic> client = {
      "fName": firstName,
      "lName": lastName,
      "cur": preferredCurrency,
      "sessions" : sessions.map((session) => session.toFirestore()).toList()
    };

    if(id != '') client['id'] = id;

    return client;
  }
}