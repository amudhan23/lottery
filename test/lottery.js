const Lottery = artifacts.require("lottery");

contract("Lottery", async accounts => {


  it("Check for deployment", async () => {
    const instance = await Lottery.deployed();
    assert(instance.address !== '');
  });


  it("check for owner", async () =>{
    const instance = await Lottery.deployed();
    ownerAddress = await instance.owner.call();
    assert.equal(accounts[0],ownerAddress);
  });


  it("check the holder of the first token", async() =>{
    const instance = await Lottery.deployed();
    ownerAddress = await instance.owner.call();
    firstTicketOwner = await instance.ticketOwner.call(1);
    assert.equal(ownerAddress, firstTicketOwner)
  });

  it("buy 0 token", async() =>{
    const instance = await Lottery.deployed();

        try {
          await instance.buyTickets(0, {from : accounts[1]})
        }catch (err) {
          assert.equal(err.reason,'Zero not a valid quantity')
        }
  });

  it("buy more than available quantity", async() =>{
    const instance = await Lottery.deployed();

        try {
          await instance.buyTickets(100, {from : accounts[1]})
        }catch (err) {
          assert.equal(err.reason,'Not enough available tickets')
        }
  });


  it("send less amount for a ticket", async() =>{
    const instance = await Lottery.deployed();

        try {
          await instance.buyTickets(1, {from : accounts[1], value:2})
        }catch (err) {
          assert.equal(err.reason,'Not enough ether sent')
        }
  });


  it("not owner calling the decide winner function", async() =>{
    const instance = await Lottery.deployed();

        try {
          response = await instance.decideWinner({from : accounts[1]})
        }catch (err){
          assert.equal(err.reason,'Not Owner')
        }
  });




  it("calling before all the tickets are sold out", async() =>{
    const instance = await Lottery.deployed();

        try {
          await instance.decideWinner()
        }catch (err) {
          assert.equal(err.reason,'Tickets still left')
        }
  });


  it("calling decide winner function more than once", async() =>{
    const instance = await Lottery.deployed();

     await instance.buyTickets(4, {from : accounts[1], value:40})
     await instance.decideWinner()

        try {
          await instance.decideWinner()
        }catch (err) {
          assert.equal(err.reason,'Winner already decided')
        }


  });


});
