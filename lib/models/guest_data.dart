/// Guest data model matching guests.json structure
class GuestData {
  const GuestData({
    required this.id,
    required this.name,
    required this.message,
    required this.guestsCount,
    required this.attending,
    required this.responded,
  });

  final String id;
  final String name;
  final String message;
  final int guestsCount;
  final bool attending;
  final bool responded;

  factory GuestData.fromJson(String id, Map<String, dynamic> json) {
    return GuestData(
      id: id,
      name: json['name'] as String? ?? '',
      message: json['message'] as String? ?? '',
      guestsCount: json['guestsCount'] as int? ?? 1,
      attending: json['attending'] as bool? ?? false,
      responded: json['responded'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'message': message,
      'guestsCount': guestsCount,
      'attending': attending,
      'responded': responded,
    };
  }
}
