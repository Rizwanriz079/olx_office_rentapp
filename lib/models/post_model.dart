class Post {
  String id;
  double price;
  String location;
  String details;
  int squareFeet;
  int numberOfCabins;
  int numberOfSeats;
  int washrooms;
  int floorNumber;
  String buildingName;
  // int hrRoomNumber;
  List<String> images;
  int numberOfCarParking; // New field
  String airConditioner; // New field

  Post({
    required this.id,
    required this.price,
    required this.details,
    required this.location,
    required this.squareFeet,
    required this.numberOfCabins,
    required this.numberOfSeats,
    required this.washrooms,
    required this.floorNumber,
    required this.buildingName,
    // required this.hrRoomNumber,
    required this.images,
    required this.numberOfCarParking,
    required this.airConditioner,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      // title: json['title'] ?? '',
      price: json['price'] ?? 0,
      details: json['details']?? '',
      location: json['location'] ?? '',
      squareFeet: json['squareFeet'] ?? 0,
      numberOfCabins: json['numberOfCabins'] ?? 0,
      numberOfSeats: json['numberOfSeats'] ?? 0,
      washrooms: json['washrooms'] ?? 0,
      floorNumber: json['floorNumber'] ?? 0,
      buildingName: json['buildingName'] ?? '',
      // hrRoomNumber: json['hrRoomNumber'] ?? 0,
      images: List<String>.from(json['images'] ?? []),
      numberOfCarParking: json['numberOfCarParking,'] ?? 0, // New field
      airConditioner: json['airConditioner'] ?? 'Non-AC', id: '', // New field
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'title': title,
      'price': price,
      'details': details,
      'location': location,
      'squareFeet': squareFeet,
      'numberOfCabins': numberOfCabins,
      'numberOfSeats': numberOfSeats,
      'washrooms': washrooms,
      'floorNumber': floorNumber,
      'buildingName': buildingName,
      // 'hrRoomNumber': hrRoomNumber,
      'images': images,
      'numberOfCarParking': numberOfCarParking, // New field
      'airConditioner': airConditioner, // New field
    };
  }
  // Method to add an image path to the post
  void addImagePath(String path) {
    images.add(path);
  }

  // Method to remove an image path from the post
  void removeImagePath(String path) {
    images.remove(path);
  }
}



class Message {
  final String text;
  final bool isMine;

  Message(this.text, this.isMine);
}
