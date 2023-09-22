class Agency {
  final String name;
  final String address;
  final List<String> categories;
  final List<String> resources;
  final double latitude;
  final double longitude;
  final String city;
  final String contactNumber;
  final String state;
  final String id;
  final int uid;
  final bool? verified;
  final bool? availability;
  

  Agency({
    required this.name,
    required this.address,
    required this.categories,
    required this.resources,
    required this.latitude,
    required this.longitude,
    required this.city,
    required this.contactNumber,
    required this.state,
    required this.id,
    required this.uid,
    this.verified,
    this.availability,
    
  });

  factory Agency.fromJson(Map<String, dynamic> json) {
    return Agency(
      name: json['name'],
      address: json['address'],
      categories: List<String>.from(json['categories']),
      resources: List<String>.from(json['resources']),
      latitude: json['latitude'],
      longitude: json['longitude'],
      city: json['city'],
      contactNumber: json['contactNumber'],
      state: json['state'],
      id: json['id'],
      uid: json['uid'],
      verified: json['verified'],
      availability: json['availability'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'categories': categories,
      'resources': resources,
      'latitude': latitude,
      'longitude': longitude,
      'city': city,
      'contactNumber': contactNumber,
      'state': state,
      'id': id,
      'uid': uid,
      'verified' : verified ,
      'availability': availability,
    };
  }
}
