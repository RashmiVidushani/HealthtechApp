// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract doctor_{
    address owner;
    mapping(address => uint) public doctorlist;
     
    struct Doctor{
        int doc_id;
        string SLMC_no;
        string Name;
        string Specialization;
        string Email;
        string Phone_no;
        string Address;
    }
    constructor(){
         owner =msg.sender;
     }


    Doctor []doc;
    function store_doc(
        int doc_id,
        string memory SLMC_no, 
        string memory Name, 
        string memory Specialization, 
        string memory Email, 
        string memory Phone_no,
        string memory Address
    ) 
    public{
        Doctor memory d= Doctor(
            doc_id,
            SLMC_no,
            Name,
            Specialization,
            Email,
            Phone_no,
            Address);
        doc.push(d);
    }


    function retreive_doc(
        int doc_id
    ) public view returns(
        string memory,
        string memory, 
        string memory,
        string memory, 
        string memory,
        string memory){
            uint i;
            for(i=0;i<doc.length;i++){
                Doctor memory d= doc[i];

                if(d.doc_id==doc_id){
                    return(d.SLMC_no, d.Name,d.Specialization,d.Email,d.Phone_no,d.Address);
                }
            }
            return("not found","not found","not found","not found","not found","not found");
        }
}