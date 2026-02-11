# Персонализированные приглашения - Документация

## Реализованная функциональность

### 1. Архитектура

#### Созданные файлы:
- `lib/models/guest_data.dart` - модель данных гостя
- `lib/providers/guest_provider.dart` - Riverpod providers для управления состоянием

#### Обновленные файлы:
- `lib/utils/firebase_service.dart` - добавлены методы работы с гостями
- `lib/main.dart` - добавлен парсинг URL и ProviderScope
- `lib/home_page.dart` - обновлен на ConsumerStatefulWidget
- `lib/sections/rsvp_section.dart` - интеграция с Firebase и персонализация
- `web/index.html` - добавлены Open Graph мета-теги для preview

### 2. Логика работы

#### URL Routing
```
https://wedding.authsfera.com/       → Обычная форма RSVP
https://wedding.authsfera.com/nariman → Персонализированное приглашение для Nariman
```

**Парсинг URL** (`main.dart`):
```dart
void _parseUrlAndSetGuest() {
  final path = html.window.location.pathname ?? '/';
  if (path.length > 1) {
    final guestId = path.substring(1); // убираем '/'
    ref.read(guestIdProvider.notifier).state = guestId;
  }
}
```

#### Загрузка данных гостя

**Provider** (`guest_provider.dart`):
```dart
final guestIdProvider = StateProvider<String?>((ref) => null);

final guestDataProvider = FutureProvider<GuestData?>((ref) async {
  final guestId = ref.watch(guestIdProvider);
  if (guestId == null || guestId.isEmpty) return null;
  
  final service = FirebaseService();
  return await service.getGuestData(guestId);
});
```

**Firebase Service** (`firebase_service.dart`):
```dart
Future<GuestData?> getGuestData(String docId) async {
  final doc = await firestore.collection('guests').doc(docId).get();
  if (!doc.exists) return null;
  return GuestData.fromJson(docId, doc.data()!);
}
```

#### Персонализация RSVP формы

В `RsvpSection`:
- Если есть `guestData`, поле имени заменяется на **read-only блок** с приветствием из JSON (`message`)
- Предзаполняются значения: `guestsCount`, `attending`
- Без `guestData` отображается обычная форма с вводом имени

```dart
if (_guestData != null) ...[
  _FormLabel('Приглашение'),
  Container(/* read-only блок с message */),
] else ...[
  _FormLabel(l10n.rsvpYourName),
  TextFormField(/* обычный ввод */),
]
```

#### Отправка ответа

**Submit в RsvpSection**:
```dart
Future<void> _submit() async {
  if (_guestId != null && _guestId!.isNotEmpty) {
    final service = FirebaseService();
    await service.sendResponse(
      docId: _guestId!,
      attending: _attending,
      guestsCount: _guestCount,
    );
  }
}
```

**Firebase Service**:
```dart
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
    'responded': true,
    'updatedAt': FieldValue.serverTimestamp(),
  }, SetOptions(merge: true));
}
```

### 3. Данные гостя (guests.json)

Структура документа в Firestore:
```json
{
  "name": "Нариман",
  "message": "Уважаемый Нариман",
  "guestsCount": 1,
  "attending": false,
  "responded": false
}
```

После ответа добавляются:
- `responded: true`
- `updatedAt: Timestamp`
- Обновляются `attending` и `guestsCount`

### 4. Social Media Preview

В `web/index.html` добавлены Open Graph и Twitter Card мета-теги:
```html
<meta property="og:title" content="Farkhat & Riza — Wedding Invitation">
<meta property="og:description" content="Приглашение на свадьбу. Астана, Июнь 2026.">
<meta property="og:image" content="[URL изображения]">
```

Это обеспечивает красивый preview при шаринге ссылок.

### 5. State Management

Используется **Riverpod**:
- `guestIdProvider` - хранит текущий guestId из URL
- `guestDataProvider` - асинхронно загружает данные из Firebase
- `ConsumerWidget`/`ConsumerStatefulWidget` для доступа к providers

### 6. Тестирование

#### Локально:
```bash
flutter run -d chrome
```

Откройте:
- `http://localhost:port/` - обычная форма
- `http://localhost:port/nariman` - персонализированная для nariman

#### Production:
```
https://wedding.authsfera.com/nariman
https://wedding.authsfera.com/ruslan
```

### 7. Workflow

1. **Пользователь открывает URL** с guestId (например `/nariman`)
2. **main.dart** парсит URL и сохраняет guestId в provider
3. **RsvpSection** подписывается на `guestDataProvider`
4. **Firebase загружает** данные из `guests/nariman`
5. **Форма обновляется**: 
   - Показывает приветствие из `message`
   - Предзаполняет `guestsCount`
6. **Гость выбирает** attending/decline и количество гостей
7. **Submit**: данные сохраняются в Firebase
8. **Success screen** подтверждает ответ

### 8. Безопасность

- Без авторизации: любой с ссылкой может ответить
- Firestore Rules должны разрешать:
  - READ на `guests/{guestId}` 
  - UPDATE только полей `attending`, `guestsCount`, `responded`, `updatedAt`

Пример правил:
```javascript
match /guests/{guestId} {
  allow read: if true;
  allow update: if request.resource.data.keys().hasOnly([
    'attending', 'guestsCount', 'responded', 'updatedAt'
  ]);
}
```

### 9. Дальнейшие улучшения

- [ ] Server-side rendering для meta tags (для разных гостей)
- [ ] Analytics трекинг открытий ссылок
- [ ] Защита от повторных ответов (проверка `responded`)
- [ ] Email уведомления при ответе
- [ ] Admin панель для управления гостями
