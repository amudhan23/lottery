pragma solidity >0.5.0 <=0.9.0;
pragma experimental ABIEncoderV2;


contract lottery{

    address public owner;
    address payable public winner;

    mapping(uint256=>address) public ticketOwner;
    mapping(address=>uint256[]) public ticketsOwnedByIndividuals;

    uint256 public totalTickets;
    uint256 public noOfSoldTickets = 0;
    uint256 public price;


    //to check if its owner
    modifier onlyOwner(){
        require(owner == msg.sender, "Not Owner");
        _;
    }


    //takes in two arguments :
    // totalTickets - toatal number of tickets to be sold
    // price - price in wei
    //the delpoyer becomes the owner of the contract
    constructor(uint256 _totalTickets, uint256 _price) public payable{
        require(_totalTickets > 0, 'No of tickets cannot be zero');  // total number of tickets cannot be zero
        require(_price > 0, 'Need non-zero price');  // price cannot be zeo
        owner = msg.sender;
        totalTickets = _totalTickets;
        price = _price;
        buyTickets(1);   // owner gets the first token
    }


    //to get the current available tickets
    function getAvailableTickets() view public returns(uint256){
        return totalTickets - noOfSoldTickets;
    }


    //buy tickets fn
    function buyTickets(uint256 _noOfTickets) public payable{
        require(_noOfTickets!=0, "Zero not a valid quantity");    // zero unit of tickets cannot be bought
        require(getAvailableTickets() >= _noOfTickets, "Not enough available tickets");  // only available tickets can be bought
        require(msg.value >= price * _noOfTickets, "Not enough ether sent");  // right amount for the number of tickets to be bought should be sent

        for(uint256 i=0; i<_noOfTickets; i++)
        {
            noOfSoldTickets += 1;
            ticketOwner[noOfSoldTickets] = msg.sender;
            ticketsOwnedByIndividuals[msg.sender].push(noOfSoldTickets);
        }

    }


    //owner will call this fn to decide the winner
    function decideWinner() onlyOwner public{
        require(getAvailableTickets()==0, "Tickets still left");     // cannot decide winner if all the tickets are not sold
        require(winner==address(0), "Winner already decided");      // winner is immutable
        winner = payable(ticketOwner[random_forTickets()]);
        winner.transfer(address(this).balance);
    }



    //A simple random function - using ABIEncoderV2 to concatenate few parameters to a randomn number.
    function random_forTickets() public view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender)))%totalTickets+1;
    }



}
