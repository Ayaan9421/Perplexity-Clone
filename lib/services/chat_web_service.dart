import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:web_socket_client/web_socket_client.dart';
import 'dart:convert';

class ChatWebService {
  static final _instance = ChatWebService._internal();
  WebSocket? _socket;
  ChatWebService._internal();

  factory ChatWebService() => _instance;
  final _searchResultsController = StreamController<Map<String, dynamic>>();
  final _contentController = StreamController<Map<String, dynamic>>();

  Stream<Map<String, dynamic>> get searchResultStream =>
      _searchResultsController.stream;

  Stream<Map<String, dynamic>> get contentStream => _contentController.stream;

  void connect() {
    String baseUrl = getBaseUrl();
    _socket = WebSocket(Uri.parse("$baseUrl/ws/chat"));

    _socket!.messages.listen((message) {
      final data = json.decode(message);
      if (data['type'] == 'search_results') {
        _searchResultsController.add(data);
      } else if (data['type'] == 'content') {
        _contentController.add(data);
      }
    });
  }

  void chat(String query) {
    _socket!.send(json.encode({"query": query}));
  }

  String getBaseUrl() {
    if (kIsWeb) {
      return 'ws://localhost:8000'; // Web
    } else if (Platform.isAndroid) {
      return 'ws://10.0.2.2:8000'; // Android Emulator
    } else {
      return 'ws://localhost:8000'; // iOS, Windows, macOS
    }
  }
}
