// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract patient_{
    address owner;
    mapping(address => uint) public Patientlist;
     
    struct Patient{
        int patient_id;
        string NIC;
        string Name;
        string Email;
        string Phone_no;
        string Address;
    }
    constructor(){
         owner =msg.sender;
     }
      modifier isOwner() {

         require(msg.sender == owner, "Access is not allowed");

         _;}

    Patient []pat;
    function store_pat(
        int patient_id,
        string memory NIC, 
        string memory Name, 
        string memory Email, 
        string memory Phone_no,
        string memory Address
    ) 
    public{
        Patient memory p= Patient(
            patient_id,
            NIC,
            Name,
            Email,
            Phone_no,
            Address);
        pat.push(p);
    }


    function retreive_pat(
        int patient_id
    ) public view returns(
        string memory,
        string memory, 
        string memory, 
        string memory,
        string memory){
            uint i;
            for(i=0;i<pat.length;i++){
                Patient memory p= pat[i];

                if(p.patient_id==patient_id){
                    return(p.NIC, p.Name,p.Email,p.Phone_no,p.Address);
                }
            }
            return("not found","not found","not found","not found","not found");
        }
}