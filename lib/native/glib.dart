// ignore_for_file: non_constant_identifier_names
// cspell: ignore libglib pdata

import 'dart:collection';
import 'dart:ffi';

import 'package:deckhub/native/flatpak.dart';
import 'package:ffi/ffi.dart';

final _lib = DynamicLibrary.open(isSandBoxed
    ? '/usr/lib/x86_64-linux-gnu/libglib-2.0.so.0'
    : 'libglib-2.0.so');

final _g_error_free =
    _lib.lookupFunction<Void Function(Pointer), void Function(Pointer)>(
        "g_error_free");

final _g_ptr_array_free =
    _lib.lookupFunction<Void Function(Pointer), void Function(Pointer)>(
        "g_ptr_array_free");

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
      _g_error_free(error);
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
    _g_ptr_array_free(inner);
  }
}
