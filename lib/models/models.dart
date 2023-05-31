class SpecialDate {
  int dayId;
  String time;

  SpecialDate(this.dayId, this.time);
}

class Club {
  int id;
  String name;
  String description;
  String logoUrl;
  double averageRating;

  Club(this.id, this.name, this.description, this.logoUrl, this.averageRating);
}

class TSession {
  int id;
  String sport;
  Trainer trainer;
  Club club;
  SpecialDate date;
  String location;
  String level;
  int maxCapacity;
  int currentCapacity;

  TSession(this.id, this.sport, this.date, this.location, this.level,
      this.maxCapacity, this.currentCapacity, this.trainer, this.club);
}

class Award {
  int id;
  String title;
  String location;
  String date;

  Award(this.id, this.title, this.location, this.date);
}

class Trainer {
  int id;
  String firstName;
  String lastName;
  String? description;
  double averageRating;
  String phone;
  String email;
  List<Award> awards;

  Trainer(this.id, this.firstName, this.lastName, this.description,
      this.averageRating, this.phone, this.email, this.awards);
}

class Trainee {
  int id;
  String firstName;
  String lastName;
  String phone;
  String email;
  List<Award> awards;

  Trainee(this.id, this.firstName, this.lastName, this.phone, this.email,
      this.awards);
}
