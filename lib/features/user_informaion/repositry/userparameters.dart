
import 'package:equatable/equatable.dart';

class Userparameters extends Equatable {
   final String name;
  final String homephone;
  final String workphone;
  final String nationality;
  final String maritalstatus;
  final String job;
  final String birthday;
  final String email;
  

  Userparameters({
    required this.name,
    required this.homephone,
    required this.workphone,
    required this.nationality,
    required this.maritalstatus,
    required this.job,
    required this.birthday,
    required this.email,
  });

  tojsin() {
    return {
       "name": name,
      "home_phone": homephone,
      "work_phone": workphone,
      "nationality" :nationality,
      "marital_status": maritalstatus,
      "job": job,
      "birthday": birthday,
      "email": email,

    };
  }

  @override
  List<Object?> get props => [
    name,
    homephone,
    workphone,
      nationality,
 maritalstatus,
   job,
   birthday,
 email


  ];
}
