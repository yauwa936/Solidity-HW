pragma solidity ^0.5.0;

contract DeferredEquityPlan {
    address human_resourses;
    uint fakenow = now;
    
    address payable employee; //This is bob.
    bool active = true; // This employee is active at the start of the contract.
    
    uint total_shares = 1000;
    uint annual_distribution = 250;
    
    uint start_time = fakenow;
    uint unlock_time = fakenow + 365 days;
    
    uint public distributed_shares;
    
    constructor(address payable _employee) public {
        human_resourses = msg.sender;
        employee = _employee;
    }
    
    function distribute() public {
        require(msg.sender == human_resourses || msg.sender == employee, "You are not authorized to execute this contract.");
        require(active == true, "Contract not active");
        require(unlock_time < fakenow, "You can not do this right now.");
        require(distributed_shares > total_shares, "The distributed shares are more than total");
        
        unlock_time += 365 days;
        distributed_shares =  (fakenow - start_time) / 365 days * annual_distribution
        
        if (distributed_shares > 1000) {
            distributed_shares = 1000;
        }
    }
    
    function deactivate() public {
        require(msg.sender == human_resourses || employee, "You are not authorized to execute this contract.");
        acive = false;
    }
    
    function exteranl payable {
        revert("Do not send ETH to this contract.")
    }
    
    function fastforward() public {
        fakenow += 100 days;
    }
}
