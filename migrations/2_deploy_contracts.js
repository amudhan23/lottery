const lottery = artifacts.require("lottery");

module.exports = async(deployer) => {

  var price = 10;
  var totalTickets = 5;


  //deploying nft
  await deployer.deploy(lottery, totalTickets, price,{ value: "10" });


};
