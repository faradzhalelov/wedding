Отредактировать текста

Отредактировать фото
    десткое
    первое свидание
    вместе
    да, предложение

Место проведения
Переход в карты

Добавить в календарь

Программа мероприятия

Стиль

Логика Присоединиться
через firebase
final firestore = FirebaseFirestore.instance;



Future<void> sendResponse({
  required String docId,
  required bool attending,
  required int guestsCount,
}) async {
    final ref = firestore.collection('guests').doc(docId);
final snap = await ref.get();

if (!snap.exists) return;

  await firestore.collection('guests').doc(docId).set({
    'attending': attending,
    'guestsCount': guestsCount,
    'responded' : true,
    'updatedAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));
}


Добавить кнопку локализации (dropdown overlay)

Build
flutter build web --web-renderer html

Добавление из json

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> seedGuestsFromJson() async {
  final firestore = FirebaseFirestore.instance;

  final jsonString = await rootBundle.loadString('assets/doc/guests.json');
  final Map<String, dynamic> data = json.decode(jsonString);

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
