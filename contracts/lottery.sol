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

    constructor(uint256 _totalTickets, uint256 _price) public payable{
        require(_totalTickets > 0, 'No of tickets cannot be zero');
        require(_price > 0, 'Need non-zero price');
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
        require(_noOfTickets!=0, "Zero not a valid quantity");
        require(getAvailableTickets() >= _noOfTickets, "Not enough available tickets");
        require(msg.value >= price*_noOfTickets, "Not enough ether sent");

        for(uint256 i=0; i<_noOfTickets; i++)
        {
            noOfSoldTickets += 1;
            ticketOwner[noOfSoldTickets] = msg.sender;
            ticketsOwnedByIndividuals[msg.sender].push(noOfSoldTickets);
        }

    }

    //owner will call this fn to decide the winner
    function decideWinner() onlyOwner public{
        require(getAvailableTickets()==0, "Tickets still left");
        winner = payable(ticketOwner[random_forTickets()]);
        winner.transfer(address(this).balance);
    }


    function random_forTickets() public view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender)))%totalTickets+1;
    }



}
