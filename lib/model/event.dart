class Event {
  String roadName;
  String reportout;
  String time;

  Event(this.roadName, this.reportout, this.time) {
    if (roadName == null) {
      roadName = "";
    }
    if (reportout == null) {
      reportout = "";
    }
    if (time == null) {
      time = "";
    }
  }

  Event.fromJson(Map<String, dynamic> json)
      : roadName = json['roadName'],
        reportout = json['reportout'];

  Map<String, dynamic> toJson() => {
        'roadName': roadName,
        'reportout': reportout,
      };
}
