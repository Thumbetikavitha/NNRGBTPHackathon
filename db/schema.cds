namespace com.satinfotech.electronics;
using { cuid, managed } from '@sap/cds/common';

entity BusinessPartner: cuid, managed {
  key BusinessPartnerNumber : UUID;
  Name : String;
  Address1 : String;
  Address2 : String;
  City : String;
  State : String(2);
  PINCode : String(6);
  Is_gstn_registered : Boolean;
  GSTINNumber : String(15);
  Is_vendor : Boolean;
  Is_customer : Boolean;
}


entity States {
    @title:'code'
    key code: String(3);
    @title:'description'
    description:String(10);
}