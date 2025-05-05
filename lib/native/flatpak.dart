// ignore_for_file: non_constant_identifier_names
// cspell: ignore libflatpak

import 'dart:ffi';
import 'dart:io';

import 'package:deckhub/utils/std.dart';

import 'gio.dart';
import 'glib.dart';
import 'gobject.dart';
import 'package:ffi/ffi.dart';

final isSandBoxed = Platform.environment.containsKey('FLATPAK_ID');

class FlatpakInstallation extends GObject {
  factory FlatpakInstallation.system() {
    final error = GLibError.allocate();
    final installation = _flatpak_installation_new_system(nullptr, error);
    error.throwIfError();
    return FlatpakInstallation.fromPointer(installation);
  }

  factory FlatpakInstallation.user() {
    if (isSandBoxed) {
      final error = GLibError.allocate();
      final installation = _flatpak_installation_new_user(nullptr, error);
      error.throwIfError();
      return FlatpakInstallation.fromPointer(installation);
    } else {
      final file = GioFile.forPath(
          "${Platform.environment['HOME']!}/.local/share/flatpak");
      return FlatpakInstallation.forPath(file, true);
    }
  }

  factory FlatpakInstallation.forPath(GioFile file, bool user) {
    final error = GLibError.allocate();
    final installation =
        _flatpak_installation_new_for_path(file.ptr, user, nullptr, error);
    error.throwIfError();
    return FlatpakInstallation.fromPointer(installation);
  }

  FlatpakInstallation.fromPointer(super.ptr) : super.fromPointer();

  GPtrList<FlatpakInstalledRef> listInstalledRefs() {
    final error = GLibError.allocate();
    final refs = _flatpak_installation_list_installed_refs(ptr, nullptr, error);
    error.throwIfError();

    return GPtrList(refs, FlatpakInstalledRef.fromPointer);
  }

  GPtrList<FlatpakInstalledRef> listInstalledRefsForUpdate() {
    final error = GLibError.allocate();
    final refs = _flatpak_installation_list_installed_refs_for_update(
        ptr, nullptr, error);
    error.throwIfError();

    return GPtrList(refs, FlatpakInstalledRef.fromPointer);
  }

  String get id {
    return _flatpak_installation_get_id(ptr).toDartString();
  }

  bool get isUser {
    return _flatpak_installation_get_is_user(ptr);
  }
}

class FlatpakRef extends GObject {
  FlatpakRef.fromPointer(super.ptr) : super.fromPointer();

  String get name {
    return _flatpak_ref_get_name(ptr).toDartString();
  }

  String get arch {
    return _flatpak_ref_get_arch(ptr).toDartString();
  }

  String get branch {
    return _flatpak_ref_get_branch(ptr).toDartString();
  }

  String? get collectionId {
    return _flatpak_ref_get_collection_id(ptr).toDartStringOrNull();
  }

  String get commit {
    return _flatpak_ref_get_commit(ptr).toDartString();
  }

  FlatpakRefKind get kind {
    return FlatpakRefKind.values[_flatpak_ref_get_kind(ptr)];
  }
}

class FlatpakInstalledRef extends FlatpakRef {
  FlatpakInstalledRef.fromPointer(super.ptr) : super.fromPointer();

  String? get appdataName {
    return _flatpak_installed_ref_get_appdata_name(ptr).toDartStringOrNull();
  }

  bool get isCurrent => _flatpak_installed_ref_get_is_current(ptr);

  int get installedSize => _flatpak_installed_ref_get_installed_size(ptr);

  String? get deployDir {
    return _flatpak_installed_ref_get_deploy_dir(ptr).toDartStringOrNull();
  }

  String? get latestCommit {
    return _flatpak_installed_ref_get_latest_commit(ptr).toDartStringOrNull();
  }

  String? get origin {
    return _flatpak_installed_ref_get_origin(ptr).toDartStringOrNull();
  }

  String? get appdataLicense {
    return _flatpak_installed_ref_get_appdata_license(ptr).toDartStringOrNull();
  }

  String? get appdataSummary {
    return _flatpak_installed_ref_get_appdata_summary(ptr).toDartStringOrNull();
  }

  String? get appdataVersion {
    return _flatpak_installed_ref_get_appdata_version(ptr).toDartStringOrNull();
  }

  String? get eol {
    return _flatpak_installed_ref_get_eol(ptr).toDartStringOrNull();
  }

  String? get eolRebase {
    return _flatpak_installed_ref_get_eol_rebase(ptr).toDartStringOrNull();
  }
}

enum FlatpakRefKind {
  app,
  runtime,
}

final _lib = DynamicLibrary.open(isSandBoxed
    ? "/app/lib/libflatpak.so"
    : "libflatpak.so");

// ================ FlatpakInstallation ================

// Constructors
final _flatpak_installation_new_system = _lib.lookupFunction<
    Pointer Function(Pointer, Pointer),
    Pointer Function(Pointer, Pointer)>("flatpak_installation_new_system");

final _flatpak_installation_new_user = _lib.lookupFunction<
    Pointer Function(Pointer, Pointer),
    Pointer Function(Pointer, Pointer)>("flatpak_installation_new_user");

final _flatpak_installation_new_for_path = _lib.lookupFunction<
    Pointer Function(Pointer, Bool, Pointer, Pointer),
    Pointer Function(
        Pointer, bool, Pointer, Pointer)>("flatpak_installation_new_for_path");

// Methods
final _flatpak_installation_list_installed_refs = _lib.lookupFunction<
    Pointer<GPtrArray> Function(Pointer, Pointer, Pointer),
    Pointer<GPtrArray> Function(
        Pointer, Pointer, Pointer)>("flatpak_installation_list_installed_refs");

// Getters
final _flatpak_installation_get_id = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(Pointer)>("flatpak_installation_get_id");

final _flatpak_installation_get_is_user =
    _lib.lookupFunction<Bool Function(Pointer), bool Function(Pointer)>(
        "flatpak_installation_get_is_user");

final _flatpak_installation_list_installed_refs_for_update =
    _lib.lookupFunction<
        Pointer<GPtrArray> Function(Pointer, Pointer, Pointer),
        Pointer<GPtrArray> Function(Pointer, Pointer,
            Pointer)>("flatpak_installation_list_installed_refs_for_update");

// ================ FlatpakRef ================

// Getters
final _flatpak_ref_get_name = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(Pointer)>("flatpak_ref_get_name");

final _flatpak_ref_get_arch = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(Pointer)>("flatpak_ref_get_arch");

final _flatpak_ref_get_branch = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(Pointer)>("flatpak_ref_get_branch");

final _flatpak_ref_get_collection_id = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(Pointer)>("flatpak_ref_get_collection_id");

final _flatpak_ref_get_commit = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(Pointer)>("flatpak_ref_get_commit");

final _flatpak_ref_get_kind =
    _lib.lookupFunction<Uint32 Function(Pointer), int Function(Pointer)>(
        "flatpak_ref_get_kind");

// ================ FlatpakInstalledRef ================

// Getters
final _flatpak_installed_ref_get_appdata_name = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(Pointer)>("flatpak_installed_ref_get_appdata_name");

final _flatpak_installed_ref_get_is_current =
    _lib.lookupFunction<Bool Function(Pointer), bool Function(Pointer)>(
        "flatpak_installed_ref_get_is_current");

final _flatpak_installed_ref_get_installed_size =
    _lib.lookupFunction<Uint64 Function(Pointer), int Function(Pointer)>(
        "flatpak_installed_ref_get_installed_size");

final _flatpak_installed_ref_get_deploy_dir = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(Pointer)>("flatpak_installed_ref_get_deploy_dir");

final _flatpak_installed_ref_get_latest_commit = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(Pointer)>("flatpak_installed_ref_get_latest_commit");

final _flatpak_installed_ref_get_origin = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(Pointer)>("flatpak_installed_ref_get_origin");

final _flatpak_installed_ref_get_appdata_license = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(
        Pointer)>("flatpak_installed_ref_get_appdata_license");

final _flatpak_installed_ref_get_appdata_summary = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(
        Pointer)>("flatpak_installed_ref_get_appdata_summary");

final _flatpak_installed_ref_get_appdata_version = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(
        Pointer)>("flatpak_installed_ref_get_appdata_version");

final _flatpak_installed_ref_get_eol = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(Pointer)>("flatpak_installed_ref_get_eol");

final _flatpak_installed_ref_get_eol_rebase = _lib.lookupFunction<
    Pointer<Utf8> Function(Pointer),
    Pointer<Utf8> Function(Pointer)>("flatpak_installed_ref_get_eol_rebase");
