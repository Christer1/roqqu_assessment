import 'dart:convert';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class CryptoController extends GetxController {
  static CryptoController get instance => Get.find();

  late WebSocketChannel _channel;
  final RxMap<String, dynamic> coinPrices = <String, dynamic>{}.obs;
  final RxBool isLoading = true.obs;

  final List<Map<String, dynamic>> coins = [
    {'name': 'Bitcoin', 'symbol': 'BTCUSDT', 'short': 'btc'},
    {'name': 'Ethereum', 'symbol': 'ETHUSDT', 'short': 'eth'},
    {'name': 'Binance Coin', 'symbol': 'BNBUSDT', 'short': 'bnb'},
    {'name': 'Cardano', 'symbol': 'ADAUSDT', 'short': 'ada'},
  ];

  @override
  void onInit() {
    super.onInit();
    _connectToWebSocket();
  }

  void _connectToWebSocket() {
    try {
      _channel = IOWebSocketChannel.connect(
        'wss://data-stream.binance.vision/stream?streams=${coins.map((c) => '${c['symbol'].toString().toLowerCase()}@ticker').join('/')}',
      );

      _channel.stream.listen(
        (message) {
          final data = json.decode(message);
          final streamData = data['data'];
          if (streamData == null) return;

          final symbol = streamData['s'];
          final price = double.parse(streamData['c']);
          final percentChange = double.parse(streamData['P']);

          coinPrices[symbol] = {
            'price': price,
            'change': percentChange,
            'isPositive': percentChange >= 0,
          };

        },
        onError: (error) {
          isLoading.value = false;
        },
        onDone: () {
          isLoading.value = false;
        },
      );
    } catch (e) {
      isLoading.value = false;
    }
  }

  String getCoinIconUrl(String short) {
    final icons = {
      'btc': 'https://cryptoicons.org/api/icon/btc/200',
      'eth': 'https://cryptoicons.org/api/icon/eth/200',
      'bnb': 'https://cryptoicons.org/api/icon/bnb/200',
      'ada': 'https://cryptoicons.org/api/icon/ada/200',
    };
    return icons[short.toLowerCase()] ?? 'https://cryptoicons.org/api/icon/usdt/200';
  }

  @override
  void onClose() {
    _channel.sink.close();
    super.onClose();
  }
}