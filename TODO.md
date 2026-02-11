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
