class AddressModel {
  const AddressModel({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.phone,
  });

  final String id;
  final String name;
  final String address;
  final String email;
  final String phone;

  AddressModel copyWith({
    String? id,
    String? name,
    String? address,
    String? email,
    String? phone,
  }) {
    return AddressModel(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }
}
