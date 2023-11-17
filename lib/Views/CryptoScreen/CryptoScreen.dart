import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:walletwise/Utils/CoinCard.dart';
import 'package:walletwise/models/CoinModel.dart';
import 'package:http/http.dart' as http;

class CryptoScreen extends StatefulWidget {
  const CryptoScreen({Key? key}) : super(key: key);

  @override
  State<CryptoScreen> createState() => _CryptoScreenState();
}

class _CryptoScreenState extends State<CryptoScreen> {
  List<Coin> coinList = [];
  List<Coin> filteredCoinList = [];

  Future<List<Coin>> fetchCoin() async {
    coinList = [];
    try {
      final response = await http.get(Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false'));

      if (response.statusCode == 200) {
        List<dynamic> values = json.decode(response.body);
        print(values);

        if (values != null && values is List) {
          coinList = values.map((map) => Coin.fromJson(map)).toList();
          filteredCoinList = List.from(coinList);
        }

        setState(() {
          coinList;
          filteredCoinList;
        });

        return coinList;
      } else {
        throw Exception('Failed to load coins');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to parse coins');
    }
  }

  void filterCoins(String query) {
    setState(() {
      filteredCoinList = coinList
          .where(
              (coin) => coin.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCoin(); // Fetch coins when the screen initializes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: InkWell(
            onTap: () {
              setState(() {
                fetchCoin();
              });
            },
            child: Text('Crypto')),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final String? query = await showSearch<String?>(
                context: context,
                delegate: CoinSearchDelegate(coinList),
              );
              if (query != null) {
                filterCoins(query);
              }
            },
          ),
        ],
      ),
      body: coinList.isEmpty
          ? Center(
              child: CircularProgressIndicator(), // Show a loading indicator
            )
          : ListView.builder(
              itemCount: filteredCoinList.length,
              itemBuilder: (context, index) {
                return CoinCard(
                  name: filteredCoinList[index].name,
                  symbol: filteredCoinList[index].symbol,
                  imageUrl: filteredCoinList[index].imageUrl,
                  price: filteredCoinList[index].price.toDouble(),
                  change: filteredCoinList[index].change.toDouble(),
                  changePercentage:
                      filteredCoinList[index].changePercentage.toDouble(),
                );
              },
            ),
    );
  }
}

class CoinSearchDelegate extends SearchDelegate<String?> {
  final List<Coin> coinList;

  CoinSearchDelegate(this.coinList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          // query = '';
          _getCryptoScreenState(context)?.filterCoins(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? coinList
        : coinList
            .where(
                (coin) => coin.name.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final coin = suggestionList[index];
        return ListTile(
          title: Text(coin.name),
          subtitle: Text(coin.symbol),
          onTap: () {
            // Close the search and return the selected coin name
            close(context, coin.name);
            _getCryptoScreenState(context)?.filterCoins(query);
          },
        );
      },
    );
  }

  @override
  void showResults(BuildContext context) {
    if (query.isEmpty) {
      close(context, null);
    } else {
      super.showResults(context);
    }
  }

  _CryptoScreenState? _getCryptoScreenState(BuildContext context) {
    final state = context.findAncestorStateOfType<_CryptoScreenState>();
    return state;
  }
}
