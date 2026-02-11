import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/guest_data.dart';
import '../utils/firebase_service.dart';

part 'guest_provider.g.dart';

/// Provider for current guest ID from URL
@riverpod
class GuestId extends _$GuestId {
  @override
  String? build() => null;
  
  void set(String? id) => state = id;
}

/// Provider for loading guest data from Firebase
@riverpod
Future<GuestData?> guestData(Ref ref) async {
  final guestId = ref.watch(guestIdProvider);
  
  if (guestId == null || guestId.isEmpty) {
    return null;
  }

  final service = FirebaseService();
  return await service.getGuestData(guestId);
}
