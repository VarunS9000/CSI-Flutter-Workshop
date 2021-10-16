class User{
  static late String name;
  static late String email;
  static late String password;

  static Future<bool> updateUserDetails({required String name,required String email,required String password}) async{
    await Future.delayed(const Duration(seconds: 3));
    User.name=name;
    User.email=email;
    User.password=password;

    return true;
  }
}