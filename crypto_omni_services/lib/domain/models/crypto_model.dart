import 'dart:convert';

class CryptoModel {
  Status? status;
  List<CryptoCurrency>? data;

  CryptoModel({
    this.status,
    this.data,
  });

  @override
  String toString() => 'CryptoModel(status: $status, data: $data)';

  factory CryptoModel.fromMap(Map<String, dynamic> data) => CryptoModel(
        status: data['status'] == null ? null : Status.fromMap(data['status'] as Map<String, dynamic>),
        data: (data['data'] as List<dynamic>?)
            ?.map(
              (e) => CryptoCurrency.fromMap(
                e as Map<String, dynamic>,
              ),
            )
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status?.toMap(),
        'data': data?.map((e) => e.toMap()).toList(),
      };

  factory CryptoModel.fromJson(String data) {
    return CryptoModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(
        toMap(),
      );

  CryptoModel copyWith({
    Status? status,
    List<CryptoCurrency>? data,
  }) {
    return CryptoModel(
      status: status ?? this.status,
      data: data ?? this.data,
    );
  }
}

class Status {
  DateTime? timestamp;
  double? errorCode;
  dynamic errorMessage;
  double? elapsed;
  double? creditCount;
  dynamic notice;

  Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
  });

  @override
  String toString() {
    return 'Status(timestamp: $timestamp, errorCode: $errorCode, errorMessage: $errorMessage, elapsed: $elapsed, creditCount: $creditCount, notice: $notice)';
  }

  factory Status.fromMap(Map<String, dynamic> data) => Status(
        timestamp: data['timestamp'] == null ? null : DateTime.parse(data['timestamp'] as String),
        errorCode: (data['error_code'] as num?)?.toDouble(),
        errorMessage: data['error_message'] as dynamic,
        elapsed: (data['elapsed'] as num?)?.toDouble(),
        creditCount: (data['credit_count'] as int?)?.toDouble(),
        notice: data['notice'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'timestamp': timestamp?.toIso8601String(),
        'error_code': errorCode,
        'error_message': errorMessage,
        'elapsed': elapsed,
        'credit_count': creditCount,
        'notice': notice,
      };

  factory Status.fromJson(String data) {
    return Status.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  Status copyWith({
    DateTime? timestamp,
    double? errorCode,
    dynamic errorMessage,
    double? elapsed,
    double? creditCount,
    dynamic notice,
  }) {
    return Status(
      timestamp: timestamp ?? this.timestamp,
      errorCode: errorCode ?? this.errorCode,
      errorMessage: errorMessage ?? this.errorMessage,
      elapsed: elapsed ?? this.elapsed,
      creditCount: creditCount ?? this.creditCount,
      notice: notice ?? this.notice,
    );
  }
}

class CryptoCurrency {
  double? id;
  String? name;
  String? symbol;
  String? slug;
  double? cmcRank;
  double? numMarketPairs;
  double? circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  dynamic infiniteSupply;
  DateTime? lastUpdated;
  DateTime? dateAdded;
  List<dynamic>? tags;
  dynamic platform;
  dynamic selfReportedCirculatingSupply;
  dynamic selfReportedMarketCap;
  Quote? quote;

  CryptoCurrency({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.cmcRank,
    this.numMarketPairs,
    this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    this.infiniteSupply,
    this.lastUpdated,
    this.dateAdded,
    this.tags,
    this.platform,
    this.selfReportedCirculatingSupply,
    this.selfReportedMarketCap,
    this.quote,
  });

  @override
  String toString() {
    return 'CryptoCurrency(id: $id, name: $name, symbol: $symbol, slug: $slug, cmcRank: $cmcRank, numMarketPairs: $numMarketPairs, circulatingSupply: $circulatingSupply, totalSupply: $totalSupply, maxSupply: $maxSupply, infiniteSupply: $infiniteSupply, lastUpdated: $lastUpdated, dateAdded: $dateAdded, tags: $tags, platform: $platform, selfReportedCirculatingSupply: $selfReportedCirculatingSupply, selfReportedMarketCap: $selfReportedMarketCap, quote: $quote)';
  }

  factory CryptoCurrency.fromMap(Map<String, dynamic> data) => CryptoCurrency(
        id: (data['id'] as num?)?.toDouble(),
        name: data['name'] as String?,
        symbol: data['symbol'] as String?,
        slug: data['slug'] as String?,
        cmcRank: (data['cmc_rank'] as num?)?.toDouble(),
        numMarketPairs: (data['num_market_pairs'] as num?)?.toDouble(),
        circulatingSupply: (data['circulating_supply'] as num?)?.toDouble(),
        totalSupply: (data['total_supply'] as num?)?.toDouble(),
        maxSupply: (data['max_supply'] as num?)?.toDouble(),
        infiniteSupply: data['infinite_supply'] as dynamic,
        lastUpdated: data['last_updated'] == null ? null : DateTime.parse(data['last_updated'] as String),
        dateAdded: data['date_added'] == null ? null : DateTime.parse(data['date_added'] as String),
        tags: data['tags'] as List<dynamic>?,
        platform: data['platform'] as dynamic,
        selfReportedCirculatingSupply: data['self_reported_circulating_supply'] as dynamic,
        selfReportedMarketCap: data['self_reported_market_cap'] as dynamic,
        quote: data['quote'] == null ? null : Quote.fromMap(data['quote'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'symbol': symbol,
        'slug': slug,
        'cmc_rank': cmcRank,
        'num_market_pairs': numMarketPairs,
        'circulating_supply': circulatingSupply,
        'total_supply': totalSupply,
        'max_supply': maxSupply,
        'infinite_supply': infiniteSupply,
        'last_updated': lastUpdated?.toIso8601String(),
        'date_added': dateAdded?.toIso8601String(),
        'tags': tags,
        'platform': platform,
        'self_reported_circulating_supply': selfReportedCirculatingSupply,
        'self_reported_market_cap': selfReportedMarketCap,
        'quote': quote?.toMap(),
      };

  factory CryptoCurrency.fromJson(String data) {
    return CryptoCurrency.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  CryptoCurrency copyWith({
    double? id,
    String? name,
    String? symbol,
    String? slug,
    double? cmcRank,
    double? numMarketPairs,
    double? circulatingSupply,
    double? totalSupply,
    double? maxSupply,
    dynamic infiniteSupply,
    DateTime? lastUpdated,
    DateTime? dateAdded,
    List<String>? tags,
    dynamic platform,
    dynamic selfReportedCirculatingSupply,
    dynamic selfReportedMarketCap,
    Quote? quote,
  }) {
    return CryptoCurrency(
      id: id ?? this.id,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      slug: slug ?? this.slug,
      cmcRank: cmcRank ?? this.cmcRank,
      numMarketPairs: numMarketPairs ?? this.numMarketPairs,
      circulatingSupply: circulatingSupply ?? this.circulatingSupply,
      totalSupply: totalSupply ?? this.totalSupply,
      maxSupply: maxSupply ?? this.maxSupply,
      infiniteSupply: infiniteSupply ?? this.infiniteSupply,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      dateAdded: dateAdded ?? this.dateAdded,
      tags: tags ?? this.tags,
      platform: platform ?? this.platform,
      selfReportedCirculatingSupply: selfReportedCirculatingSupply ?? this.selfReportedCirculatingSupply,
      selfReportedMarketCap: selfReportedMarketCap ?? this.selfReportedMarketCap,
      quote: quote ?? this.quote,
    );
  }
}

class Btc {
  double? price;
  double? volume24h;
  dynamic volumeChange24h;
  dynamic percentChange1h;
  dynamic percentChange24h;
  dynamic percentChange7d;
  double? marketCap;
  double? marketCapDominance;
  double? fullyDilutedMarketCap;
  DateTime? lastUpdated;

  Btc({
    this.price,
    this.volume24h,
    this.volumeChange24h,
    this.percentChange1h,
    this.percentChange24h,
    this.percentChange7d,
    this.marketCap,
    this.marketCapDominance,
    this.fullyDilutedMarketCap,
    this.lastUpdated,
  });

  @override
  String toString() {
    return 'Btc(price: $price, volume24h: $volume24h, volumeChange24h: $volumeChange24h, percentChange1h: $percentChange1h, percentChange24h: $percentChange24h, percentChange7d: $percentChange7d, marketCap: $marketCap, marketCapDominance: $marketCapDominance, fullyDilutedMarketCap: $fullyDilutedMarketCap, lastUpdated: $lastUpdated)';
  }

  factory Btc.fromMap(Map<String, dynamic> data) => Btc(
        price: data['price'] as double?,
        volume24h: data['volume_24h'] as double?,
        volumeChange24h: data['volume_change_24h'] as dynamic,
        percentChange1h: data['percent_change_1h'] as dynamic,
        percentChange24h: data['percent_change_24h'] as dynamic,
        percentChange7d: data['percent_change_7d'] as dynamic,
        marketCap: (data['market_cap'] as num?)?.toDouble(),
        marketCapDominance: (data['market_cap_dominance'] as double?)?.toDouble(),
        fullyDilutedMarketCap: (data['fully_diluted_market_cap'] as num?)?.toDouble(),
        lastUpdated: data['last_updated'] == null ? null : DateTime.parse(data['last_updated'] as String),
      );

  Map<String, dynamic> toMap() => {
        'price': price,
        'volume_24h': volume24h,
        'volume_change_24h': volumeChange24h,
        'percent_change_1h': percentChange1h,
        'percent_change_24h': percentChange24h,
        'percent_change_7d': percentChange7d,
        'market_cap': marketCap,
        'market_cap_dominance': marketCapDominance,
        'fully_diluted_market_cap': fullyDilutedMarketCap,
        'last_updated': lastUpdated?.toIso8601String(),
      };

  factory Btc.fromJson(String data) {
    return Btc.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());

  Btc copyWith({
    double? price,
    double? volume24h,
    dynamic volumeChange24h,
    dynamic percentChange1h,
    dynamic percentChange24h,
    dynamic percentChange7d,
    double? marketCap,
    double? marketCapDominance,
    double? fullyDilutedMarketCap,
    DateTime? lastUpdated,
  }) {
    return Btc(
      price: price ?? this.price,
      volume24h: volume24h ?? this.volume24h,
      volumeChange24h: volumeChange24h ?? this.volumeChange24h,
      percentChange1h: percentChange1h ?? this.percentChange1h,
      percentChange24h: percentChange24h ?? this.percentChange24h,
      percentChange7d: percentChange7d ?? this.percentChange7d,
      marketCap: marketCap ?? this.marketCap,
      marketCapDominance: marketCapDominance ?? this.marketCapDominance,
      fullyDilutedMarketCap: fullyDilutedMarketCap ?? this.fullyDilutedMarketCap,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}

class Quote {
  Usd? usd;
  Btc? btc;

  Quote({this.usd, this.btc});

  @override
  String toString() => 'Quote(usd: $usd, btc: $btc)';

  factory Quote.fromMap(Map<String, dynamic> data) => Quote(
        usd: data['USD'] == null ? null : Usd.fromMap(data['USD'] as Map<String, dynamic>),
        btc: data['BTC'] == null ? null : Btc.fromMap(data['BTC'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'USD': usd?.toMap(),
        'BTC': btc?.toMap(),
      };

  factory Quote.fromJson(String data) {
    return Quote.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(
        toMap(),
      );

  Quote copyWith({
    Usd? usd,
    Btc? btc,
  }) {
    return Quote(
      usd: usd ?? this.usd,
      btc: btc ?? this.btc,
    );
  }
}

class Usd {
  double? price;
  double? volume24h;
  double? volumeChange24h;
  double? percentChange1h;
  double? percentChange24h;
  double? percentChange7d;
  double? marketCap;
  double? marketCapDominance;
  double? fullyDilutedMarketCap;
  DateTime? lastUpdated;

  Usd({
    this.price,
    this.volume24h,
    this.volumeChange24h,
    this.percentChange1h,
    this.percentChange24h,
    this.percentChange7d,
    this.marketCap,
    this.marketCapDominance,
    this.fullyDilutedMarketCap,
    this.lastUpdated,
  });

  @override
  String toString() {
    return 'Usd(price: $price, volume24h: $volume24h, volumeChange24h: $volumeChange24h, percentChange1h: $percentChange1h, percentChange24h: $percentChange24h, percentChange7d: $percentChange7d, marketCap: $marketCap, marketCapDominance: $marketCapDominance, fullyDilutedMarketCap: $fullyDilutedMarketCap, lastUpdated: $lastUpdated)';
  }

  factory Usd.fromMap(Map<String, dynamic> data) => Usd(
        price: (data['price'] as num?)?.toDouble(),
        volume24h: (data['volume_24h'] as num?)?.toDouble(),
        volumeChange24h: (data['volume_change_24h'] as num?)?.toDouble(),
        percentChange1h: (data['percent_change_1h'] as num?)?.toDouble(),
        percentChange24h: (data['percent_change_24h'] as num?)?.toDouble(),
        percentChange7d: (data['percent_change_7d'] as num?)?.toDouble(),
        marketCap: (data['market_cap'] as num?)?.toDouble(),
        marketCapDominance: (data['market_cap_dominance'] as num?)?.toDouble(),
        fullyDilutedMarketCap: (data['fully_diluted_market_cap'] as num?)?.toDouble(),
        lastUpdated: data['last_updated'] == null ? null : DateTime.parse(data['last_updated'] as String),
      );

  Map<String, dynamic> toMap() => {
        'price': price,
        'volume_24h': volume24h,
        'volume_change_24h': volumeChange24h,
        'percent_change_1h': percentChange1h,
        'percent_change_24h': percentChange24h,
        'percent_change_7d': percentChange7d,
        'market_cap': marketCap,
        'market_cap_dominance': marketCapDominance,
        'fully_diluted_market_cap': fullyDilutedMarketCap,
        'last_updated': lastUpdated?.toIso8601String(),
      };
  factory Usd.fromJson(String data) {
    return Usd.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(
        toMap(),
      );

  Usd copyWith({
    double? price,
    double? volume24h,
    double? volumeChange24h,
    double? percentChange1h,
    double? percentChange24h,
    double? percentChange7d,
    double? marketCap,
    double? marketCapDominance,
    double? fullyDilutedMarketCap,
    DateTime? lastUpdated,
  }) {
    return Usd(
      price: price ?? this.price,
      volume24h: volume24h ?? this.volume24h,
      volumeChange24h: volumeChange24h ?? this.volumeChange24h,
      percentChange1h: percentChange1h ?? this.percentChange1h,
      percentChange24h: percentChange24h ?? this.percentChange24h,
      percentChange7d: percentChange7d ?? this.percentChange7d,
      marketCap: marketCap ?? this.marketCap,
      marketCapDominance: marketCapDominance ?? this.marketCapDominance,
      fullyDilutedMarketCap: fullyDilutedMarketCap ?? this.fullyDilutedMarketCap,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }
}
