class Report {
  String? name;
  double? reportLong;
  double? reportLat;
  String? reportDate;
  bool? isApproved;

  Report({
    this.name,
    this.reportLong,
    this.reportLat,
    this.reportDate,
    this.isApproved,
  });

  Report.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    reportLong = json['reportLong'];
    reportLat = json['reportLat'];
    reportDate = json['reportDate'];
    isApproved = json['isApproved'];
  }
}
