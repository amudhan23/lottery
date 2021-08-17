const Lottery = artifacts.require("lottery");

contract("Lottery", async accounts => {

  var price = 1;
  var totalTickets = 5;

  it("Check for deployment", async () => {
    const instance = await Lottery.deployed(totalTickets, price);
    console.log(instance.address);
    assert(instance.address !== '');
  });


  it("check for owner", async () =>{
    const instance = await Lottery.deployed(totalTickets, price);
    first_account = accounts[0];
    ownerAddress = await instance.owner.call();
    assert.equal(accounts[0],ownerAddress);
  });

  it("check the holder of the first token", async() =>{
    const instance = await Lottery.deployed(totalTickets, price);
    ownerAddress = await instance.owner.call();
    firstTicketOwner = await instance.ticketOwner.call(1);

    totalTickets = await instance.totalTickets.call();
    console.log("totalTickets : ",totalTickets.toNumber());

    assert.equal(ownerAddress, firstTicketOwner)
  });

  it("buy token with 0 amount", async() =>{
    const instance = await Lottery.deployed();
    response = await instance.buyTickets(0, {from : accounts[1]})
    console.log(response)
  });



});
