// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract doctor_{
    address owner;
    mapping(address => uint) public doctorlist;
     
    struct Doctor{
        int doc_id;
        string slmc;
        string username;
        string email;
        string phone;
    }
    constructor(){
         owner =msg.sender;
     }


    Doctor []doc;
    function store_doc(
       int doc_id,
        string memory slmc, 
        string memory username, 
        string memory email, 
        string memory phone
    ) 
    public{
        Doctor memory d= Doctor(
            doc_id,
            slmc,
            username,
            email,
            phone);
        doc.push(d);
    }


    function retreive_doc(
        int doc_id
    ) public view returns(
        string memory,
        string memory, 
        string memory,
        string memory){
            uint i;
            for(i=0;i<doc.length;i++){
                Doctor memory d= doc[i];

                if(d.doc_id==doc_id){
                    return(d.slmc, d.username,d.email,d.phone);
                }
            }
            return("not found","not found","not found","not found");
        }
}