class UserModel {
  String? iDCOOP;
  String? iDDIGIT;
  String? nAME;
  String? aCCNO;
  String? uNIT;
  String? sEC;
  String? pOSITION;
  String? pHONE;
  String? bORNDATE;
  String? mEMBDATE;

  UserModel(
      {this.iDCOOP,
      this.iDDIGIT,
      this.nAME,
      this.aCCNO,
      this.uNIT,
      this.sEC,
      this.pOSITION,
      this.pHONE,
      this.bORNDATE,
      this.mEMBDATE});

  UserModel.fromJson(Map<String, dynamic> json) {
    iDCOOP = json['ID_COOP'];
    iDDIGIT = json['ID_DIGIT'];
    nAME = json['NAME'];
    aCCNO = json['ACCNO'];
    uNIT = json['UNIT'];
    sEC = json['SEC'];
    pOSITION = json['POSITION'];
    pHONE = json['PHONE'];
    bORNDATE = json['BORNDATE'];
    mEMBDATE = json['MEMBDATE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID_COOP'] = this.iDCOOP;
    data['ID_DIGIT'] = this.iDDIGIT;
    data['NAME'] = this.nAME;
    data['ACCNO'] = this.aCCNO;
    data['UNIT'] = this.uNIT;
    data['SEC'] = this.sEC;
    data['POSITION'] = this.pOSITION;
    data['PHONE'] = this.pHONE;
    data['BORNDATE'] = this.bORNDATE;
    data['MEMBDATE'] = this.mEMBDATE;
    return data;
  }
}
