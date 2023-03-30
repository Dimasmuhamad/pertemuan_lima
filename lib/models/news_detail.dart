class NewsDetail {
  final int newsId;
  final String newsTitle;
  final String newsContent;

  NewsDetail({
    required this.newsId,
    required this.newsTitle,
    required this.newsContent,
  });

  factory NewsDetail.fromMap(Map<String, dynamic> map) {
    return NewsDetail(
      newsId: map["newsId"],
      newsTitle: map["newsTitle"],
      newsContent: map["newsContent"],
    );
  }

  factory NewsDetail.dummy() {
    return NewsDetail(
      newsId: 1,
      newsTitle: "Crypto Dunia",
      newsContent:
          "Bitcoin seperti emas digital yang menawarkan dua pilihan yaitu sebagai alat investasi dan pembayaran. Namun, bitcoin ini belum tepat dikatakan sebagai alat pembayaran. Hal itu karena masyarakat belum dapat menerima bitcoin sebagai pembayaran dan tidak stabil.",
    );
  }
}
