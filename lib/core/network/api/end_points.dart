class EndPoint {
  static const String baseUrl =
      "https://supermarket-dan1.onrender.com/api/v1";

  static const String signIn = "/auth/signIn";

  static const String signUp = "/auth/signUp";
  static const String homeProducts = "/home/products";
  static String getUserDataEndPoint(dynamic id) {
    return "/.user/get-user/$id";
  }
}
class ApiKey {
  static const String status = "status";
  static const String errorMessage = "ErrorMessage";
 
  static const String email = "email";
  static const String password = "password";

  static const String token = "token";
  static const String message = "message";

  static const String id = "id";
  static const String name = "name";
  static const String phone = "phone";

  static const String confirmPassword =
      "confirmPassword";

  static const String location = "location";
  static const String profilePic = "profilePic";

  static const String user = "user";
  static const String role = "role";
  static const String image = "image";



}