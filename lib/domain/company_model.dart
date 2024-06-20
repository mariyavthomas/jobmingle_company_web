class Companymodel {
  String ?companyemail;
  String ?companypassword;
  String ? companyuid;
  String ?companyname;
  String? address;
  String? industry;
  String ? phone;
  

  Companymodel({
   this.phone,
    this.companyemail,
    this.companypassword,
   this.companyuid,
   this.companyname,
    this.address,
   this.industry,
  
  });

  // Method to convert a Companymodel instance to a map
  Map<String, dynamic> toJson() {
    return {
      'companyemail': companyemail,
      'companypassword': companypassword,
      'companyuid': companyuid,
      'companyname': companyname,
      'address': address,
    'phone':phone

    };
  }

  // Factory constructor to create a Companymodel instance from a map
  factory Companymodel.fromJson(Map<String, dynamic> json) {
    return Companymodel(
      companyemail: json['companyemail'] ?? "",
      companypassword: json['companypassword'] ?? "",
      companyuid: json['companyuid'] ?? "",
      companyname: json['companyname'] ?? "",
       address: json['address'] ?? "",
      
      industry: json['industry'] ?? "",
      phone: json['phone'] ?? "",
     
    );
  }
}
