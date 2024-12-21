// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConditionalCoursePayments {

    address public owner;
    mapping(address => bool) public courseCreators;
    mapping(address => bool) public enrolledStudents;

    struct Course {
        string name;
        uint256 price;
        address payable creator;
        bool active;
    }

    mapping(uint256 => Course) public courses;
    uint256 public courseCount;

    event CourseCreated(uint256 courseId, string name, uint256 price, address creator);
    event StudentEnrolled(uint256 courseId, address student);
    event PaymentReleased(uint256 courseId, address creator);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    modifier onlyCourseCreator(uint256 courseId) {
        require(msg.sender == courses[courseId].creator, "Only the course creator can perform this action");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addCourseCreator(address _creator) external onlyOwner {
        courseCreators[_creator] = true;
    }

    function removeCourseCreator(address _creator) external onlyOwner {
        courseCreators[_creator] = false;
    }

    function createCourse(string memory _name, uint256 _price) external {
        require(courseCreators[msg.sender], "Only approved course creators can create courses");

        courseCount++;
        courses[courseCount] = Course({
            name: _name,
            price: _price,
            creator: payable(msg.sender),
            active: true
        });

        emit CourseCreated(courseCount, _name, _price, msg.sender);
    }

    function enroll(uint256 courseId) external payable {
        Course storage course = courses[courseId];
        require(course.active, "Course is not active");
        require(msg.value == course.price, "Incorrect payment amount");
        require(!enrolledStudents[msg.sender], "Student already enrolled");

        enrolledStudents[msg.sender] = true;

        emit StudentEnrolled(courseId, msg.sender);
    }

    function releasePayment(uint256 courseId) external onlyCourseCreator(courseId) {
        Course storage course = courses[courseId];
        require(course.active, "Course is not active");

        course.creator.transfer(course.price);
        course.active = false;

        emit PaymentReleased(courseId, course.creator);
    }
}
