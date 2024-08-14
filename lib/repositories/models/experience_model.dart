class ExperienceModel {
  final String? description;
  final String? endDate;
  final String? grade;
  final String? level;
  final String? major;
  final String? name;
  final String? position;
  final String? score;
  final String? startDate;

  ExperienceModel({
    this.description,
    this.endDate,
    this.grade,
    this.level,
    this.major,
    this.name,
    this.position,
    this.score,
    this.startDate,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      ExperienceModel(
        description: json["description"],
        endDate: json["end_date"],
        grade: json["grade"],
        level: json["level"],
        major: json["major"],
        name: json["name"],
        position: json["position"],
        score: json["score"],
        startDate: json["start_date"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "end_date": endDate,
        "grade": grade,
        "level": level,
        "major": major,
        "name": name,
        "position": position,
        "score": score,
        "start_date": startDate,
      };
}
