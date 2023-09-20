class AppConfiguration {
  static String? name;
  static String? image;
  static String? email;
  static String? phoneNumber;



  //-----   create a getter for the name and image
  static String get getName => name ?? '';
  static String get getImage => image ?? '';
  static String get getEmail => email ?? '';
  static String get getPhoneNumber => phoneNumber ?? '';


}
