class Data {
  int id;
  String title;
  List<String> img;
  String interest;
  int price;
  String date;
  String address;
  String trainerName;
  String trainerImg;
  String trainerInfo;
  String occasionDetail;
  String latitude;
  String longitude;
  bool isLiked;
  bool isSold;
  bool isPrivateEvent;
  bool hiddenCashPayment;
  int specialForm;
  Null questionnaire;
  Null questExplanation;
  List<ReservTypes> reservTypes;

  Data(
      {this.id,
        this.title,
        this.img,
        this.interest,
        this.price,
        this.date,
        this.address,
        this.trainerName,
        this.trainerImg,
        this.trainerInfo,
        this.occasionDetail,
        this.latitude,
        this.longitude,
        this.isLiked,
        this.isSold,
        this.isPrivateEvent,
        this.hiddenCashPayment,
        this.specialForm,
        this.questionnaire,
        this.questExplanation,
        this.reservTypes});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'].cast<String>();
    interest = json['interest'];
    price = json['price'];
    date = json['date'];
    address = json['address'];
    trainerName = json['trainerName'];
    trainerImg = json['trainerImg'];
    trainerInfo = json['trainerInfo'];
    occasionDetail = json['occasionDetail'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isLiked = json['isLiked'];
    isSold = json['isSold'];
    isPrivateEvent = json['isPrivateEvent'];
    hiddenCashPayment = json['hiddenCashPayment'];
    specialForm = json['specialForm'];
    questionnaire = json['questionnaire'];
    questExplanation = json['questExplanation'];
    if (json['reservTypes'] != null) {
      reservTypes = new List<ReservTypes>();
      json['reservTypes'].forEach((v) {
        reservTypes.add(new ReservTypes.fromJson(v));
      });
    }
  }


}

class ReservTypes {
  int id;
  String name;
  int count;
  int price;

  ReservTypes({this.id, this.name, this.count, this.price});

  ReservTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    count = json['count'];
    price = json['price'];
  }


}