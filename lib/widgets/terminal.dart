// cspell: ignore assumeyes noninteractive
import 'dart:convert';

import 'package:deckhub/flatpak/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pty/flutter_pty.dart';
import 'package:flux/flux.dart';
import 'package:xterm/core.dart';
import 'package:xterm/ui.dart';

class TerminalWidget extends StatefulWidget {
  final String command;
  final List<String> arguments;
  final VoidCallback? onExit;

  const TerminalWidget({
    super.key,
    required this.command,
    required this.arguments,
    this.onExit,
  });

  @override
  State<TerminalWidget> createState() => _TerminalWidgetState();
}

class _TerminalWidgetState extends State<TerminalWidget> {
  final terminal = Terminal(
    maxLines: 200,
  );

  final terminalController = TerminalController();

  late final Pty pty;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.endOfFrame.then((_) {
      if (mounted) _startPty();
    });
  }

  void _startPty() {
    pty = Pty.start(
      isSandBoxed ? 'flatpak-spawn' : widget.command,
      arguments: [
        if (isSandBoxed) ...[
          '--host',
          widget.command,
        ],
        ...widget.arguments,
      ],
      columns: terminal.viewWidth,
      rows: terminal.viewHeight,
    );

    pty.output
        .cast<List<int>>()
        .transform(const Utf8Decoder())
        .listen(terminal.write);

    pty.exitCode.then((code) {
      terminal.write('the process exited with exit code $code');
      widget.onExit?.call();
    });

    terminal.onResize = (w, h, pw, ph) {
      pty.resize(h, w);
    };
  }

  @override
  void dispose() {
    super.dispose();
    terminalController.dispose();
    pty.kill();
  }

  @override
  Widget build(BuildContext context) {
    return TerminalView(
      terminal,
      controller: terminalController,
      autofocus: false,
      hardwareKeyboardOnly: true,
      theme: TerminalTheme(
        cursor: const Color(0XAAAEAFAD),
        selection: const Color(0XAAAEAFAD),
        foreground: context.theme.colorScheme.onSurface,
        background: context.theme.colorScheme.surface,
        black: const Color(0XFF000000),
        red: const Color(0XFFCD3131),
        green: const Color(0XFF0DBC79),
        yellow: const Color(0XFFE5E510),
        blue: const Color(0XFF2472C8),
        magenta: const Color(0XFFBC3FBC),
        cyan: const Color(0XFF11A8CD),
        white: const Color(0XFFE5E5E5),
        brightBlack: const Color(0XFF666666),
        brightRed: const Color(0XFFF14C4C),
        brightGreen: const Color(0XFF23D18B),
        brightYellow: const Color(0XFFF5F543),
        brightBlue: const Color(0XFF3B8EEA),
        brightMagenta: const Color(0XFFD670D6),
        brightCyan: const Color(0XFF29B8DB),
        brightWhite: const Color(0XFFFFFFFF),
        searchHitBackground: const Color(0XFFFFFF2B),
        searchHitBackgroundCurrent: const Color(0XFF31FF26),
        searchHitForeground: const Color(0XFF000000),
      ),
    );
  }
}

class CommandTerminalDialog extends StatelessWidget {
  final String command;
  final List<String> arguments;
  final Function(bool)? onExit;

  const CommandTerminalDialog({
    super.key,
    required this.command,
    required this.arguments,
    this.onExit,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 800,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FluxDialogTitlebar(
              onClose: () {
                FluxConfirmDialog.show(
                  context: context,
                  title: 'Stop Command',
                  message: 'Are you sure you want to stop the command?',
                  confirmText: 'Stop',
                  confirmButtonColor:
                      context.theme.colorScheme.error.withValues(alpha: 0.3),
                  confirmTextColor: context.theme.colorScheme.error,
                  cancelText: 'Cancel',
                  onResult: (result) {
                    if (result) {
                      Navigator.of(context).pop();
                    }
                    onExit?.call(result);
                  },
                );
              },
            ),
            Container(
              width: 800,
              height: 600,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: TerminalWidget(
                command: command,
                arguments: arguments,
                onExit: () {
                  Navigator.of(context).pop();
                  onExit?.call(true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void show(
    BuildContext context,
    String command,
    List<String> arguments,
    Function(bool)? onExit,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => CommandTerminalDialog(
        command: command,
        arguments: arguments,
        onExit: onExit,
      ),
    );
  }

  static void showInstall(
    BuildContext context,
    String packageName, {
    bool user = false,
    Function(bool)? onExit,
  }) {
    showDialog(
      context: context,
      builder: (context) => CommandTerminalDialog(
        command: 'flatpak',
        arguments: [
          'install',
          "--assumeyes",
          user ? '--user' : '--system',
          "--noninteractive",
          packageName,
        ],
        onExit: onExit,
      ),
    );
  }

  static void showUninstall(
    BuildContext context,
    String packageName, {
    bool user = false,
    Function(bool)? onExit,
  }) {
    showDialog(
      context: context,
      builder: (context) => CommandTerminalDialog(
        command: 'flatpak',
        arguments: [
          'uninstall',
          "--assumeyes",
          "--noninteractive",
          user ? '--user' : '--system',
          packageName,
        ],
        onExit: onExit,
      ),
    );
  }

  static void showUpdateApp(
    BuildContext context,
    String packageName, {
    Function(bool)? onExit,
  }) {
    showDialog(
      context: context,
      builder: (context) => CommandTerminalDialog(
        command: 'flatpak',
        arguments: [
          'update',
          "--assumeyes",
          "--noninteractive",
          packageName,
        ],
        onExit: onExit,
      ),
    );
  }

  static void showUpdateAll(
    BuildContext context, {
    Function(bool)? onExit,
  }) {
    showDialog(
      context: context,
      builder: (context) => CommandTerminalDialog(
        command: 'flatpak',
        arguments: const [
          'update',
          "--assumeyes",
          "--noninteractive",
        ],
        onExit: onExit,
      ),
    );
  }
}
