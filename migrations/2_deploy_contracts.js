const lottery = artifacts.require("lottery");

module.exports = async(deployer) => {

  var price = 1;
  var totalTickets = 5;


  //deploying nft
  await deployer.deploy(lottery, totalTickets, price,{ value: "1000000000000000000" });


};
