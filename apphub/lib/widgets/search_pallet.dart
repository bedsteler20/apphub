import 'package:auto_route/auto_route.dart';
import 'package:deckhub/gen/strings.g.dart';
import 'package:deckhub/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flux/flux.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchPallet extends HookConsumerWidget {
  const SearchPallet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode(
      onKeyEvent: (node, event) {
        if (event is KeyUpEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
            node.nextFocus();
            return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
    );

    return Dialog(
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.topCenter,
      insetPadding: const EdgeInsets.only(top: 60, left: 16, right: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SizedBox(
          width: context.breakpoint(SM),
          child: TextField(
            autofocus: true,
            focusNode: focusNode,
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                context.router.push(
                  SearchRoute(query: value, page: 1, pageSize: 42),
                );
                Navigator.of(context).pop();
              } else {
                focusNode.requestFocus();
              }
            },
            decoration: InputDecoration(
              labelText: t.search.search,
              hintText: t.search.searchPlaceholder,
              prefixIcon: const Icon(Icons.search_rounded),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return const SearchPallet();
      },
    );
  }
}
