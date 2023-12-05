// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./token.sol";

contract QuizGame is Ownable {
    enum QuizState { NotStarted, Started, Ended }
    QuizState public quizState;

    AshokuCoin public acsToken;

    address public winner;
    uint256 public rewardAmount = 0.5 ether;

    mapping(address => bool) public hasAnswered;

    event QuizStarted();
    event QuizEnded(address winner, uint256 rewardAmount);

    modifier onlyQuizStarted() {
        require(quizState == QuizState.Started, "Quiz not started");
        _;
    }

    modifier onlyQuizNotStarted() {
        require(quizState == QuizState.NotStarted, "Quiz already started");
        _;
    }

    constructor(address acsTokenAddress, address initialOwner) Ownable(initialOwner) {
        acsToken = AshokuCoin(acsTokenAddress);
        quizState = QuizState.NotStarted;
    }

    function startQuiz() external onlyOwner onlyQuizNotStarted {
        quizState = QuizState.Started;
        emit QuizStarted();
    }

    function endQuiz(address player, string memory answer1, string memory answer2, string memory answer3, string memory answer4, string memory answer5) external onlyOwner onlyQuizStarted {
        require(!hasAnswered[player], "Player has already answered");

        // Assume you have predefined correct answers for the quiz questions
        string[5] memory correctAnswers = ["Correct1", "Correct2", "Correct3", "Correct4", "Correct5"];

        require(keccak256(abi.encodePacked(answer1)) == keccak256(abi.encodePacked(correctAnswers[0])), "Incorrect answer 1");
        require(keccak256(abi.encodePacked(answer2)) == keccak256(abi.encodePacked(correctAnswers[1])), "Incorrect answer 2");
        require(keccak256(abi.encodePacked(answer3)) == keccak256(abi.encodePacked(correctAnswers[2])), "Incorrect answer 3");
        require(keccak256(abi.encodePacked(answer4)) == keccak256(abi.encodePacked(correctAnswers[3])), "Incorrect answer 4");
        require(keccak256(abi.encodePacked(answer5)) == keccak256(abi.encodePacked(correctAnswers[4])), "Incorrect answer 5");

        winner = player;
        hasAnswered[player] = true;

        // Mint ACS tokens and transfer to the winner
        acsToken.mint(winner, rewardAmount);

        quizState = QuizState.Ended;

        emit QuizEnded(winner, rewardAmount);
    }
}
