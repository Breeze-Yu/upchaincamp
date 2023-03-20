// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;
import  "./Iscore .sol";

contract Teacher{

    Iscore public studentScore;

    error scoreErr(address student,uint point);
    event CatchEvent();
    event SuccessEvent();

    constructor(address _score){
        studentScore = Iscore(_score);
    }

    function execute(address students, uint score) external {
        try this.setScore(students,score) {
            emit SuccessEvent();
        } catch  {
            emit CatchEvent();
        }
    }

    function setScore(address students, uint score) public {
        if(score>100 || score<0){
            revert scoreErr(students,score);
        }
        studentScore.setScore(students,score);
    }

    function getScore(address students) public view returns(uint){
        return studentScore.getScore(students);
    }

}