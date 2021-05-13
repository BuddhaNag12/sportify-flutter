// To parse this JSON data, do
//
//     final eventsList = eventsListFromJson(jsonString);

import 'dart:convert';

EventsList eventsListFromJson(String str) => EventsList.fromJson(json.decode(str));

String eventsListToJson(EventsList data) => json.encode(data.toJson());

class EventsList {
    EventsList({
        this.name,
        this.date,
        this.category,
        this.description,
        this.prizes,
        this.teamSize,
        this.location,
    });

    String name;
    DateTime date;
    String category;
    String description;
    String prizes;
    int teamSize;
    Location location;

    factory EventsList.fromJson(Map<String, dynamic> json) => EventsList(
        name: json["name"],
        date: DateTime.parse(json["date"]),
        category: json["category"],
        description: json["description"],
        prizes: json["prizes"],
        teamSize: json["team_size"],
        location: Location.fromJson(json["location"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "category": category,
        "description": description,
        "prizes": prizes,
        "team_size": teamSize,
        "location": location.toJson(),
    };
}

class Location {
    Location({
        this.lattitude,
        this.longitude,
    });

    int lattitude;
    int longitude;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        lattitude: json["lattitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "lattitude": lattitude,
        "longitude": longitude,
    };
}
