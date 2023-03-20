// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.18;

interface Iscore {
    function setScore(address students,uint score) external;
    function getScore(address students) external view returns (uint);
}