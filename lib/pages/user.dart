class User {
   String roadName;
   String reportout;

  User(this.roadName, this.reportout){
      if(roadName==null){
        roadName="";
      }
      if(reportout==null){
        reportout="";
      }
  }

  User.fromJson(Map<String, dynamic> json)
      : roadName = json['roadName'],
        reportout = json['reportout'];

  Map<String, dynamic> toJson() =>
    {
      'roadName': roadName,
      'reportout': reportout,
    };
}