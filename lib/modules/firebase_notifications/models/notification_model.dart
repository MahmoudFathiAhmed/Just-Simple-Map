class NotificationData {
  final int id;
  final String title;
  final String body;
  final DateTime date;

  NotificationData({
    required this.id,
    required this.title,
    required this.body,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'date': date.millisecondsSinceEpoch,
    };
  }

  static NotificationData fromMap(Map<String, dynamic> map) {
    return NotificationData(
      id: map['id'],
      title: map['title'],
      body: map['body'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
    );
  }
}
