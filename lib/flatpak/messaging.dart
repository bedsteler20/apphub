import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

final _rnd = Random();

class Message {
  final int id;
  final String type;
  final dynamic data;

  Message.request(this.type, this.data) : id = _rnd.nextInt(1000000);

  Message.response(Message request, this.data)
      : id = request.id,
        type = request.type;

  Message.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        data = json['data'],
        type = json['type'];

  Map<String, dynamic> toJson() => {'id': id, 'data': data, 'type': type};
}

Stream<String> readLines(Stream<List<int>> stream) async* {
  var agg = "";
  await for (var line in stream.transform(utf8.decoder)) {
    if (line.endsWith("\n")) {
      yield agg + line;
      agg = "";
    } else {
      agg += line;
    }
  }
}

class MessageClient {
  final Process process;
  final _controller = StreamController<Message>.broadcast();

  MessageClient(this.process) {
    readLines(process.stdout).listen((data) {
      if (data.isNotEmpty) {
        _controller.add(Message.fromJson(jsonDecode(data)));
      }
    });
  }

  Future<Message> send(Message message) async {
    process.stdin.writeln(jsonEncode(message.toJson()));
    return await _controller.stream.firstWhere((msg) => msg.id == message.id);
  }

  void close() {
    process.kill();
    _controller.close();
  }
}

class MessageServer {
  final StreamController<Message> _controller =
      StreamController<Message>.broadcast();

  MessageServer() {
    readLines(stdin).listen((data) {
      final messages = data.split("\n");
      for (var message in messages) {
        if (message.isNotEmpty) {
          final msg = Message.fromJson(jsonDecode(message));
          _controller.add(msg);
        }
      }
    });
  }

  void send(Message message) {
    stdout.writeln(jsonEncode(message.toJson()));
  }

  void handleMessage(String type, Future<dynamic> Function(Message) handler) {
    _controller.stream.where((msg) => msg.type == type).listen((msg) async {
      final response = await handler(msg);
      if (response != null) {
        send(Message.response(msg, response));
      }
    });
  }

  void close() {
    _controller.close();
  }
}
