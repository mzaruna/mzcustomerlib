abstract class AuthenticationRepository {
Future<dynamic> getAuthenticationToken (String key,String secret);
Future<dynamic> getCouponlistByStatus(
      int skip, int limit, String status,String customerId,String accessToken);
}
