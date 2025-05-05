// ignore_for_file: non_constant_identifier_names
// cspell: ignore libgobject

import 'dart:ffi';

import 'package:deckhub/native/flatpak.dart';

final _lib = DynamicLibrary.open(isSandBoxed
    ? '/usr/lib/x86_64-linux-gnu/libgobject-2.0.so.0'
    : 'libgobject-2.0.so');

final _g_object_unref =
    _lib.lookupFunction<Void Function(Pointer), void Function(Pointer)>(
        "g_object_unref");

class GObject {
  final Pointer ptr;

  GObject.fromPointer(this.ptr);
  void unref() {
    _g_object_unref(ptr);
  }
}
