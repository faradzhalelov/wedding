// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider for current guest ID from URL

@ProviderFor(GuestId)
const guestIdProvider = GuestIdProvider._();

/// Provider for current guest ID from URL
final class GuestIdProvider extends $NotifierProvider<GuestId, String?> {
  /// Provider for current guest ID from URL
  const GuestIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guestIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guestIdHash();

  @$internal
  @override
  GuestId create() => GuestId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$guestIdHash() => r'547bd05f22c58c9026d9e946c2666051313437a6';

/// Provider for current guest ID from URL

abstract class _$GuestId extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provider for loading guest data from Firebase

@ProviderFor(guestData)
const guestDataProvider = GuestDataProvider._();

/// Provider for loading guest data from Firebase

final class GuestDataProvider
    extends
        $FunctionalProvider<
          AsyncValue<GuestData?>,
          GuestData?,
          FutureOr<GuestData?>
        >
    with $FutureModifier<GuestData?>, $FutureProvider<GuestData?> {
  /// Provider for loading guest data from Firebase
  const GuestDataProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'guestDataProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$guestDataHash();

  @$internal
  @override
  $FutureProviderElement<GuestData?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<GuestData?> create(Ref ref) {
    return guestData(ref);
  }
}

String _$guestDataHash() => r'e33db8638c8532f39067c10a3e86963ddbd7c160';
