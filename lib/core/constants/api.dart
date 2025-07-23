class Api {
  // static const baseURL = "http://127.0.0.1:8000";
  static const baseURL = "https://d9ae92e4768a.ngrok-free.app";
  // static const baseURL = "https://dangos.site";
}

final Map<String, String> headersNoToken = {
  'Content-Type': 'application/json',
};

final Map<String, String> headersFormDataNoToken = {
  'Content-Type': 'multipart/form-data',
};

Map<String, String> headerWithToken(String token) {
  return {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token',
  };
}

Map<String, String> headerFormDataWithToken(String token) {
  return {
    'Content-Type': 'multipart/form-data',
    'Authorization': 'Bearer $token',
  };
}
