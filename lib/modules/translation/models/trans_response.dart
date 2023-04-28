class TransResponse {
  String? englishText;
  String? arabicText;

  TransResponse({this.englishText, this.arabicText});

  TransResponse.fromJson(Map<String, dynamic> json) {
    englishText = json['englishText'];
    arabicText = json['arabicText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['englishText'] = englishText;
    data['arabicText'] = arabicText;
    return data;
  }
}