// ignore_for_file: non_constant_identifier_names

// cspell: ignore libgio
import 'package:deckhub/native/flatpak.dart';
import 'package:ffi/ffi.dart';

import 'gobject.dart';

import 'dart:ffi';

final _lib = DynamicLibrary.open(isSandBoxed
    ? '/usr/lib/x86_64-linux-gnu/libgio-2.0.so.0'
    : 'libgio-2.0.so');

final _gio_file_new_for_path = _lib.lookupFunction<
    Pointer Function(Pointer<Utf8>),
    Pointer Function(Pointer<Utf8>)>("g_file_new_for_path");

class GioFile extends GObject {
  GioFile.forPath(String path)
      : super.fromPointer(_gio_file_new_for_path(path.toNativeUtf8()));

  GioFile.fromPointer(super.ptr) : super.fromPointer();
}
