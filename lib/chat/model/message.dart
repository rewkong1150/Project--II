class Message {
  final String userId;
  final String userName;
  final String roomId;
  final String message;
  final int messageType;
  final DateTime createdAt;

  const Message({
    this.userId,
    this.userName,
    this.roomId,
    this.message,
    this.messageType,
    this.createdAt,
  });

  static Message fromJson(Map<String, dynamic> json) => Message(
        userId: json['userId'],
        userName: json['userName'],
        roomId: json['roomId'],
        message: json['message'],
        messageType: json['messageType'],
        createdAt: json['createdAt']?.toDate(),
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'roomId': roomId,
        'message': message,
        'messageType': messageType,
        'createdAt': createdAt.toUtc(),
      };
}
