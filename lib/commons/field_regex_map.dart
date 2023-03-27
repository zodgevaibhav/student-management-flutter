class FieldRegExMap {
  static Map<String, String> myMap = {
    'EMAIL': '^[a-zA-Z0-9+._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\$',
    'URL': '^(http|https):\/\/[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}(\/\S*)?\$',
    'MOBILE': '^\+?[ ]?\d{0,3}[ -]?\d{3}[ -]?\d{3}[ -]?\d{4}\$',
    'NUMERIC': '^[0-9]+\$',
    'ALPPHA_NUMERIC': '^[a-zA-Z0-9]*\$',
    'ALL_ALLOWED':'/^[\s\S]*\$/'
  };

  static String? getRegEx(String value) {
    if (value.toUpperCase().contains("EMAIL")) {
      return myMap['EMAIL'];
    } else if (value.toUpperCase().contains("URL")) {
      return myMap['URL'];
    } else if (value.toUpperCase().contains("MOBILE")) {
      return myMap['MOBILE'];
    } else if (value.toUpperCase().contains("ARN")) {
      return myMap['ALPPHA_NUMERIC'];
    } else if (value.toUpperCase().contains("NUMBER")) {
      return myMap['NUMERIC'];
    }else{
      return myMap['NUMERIC']; 
    }
  }
}
