class LocationData {
  final String? location;
  final String? km;
  final String? makan;
  final String? city;

  LocationData({
    this.location,
    this.km,
    this.makan,
    this.city,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      location: json['location'],
      km: json['km'],
      makan: json['makan'],
      city: json['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'km': km,
      'makan': makan,
      'city': city,
    };
  }
}
