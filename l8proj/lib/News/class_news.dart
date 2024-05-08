class News {
  final String ID;
  final String ACTIVE_FROM;
  final String TITLE;
  final String PREVIEW_TEXT;
  final String PREVIEW_PICTURE_SRC;
  final String DETAIL_PAGE_URL;
  final String DETAIL_TEXT;
  final String LAST_MODIFIED;
  const News({
    required this.ID,
    required this.ACTIVE_FROM,
    required this.TITLE,
    required this.PREVIEW_TEXT,
    required this.PREVIEW_PICTURE_SRC,
    required this.DETAIL_PAGE_URL,
    required this.DETAIL_TEXT,
    required this.LAST_MODIFIED,
});
  factory News.fromJSON(Map<String, dynamic> json){
    return News(ID: json['ID'] as String,
        ACTIVE_FROM: json['ACTIVE_FROM'] as String,
        TITLE: json['TITLE'] as String,
        PREVIEW_TEXT: json['PREVIEW_TEXT'] as String,
        PREVIEW_PICTURE_SRC: json['PREVIEW_PICTURE_SRC'] as String,
        DETAIL_PAGE_URL: json['DETAIL_PAGE_URL'] as String,
        DETAIL_TEXT: json['DETAIL_TEXT'] as String,
        LAST_MODIFIED: json['LAST_MODIFIED'] as String
    );
  }
}