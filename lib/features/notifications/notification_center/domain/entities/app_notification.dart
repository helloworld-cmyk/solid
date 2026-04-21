class AppNotification {
  const AppNotification({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.type,
    this.isUnread = false,
  });

  final String id;
  final String content;
  final String timestamp;
  final String type;
  final bool isUnread;

  AppNotification copyWith({
    String? id,
    String? content,
    String? timestamp,
    String? type,
    bool? isUnread,
  }) {
    return AppNotification(
      id: id ?? this.id,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      type: type ?? this.type,
      isUnread: isUnread ?? this.isUnread,
    );
  }
}
