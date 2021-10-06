import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CurrencyMap{
  static Map<String, Map<String,String>> data = {
    'Bitcoin (BTC)': {
    'Bitcoin': '114z5ggBTrqB8YJ9jeQVD57T2gmhGYAzdf',
    'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    'BTC(SegWit)' : 'bc1q094fun0cgs2r97kwxu887pq30mc7q507yphyy8'
    },

    'Ethereum (ETH)' : {
    'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
    },

    'TetherUS (USDT)' : {
    'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    'Tron (TRC20)': 'TS45RfpnpFHxTypqpwQ7vK5YutsGugnKrT',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
    },

    'Cardano (ADA)': {
    'Cardano': 'DdzFFzCqrhsw5xFPjSGBDdSzV4aXXKfpzK9uhjPkfb9eXkAFVJ49BwFfsYPgSumT6JkMLrSBaGAUwooVPBXs7c63LL1P3ajvFxA7mLm4',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    },

    'Binance Coin (BNB)': {
    'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    },

    'Solana (SOL)' : {
    'Solana': 'HxAbFbhWLHspQsFQxtP3EQeKfdDRUQ6dGU3MT8wLaFTK',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
    },

    'Polkadot (DOT)' : {
    'Polkadot': '19gD8esavQwaUSF1Fb3t8Ddz7iHuHQzUj1uENevrbsosf9g',
    'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    },

    'Dogecoin (DOGE)' : {
    'dogecoin': 'DAyFDf3wfSakh6ELj8m5cKzKGH1ktTwq96',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
    },

    'Chainlink (LINK)' : {
    'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
    },

    'Uniswap (UNI)' : {
    'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
    },

    'Litecoin (LTC)' : {
    'Litecoin': 'LZVcLPqeHQnaAt99pWkQzFAiKHWXRTJMXv',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
    },

    'Bitcoin Cash (BCH)' : {
    'Bitcoin Cash': '114z5ggBTrqB8YJ9jeQVD57T2gmhGYAzdf',
    'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
    },

    'Polygon (MATIC)' : {
    'Polygon': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
    },

    'TRON (TRX)' : {
    'Tron (TRC20)': 'TS45RfpnpFHxTypqpwQ7vK5YutsGugnKrT',
    'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
    'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
    }
  };
}

class DonationData extends ChangeNotifier{
  bool _bCreditCard=true;
  bool _bCrypto=false;
  Map<String, Map<String,String>> currencyMap = CurrencyMap.data;

  // Map<String, Map<String,String>> currencyMap = {
  //   'Bitcoin (BTC)': {
  //     'Bitcoin': '114z5ggBTrqB8YJ9jeQVD57T2gmhGYAzdf',
  //     'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //     'BTC(SegWit)' : 'bc1q094fun0cgs2r97kwxu887pq30mc7q507yphyy8'
  //   },
  //
  //   'Ethereum (ETH)' : {
  //     'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
  //   },
  //
  //   'TetherUS (USDT)' : {
  //     'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //     'Tron (TRC20)': 'TS45RfpnpFHxTypqpwQ7vK5YutsGugnKrT',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
  //   },
  //
  //   'Cardano (ADA)': {
  //     'Cardano': 'DdzFFzCqrhsw5xFPjSGBDdSzV4aXXKfpzK9uhjPkfb9eXkAFVJ49BwFfsYPgSumT6JkMLrSBaGAUwooVPBXs7c63LL1P3ajvFxA7mLm4',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //   },
  //
  //   'Binance Coin (BNB)': {
  //     'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //   },
  //
  //   'Solana (SOL)' : {
  //     'Solana': 'HxAbFbhWLHspQsFQxtP3EQeKfdDRUQ6dGU3MT8wLaFTK',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
  //   },
  //
  //   'Polkadot (DOT)' : {
  //     'Polkadot': '19gD8esavQwaUSF1Fb3t8Ddz7iHuHQzUj1uENevrbsosf9g',
  //     'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //   },
  //
  //   'Dogecoin (DOGE)' : {
  //     'dogecoin': 'DAyFDf3wfSakh6ELj8m5cKzKGH1ktTwq96',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
  //   },
  //
  //   'Chainlink (LINK)' : {
  //     'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
  //   },
  //
  //   'Uniswap (UNI)' : {
  //     'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
  //   },
  //
  //   'Litecoin (LTC)' : {
  //     'Litecoin': 'LZVcLPqeHQnaAt99pWkQzFAiKHWXRTJMXv',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
  //   },
  //
  //   'Bitcoin Cash (BCH)' : {
  //     'Bitcoin Cash': '114z5ggBTrqB8YJ9jeQVD57T2gmhGYAzdf',
  //     'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
  //   },
  //
  //   'Polygon (MATIC)' : {
  //     'Polygon': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //     'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
  //   },
  //
  //   'TRON (TRX)' : {
  //     'Tron (TRC20)': 'TS45RfpnpFHxTypqpwQ7vK5YutsGugnKrT',
  //     'Ethereum (ERC20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25',
  //     'Binance Smart Chain (BEP20)': '0x10afc9f25e8196dd2b92f7e03c6f912c31c63e25'
  //   }
  // };
  String activeCurrency = 'Bitcoin (BTC)';
  String activeNetwork = 'Bitcoin';

  void updatePaymentMethod({bool creditCard=true, bool crypto=false}){
    if(creditCard){ _bCrypto = false; _bCreditCard = true;}
    else if(crypto){ _bCreditCard = false; _bCrypto = true; }
    notifyListeners();
  }

  bool get bCreditCard => _bCreditCard;
  bool get bCrypto => _bCrypto;

  void updateActiveCurrency(currency){
    activeCurrency = currency;
    activeNetwork = currencyMap[activeCurrency].keys.elementAt(0);
    notifyListeners();
  }

  void updateActiveNetwork(network){
    activeNetwork = network;
    notifyListeners();
  }

  String get networkAddress => currencyMap[activeCurrency][activeNetwork];

}