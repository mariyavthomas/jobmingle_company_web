class Companymodel {
  String ?email;
  String ?companypassword;
  String ? companyuid;
  String ?companyname;
  String? address;
  String? industry;
  String ? phone;
  String ?image;
  String ?summery;
  String ?recutername;
  String ?totalemployee;
  String ? payment;

  

  Companymodel({
    this.payment,
    this.recutername,
    this.summery,
    this.totalemployee,
   this.phone,
    this.email,
    this.companypassword,
   this.companyuid,
   this.companyname,
    this.address,
   this.industry,
   this.image,
  
  });

  // Method to convert a Companymodel instance to a map
  Map<String, dynamic> toJson() {
    return {
      'payment':payment,
      'totalemployee':totalemployee,
      'email': email,
      'password': companypassword,
      'companyuid': companyuid,
      'companyname': companyname,
      'address': address,
    'phone':phone,
    'image':image,
    'summery':summery,
    'recutername':recutername,
    'industry':industry

    };
  }

  // Factory constructor to create a Companymodel instance from a map
  factory Companymodel.fromJson(Map<String, dynamic> json) {
    return Companymodel(
      payment: json['payment'],
      totalemployee:json['totalemployee'],
      recutername: json['recutername'],
      summery: json['summery'],
      email: json['email'] ?? "",
      companypassword: json['password'] ?? "",
      companyuid: json['companyuid'] ?? "",
      companyname: json['companyname'] ?? "",
       address: json['address'] ?? "",
      
      industry: json['industry'] ?? "",
      phone: json['phone'] ?? "",
      image: json['image'] ?? ""
     
    );
  }
}
