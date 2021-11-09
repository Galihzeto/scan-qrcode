class NikModelLocal {
  ///Nik number
  String? nik;

  ///Name
  String? name;

  ///Gender type
  String? gender;

  ///birthday date
  String? bornDate;

  ///Province of country
  String? province;

  ///City where live
  String? city;

  ///Subdistrict where live
  String? subdistrict;

  ///Unique code from the last digit number in nik
  String? uniqueCode;

  ///Postal code of the subdistrict
  String? postalCode;

  ///Age with output year, month and date
  String? age;

  ///Age in year
  int? ageYear;

  ///Age in month
  int? ageMonth;

  ///Age in day
  int? ageDay;

  ///Next birthday counters count from now
  String? nextBirthday;

  ///Zodiac by born date
  String? zodiac;

  ///Check the nik number is valid or not
  bool? valid;

  NikModelLocal({
    this.nik,
    this.name,
    this.gender,
    this.bornDate,
    this.province,
    this.city,
    this.subdistrict,
    this.uniqueCode,
    this.postalCode,
    this.age,
    this.zodiac,
    this.valid,
    this.ageYear,
    this.ageMonth,
    this.ageDay,
    this.nextBirthday,
  });

  factory NikModelLocal.fromDb(Map<String, dynamic> json) => NikModelLocal(
        nik: json["nik"],
        name: json["name"] == null ? "-" : json["name"],
        gender: json["gender"] == null ? "-" : json["gender"],
        bornDate: json["bornDate"] == null ? "-" : json["bornDate"],
        province: json["province"] == null ? "-" : json["province"],
        city: json["city"] == null ? "-" : json["city"],
        subdistrict: json["subdistrict"] == null ? "-" : json["subdistrict"],
        // uniqueCode: json["uniqueCode"] == null ? "-" : json["uniqueCode"],
        postalCode: json["postalCode"] == null ? "-" : json["postalCode"],
        age: json["age"] == null ? "-" : json["age"],
        // zodiac: json["zodiac"] == null ? "-" : json["zodiac"],
        // valid: json["valid"] == null ? "-" : json["valid"],
        // ageYear: json["ageYear"] == null ? "-" : json["ageYear"],
        // ageMonth: json["ageMonth"] == null ? "-" : json["ageMonth"],
        // ageDay: json["ageDay"] == null ? "-" : json["ageDay"],
        // nextBirthday: json["nextBirthday"] == null ? "-" : json["nextBirthday"],
      );

  Map<String, dynamic> toDb() => {
        "nik": nik,
        "name": name == null ? null : name,
        "gender": gender == null ? null : gender,
        "bornDate": bornDate == null ? null : bornDate,
        "province": province == null ? null : province,
        "city": city == null ? null : city,
        "subdistrict": subdistrict == null ? null : subdistrict,
        "uniqueCode": uniqueCode,
        "postalCode": postalCode == null ? null : postalCode,
        "age": age == null ? null : age,
        "zodiac": zodiac == null ? null : zodiac,
        "valid": valid == null ? null : valid,
        "ageYear": ageYear == null ? null : ageYear,
        "ageMonth": ageMonth == null ? null : ageMonth,
        "ageDay": ageDay == null ? null : ageDay,
        "nextBirthday": nextBirthday == null ? null : nextBirthday,
      };
}
