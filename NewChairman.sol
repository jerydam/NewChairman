// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.17;


import {IStudents, Data} from "./Istudent.sol";

contract Chairman{

    address[] staffs;
    address Admin;  
    IStudents studentDetail; 


   constructor(address _studentDetails){
        Admin = msg.sender;
        studentDetail =IStudents( _studentDetails);
    }

    modifier onlyOwner(){
        require(msg.sender == Admin, "Not Admin");
        _;

    }


    function addStaff(address _staff) external onlyOwner{
        staffs.push(_staff);
    }

    function Register(string memory _name, address student, uint _age, string memory _gender) external {
        studentDetail.registerStudent(_name, student, _age, _gender);

    }

    function getStudents(address student) public view returns(Data memory _data){
        _data = studentDetail.getStudent(student);

    }

    fallback() external payable{}
    receive()  external payable{}
    
}
