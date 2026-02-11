import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/guest_data.dart';

class FirebaseService {
  final firestore = FirebaseFirestore.instance;

  /// Seed guests from JSON to Firestore
  Future<void> seedGuestsFromJson() async {
    final jsonString = await rootBundle.loadString('assets/doc/guests.json');
    final Map<String, dynamic> data = json.decode(jsonString);
    log('Loaded guest data from JSON: ${data.length} entries');
    log('Sample entry: ${data.entries.first}');
    final batch = firestore.batch();

    for (final entry in data.entries) {
      final docId = entry.key;
      final Map<String, dynamic> guestMap =
          Map<String, dynamic>.from(entry.value);

      final docRef = firestore.collection('guests').doc(docId);

      batch.set(docRef, {
        ...guestMap,
        'createdAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    }

    await batch.commit();
  }

  /// Get guest data by ID
  Future<GuestData?> getGuestData(String docId) async {
    try {
      final doc = await firestore.collection('guests').doc(docId).get();
      
      if (!doc.exists) {
        log('Guest not found: $docId');
        return null;
      }

      final data = doc.data();
      if (data == null) return null;

      return GuestData.fromJson(docId, data);
    } catch (e, s) {
      log('Error fetching guest data: $e');
      log('Stack trace: $s');
      return null;
    }
  }

  /// Send RSVP response
  Future<void> sendResponse({
    required String docId,
    required bool attending,
    required int guestsCount,
  }) async {
    final ref = firestore.collection('guests').doc(docId);
    final snap = await ref.get();

    if (!snap.exists) {
      log('Cannot send response: guest $docId not found');
      return;
    }

    try {
      await firestore.collection('guests').doc(docId).set({
      'attending': attending,
      'guestsCount': guestsCount,
      'responded': true,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
    } catch (e, s) {
      log('Error sending response for guest $docId: $e');
      log('Stack trace: $s');
    }
    
    log('Response sent for guest: $docId');
  }
}