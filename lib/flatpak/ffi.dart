// ignore_for_file: non_constant_identifier_names
// cspell: ignore libflatpak libgobject libgio libglib pdata

import 'dart:collection';
import 'dart:ffi';

import 'package:deckhub/utils/std.dart';

import 'package:ffi/ffi.dart';

final _LibFlatpak _flatpak = _LibFlatpak(DynamicLibrary.open('libflatpak.so'));
late final _LibGObject _gobject =
    _LibGObject(DynamicLibrary.open('libgobject-2.0.so'));
late final _LibGio _gio =
    _LibGio(DynamicLibrary.open('libgio-2.0.so'));
late final _LibGLib _glib =
    _LibGLib(DynamicLibrary.open('libglib-2.0.so'));

void initLibFlatpak() {
  // _flatpak = _LibFlatpak(DynamicLibrary.open('libflatpak.so'));
  // print("Loading Flatpak FFI");
  // print(_flatpak);
  // _gobject = _LibGObject(DynamicLibrary.open('libgobject-2.0.so'));
  // _gio = _LibGio(DynamicLibrary.open('libgio-2.0.so'));
  // _glib = _LibGLib(DynamicLibrary.open('libglib-2.0.so'));
}

class FlatpakInstallation extends GObject {
  factory FlatpakInstallation.system() {
    final error = GLibError.allocate();
    final installation = _flatpak.installation_new_system(nullptr, error);
    error.throwIfError();
    return FlatpakInstallation.fromPointer(installation);
  }

  factory FlatpakInstallation.user() {
    final error = GLibError.allocate();
    final installation = _flatpak.installation_new_user(nullptr, error);
    error.throwIfError();
    return FlatpakInstallation.fromPointer(installation);
  }

  factory FlatpakInstallation.forPath(GioFile file, bool user) {
    final error = GLibError.allocate();
    final installation =
        _flatpak.installation_new_for_path(file.ptr, user, nullptr, error);
    error.throwIfError();
    return FlatpakInstallation.fromPointer(installation);
  }

  FlatpakInstallation.fromPointer(super.ptr) : super.fromPointer();

  GPtrList<FlatpakInstalledRef> listInstalledRefs() {
    final error = GLibError.allocate();
    final refs = _flatpak.installation_list_installed_refs(ptr, nullptr, error);
    error.throwIfError();

    return GPtrList(refs, FlatpakInstalledRef.fromPointer);
  }

  GPtrList<FlatpakInstalledRef> listInstalledRefsForUpdate() {
    final error = GLibError.allocate();
    final refs = _flatpak.installation_list_installed_refs_for_update(
        ptr, nullptr, error);
    error.throwIfError();

    return GPtrList(refs, FlatpakInstalledRef.fromPointer);
  }

  String get id {
    return _flatpak.installation_get_id(ptr).toDartString();
  }

  bool get isUser {
    return _flatpak.installation_get_is_user(ptr);
  }
}

class FlatpakRef extends GObject {
  FlatpakRef.fromPointer(super.ptr) : super.fromPointer();

  String get name {
    return _flatpak.ref_get_name(ptr).toDartString();
  }

  String get arch {
    return _flatpak.ref_get_arch(ptr).toDartString();
  }

  String get branch {
    return _flatpak.ref_get_branch(ptr).toDartString();
  }

  String? get collectionId {
    return _flatpak.ref_get_collection_id(ptr).toDartStringOrNull();
  }

  String get commit {
    return _flatpak.ref_get_commit(ptr).toDartString();
  }

  FlatpakRefKind get kind {
    return FlatpakRefKind.values[_flatpak.ref_get_kind(ptr)];
  }
}

class FlatpakInstalledRef extends FlatpakRef {
  FlatpakInstalledRef.fromPointer(super.ptr) : super.fromPointer();

  String? get appdataName {
    return _flatpak.installed_ref_get_appdata_name(ptr).toDartStringOrNull();
  }

  bool get isCurrent => _flatpak.installed_ref_get_is_current(ptr);

  int get installedSize => _flatpak.installed_ref_get_installed_size(ptr);

  String? get deployDir {
    return _flatpak.installed_ref_get_deploy_dir(ptr).toDartStringOrNull();
  }

  String? get latestCommit {
    return _flatpak.installed_ref_get_latest_commit(ptr).toDartStringOrNull();
  }

  String? get origin {
    return _flatpak.installed_ref_get_origin(ptr).toDartStringOrNull();
  }

  String? get appdataLicense {
    return _flatpak.installed_ref_get_appdata_license(ptr).toDartStringOrNull();
  }

  String? get appdataSummary {
    return _flatpak.installed_ref_get_appdata_summary(ptr).toDartStringOrNull();
  }

  String? get appdataVersion {
    return _flatpak.installed_ref_get_appdata_version(ptr).toDartStringOrNull();
  }

  String? get eol {
    return _flatpak.installed_ref_get_eol(ptr).toDartStringOrNull();
  }

  String? get eolRebase {
    return _flatpak.installed_ref_get_eol_rebase(ptr).toDartStringOrNull();
  }
}

enum FlatpakRefKind {
  app,
  runtime,
}

class GioFile extends GObject {
  GioFile.forPath(String path)
      : super.fromPointer(_gio.file_new_for_path(path.toNativeUtf8()));

  GioFile.fromPointer(super.ptr) : super.fromPointer();
}

final class GLibError extends Struct {
  @Uint32()
  external int domain;
  @Int32()
  external int code;
  external Pointer<Utf8> message;

  static Pointer<Pointer<GLibError>> allocate() {
    return calloc<Pointer<GLibError>>();
  }
}

extension GLibErrorExt on Pointer<Pointer<GLibError>> {
  void throwIfError() {
    final error = value;
    if (error != nullptr) {
      final message = error.ref.message.toDartString();
      _glib.g_error_free(error);
      throw Exception("GLib Error: $message");
    }
  }
}

final class GPtrArray extends Struct {
  external Pointer<Pointer> pdata;
  @Int32()
  external int len;
}

extension GPtrArrayExt on Pointer<GPtrArray> {
  List<T> toList<T>(T Function(Pointer) fromPointer) {
    final list = <T>[];
    for (var i = 0; i < ref.len; i++) {
      list.add(fromPointer((ref.pdata + i).value));
    }
    // g_ptr_array_free(this);
    return list;
  }
}

class GPtrList<T> with ListMixin<T> {
  final Pointer<GPtrArray> inner;
  final Function(Pointer) fromPointer;

  GPtrList(this.inner, this.fromPointer);

  @override
  int get length => inner.ref.len;

  @override
  T operator [](int index) {
    return fromPointer((inner.ref.pdata + index).value);
  }

  @override
  void operator []=(int index, T value) {
    throw UnsupportedError("Cannot change elements of GPtrList");
  }

  @override
  set length(int newLength) {
    throw UnsupportedError("Cannot change length of GPtrList");
  }

  void free() {
    _glib.g_ptr_array_free(inner);
  }
}

class GObject {
  final Pointer ptr;

  GObject.fromPointer(this.ptr);
  void unref() {
    _gobject.unref(ptr);
  }
}

class _LibFlatpak {
  final DynamicLibrary _lib;

  _LibFlatpak(this._lib);

  late final installation_new_system = _lib.lookupFunction<
      Pointer Function(Pointer, Pointer),
      Pointer Function(Pointer, Pointer)>("flatpak_installation_new_system");

  late final installation_new_user = _lib.lookupFunction<
      Pointer Function(Pointer, Pointer),
      Pointer Function(Pointer, Pointer)>("flatpak_installation_new_user");

  late final installation_new_for_path = _lib.lookupFunction<
      Pointer Function(Pointer, Bool, Pointer, Pointer),
      Pointer Function(Pointer, bool, Pointer,
          Pointer)>("flatpak_installation_new_for_path");

  late final installation_list_installed_refs = _lib.lookupFunction<
      Pointer<GPtrArray> Function(Pointer, Pointer, Pointer),
      Pointer<GPtrArray> Function(Pointer, Pointer,
          Pointer)>("flatpak_installation_list_installed_refs");

  late final installation_get_id = _lib.lookupFunction<
      Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(Pointer)>("flatpak_installation_get_id");

  late final installation_get_is_user =
      _lib.lookupFunction<Bool Function(Pointer), bool Function(Pointer)>(
          "flatpak_installation_get_is_user");

  late final installation_list_installed_refs_for_update = _lib.lookupFunction<
      Pointer<GPtrArray> Function(Pointer, Pointer, Pointer),
      Pointer<GPtrArray> Function(Pointer, Pointer,
          Pointer)>("flatpak_installation_list_installed_refs_for_update");

  late final ref_get_name = _lib.lookupFunction<Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(Pointer)>("flatpak_ref_get_name");

  late final ref_get_arch = _lib.lookupFunction<Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(Pointer)>("flatpak_ref_get_arch");

  late final ref_get_branch = _lib.lookupFunction<
      Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(Pointer)>("flatpak_ref_get_branch");

  late final ref_get_collection_id = _lib.lookupFunction<
      Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(Pointer)>("flatpak_ref_get_collection_id");

  late final ref_get_commit = _lib.lookupFunction<
      Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(Pointer)>("flatpak_ref_get_commit");

  late final ref_get_kind =
      _lib.lookupFunction<Uint32 Function(Pointer), int Function(Pointer)>(
          "flatpak_ref_get_kind");

  late final installed_ref_get_appdata_name = _lib.lookupFunction<
      Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(
          Pointer)>("flatpak_installed_ref_get_appdata_name");

  late final installed_ref_get_is_current =
      _lib.lookupFunction<Bool Function(Pointer), bool Function(Pointer)>(
          "flatpak_installed_ref_get_is_current");

  late final installed_ref_get_installed_size =
      _lib.lookupFunction<Uint64 Function(Pointer), int Function(Pointer)>(
          "flatpak_installed_ref_get_installed_size");

  late final installed_ref_get_deploy_dir = _lib.lookupFunction<
      Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(Pointer)>("flatpak_installed_ref_get_deploy_dir");

  late final installed_ref_get_latest_commit = _lib.lookupFunction<
      Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(
          Pointer)>("flatpak_installed_ref_get_latest_commit");

  late final installed_ref_get_origin = _lib.lookupFunction<
      Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(Pointer)>("flatpak_installed_ref_get_origin");

  late final installed_ref_get_appdata_license = _lib.lookupFunction<
      Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(
          Pointer)>("flatpak_installed_ref_get_appdata_license");

  late final installed_ref_get_appdata_summary = _lib.lookupFunction<
      Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(
          Pointer)>("flatpak_installed_ref_get_appdata_summary");

  late final installed_ref_get_appdata_version = _lib.lookupFunction<
      Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(
          Pointer)>("flatpak_installed_ref_get_appdata_version");

  late final installed_ref_get_eol = _lib.lookupFunction<
      Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(Pointer)>("flatpak_installed_ref_get_eol");

  late final installed_ref_get_eol_rebase = _lib.lookupFunction<
      Pointer<Utf8> Function(Pointer),
      Pointer<Utf8> Function(Pointer)>("flatpak_installed_ref_get_eol_rebase");
}

class _LibGObject {
  final DynamicLibrary _lib;

  _LibGObject(this._lib);

  late final unref =
      _lib.lookupFunction<Void Function(Pointer), void Function(Pointer)>(
          "g_object_unref");
}

class _LibGio {
  final DynamicLibrary _lib;

  _LibGio(this._lib);

  late final file_new_for_path = _lib.lookupFunction<
      Pointer Function(Pointer<Utf8>),
      Pointer Function(Pointer<Utf8>)>("g_file_new_for_path");
}

class _LibGLib {
  final DynamicLibrary _lib;

  _LibGLib(this._lib);

  late final g_error_free =
      _lib.lookupFunction<Void Function(Pointer), void Function(Pointer)>(
          "g_error_free");

  late final g_ptr_array_free =
      _lib.lookupFunction<Void Function(Pointer), void Function(Pointer)>(
          "g_ptr_array_free");
}
