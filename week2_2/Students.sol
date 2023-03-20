// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;
import  "./Iscore .sol";

contract Students is Iscore {

    mapping(address => uint) private studentScore;
    address public owenr;
    event updateRecord(address teacher,address student,uint point);

    constructor(address _teacher){
        owenr = _teacher;
    }

    modifier onlyTeacher() {
        require(msg.sender==owenr,"Only teacher can modify scores");
        _;
    }

    modifier scoreMax(uint score) {
        require(score>0 || score<=100,"Error of score");
        _;
    }

    function setScore(address students, uint score) external override onlyTeacher scoreMax(score){
        studentScore[students]  =  score;
        emit updateRecord(msg.sender,students,score);
    }

    function getScore(address students) external view override returns (uint) {
        return studentScore[students];
    }
}