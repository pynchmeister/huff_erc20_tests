// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

// import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

import {HuffDeployer} from "src/lib/utils/HuffDeployer.sol";
import "src/interfaces/IERC20.sol";

// interface IERC20 {
//     function name() external view returns (string memory);
//     function symbol() external view returns (string memory);
//     function decimals() external view returns (uint8);
//     function totalSupply() external view returns (uint256);
//     function balanceOf(address account) external view returns (uint256);
//     function transfer(address to, uint256 amount) external returns (bool);
//     function transferFrom(address from, address to, uint256 amount) external returns (bool);    
//     function approve(address spender, uint256 amount) external returns (bool);
//     function allowance(address owner, address spender) external view returns (uint256);

// }

contract ERC20Test is Test {

    ///@notice create a new instance of HuffDeployer
    HuffDeployer huffDeployer = new HuffDeployer();

    IERC20 huffERC20;

    // address alice = vm.addr(0x1);
    // // address bob = vm.addr(0x2);

    function setUp() public {
        // Use the huff deployer to deploy the huff contract, returning the address
        // of the newly deployed contract instance

        // taking a look at the ERC20 constructor, it takes three arguments
        // constructor(string memory _name, string memory _symbol, uint8 _decimals)
        // We can pass args into the huff deployer like this

        string memory _name = "JawnToken";
        string memory _symbol = "JAWN";
        uint8 _decimals = 18;

        // the arguments are packed into a byte array so that the huff deployer can 
        // use them during deployment. You check out how this works under the hood by referencing
        // the huff deployer contract

        bytes memory args = abi.encode(_name, _symbol, _decimals);

        // now we can deploy the contract, which should return the newly deployed contract address
        // if everything is successful

        IERC20 huffERC20 = IERC20(huffDeployer.deployContract("ERC20", args));

        // Then you can use the initialized new instance of a IERC20

    }

    // This function should test the name function in the IERC20 interface
    // and since we used the deployed huff contract's address to initialize the IERC20
    // we are actually testing the huff contract
    function testName() external {
        
        // Here is the function sig of the name() method
        // function name() external view returns (string memory);
        // so we can call huffERC20.name() and assert that the return value is correct

        string memory nameResult = huffERC20.name();
        assertEq(nameResult, "JawnToken");

    }

//     function testSymbol() external {
//         assertEq("GK", impl.symbol());
//     }

    // function testMint() public {
    //     erc20.mint(alice, 2e18);
    //     assertEq(erc20.totalSupply(), erc20.balanceOf(alice));
    // }

//     function testBurn() public {
//         impl.mint(alice, 10e18);
//         assertEq(impl.balanceOf(alice),10e18);
        
//         impl.burn(alice, 8e18);

//         assertEq(impl.totalSupply(), 2e18);
//         assertEq(impl.balanceOf(alice),2e18);
//     }

    // function testApprove() public {
    //     // console.log("Total Supply:", sut.totalSupply());
    //     // console.log("Console's not working");
    //     assertTrue(erc20.approve(alice, 1e18));
    //     assertEq(erc20.allowance(address(this),alice), 1e18);
    // }

//     function testIncreaseAllowance() external {
//         assertEq(impl.allowance(address(this), alice), 0);
//         assertTrue(impl.increaseAllowance(alice , 2e18));
//         assertEq(impl.allowance(address(this), alice), 2e18);
//     }

//     function testDescreaseAllowance() external {
//         testApprove();
//         assertTrue(impl.decreaseAllowance(alice, 0.5e18));
//         assertEq(impl.allowance(address(this), alice), 0.5e18);
//     }

//     function testTransfer() external {
//         testMint();
//         vm.startPrank(alice);
//         impl.transfer(bob, 0.5e18);
//         assertEq(impl.balanceOf(bob), 0.5e18);
//         assertEq(impl.balanceOf(alice), 1.5e18);
//         vm.stopPrank();
//     }

//     function testTransferFrom() external {
//         testMint();
//         vm.prank(alice);
//         impl.approve(address(this), 1e18);
//         assertTrue(impl.transferFrom(alice, bob, 0.7e18));
//         assertEq(impl.allowance(alice, address(this)), 1e18 - 0.7e18);
//         assertEq(impl.balanceOf(alice), 2e18 - 0.7e18);
//         assertEq(impl.balanceOf(bob), 0.7e18);
//     }

//     function testFailMintToZero() external {
//         impl.mint(address(0), 1e18);
//     }

//     function testFailBurnFromZero() external {
//         impl.burn(address(0) , 1e18);
//     }

//     function testFailBurnInsufficientBalance() external {
//         testMint();
//         vm.prank(alice);
//         impl.burn(alice, 3e18);
//     }

//     function testFailApproveToZeroAddress() external {
//         impl.approve(address(0), 1e18);
//     }

//     function testFailApproveFromZeroAddress() external {
//         vm.prank(address(0));
//         impl.approve(alice, 1e18);
//     }

//     function testFailTransferToZeroAddress() external {
//         testMint();
//         vm.prank(alice);
//         impl.transfer(address(0), 1e18);
//     }

//     function testFailTransferFromZeroAddress() external {
//         testBurn();
//         vm.prank(address(0));
//         impl.transfer(alice , 1e18);
//     }

//     function testFailTransferInsufficientBalance() external {
//         testMint();
//         vm.prank(alice);
//         impl.transfer(bob , 3e18);
//     }

//     function testFailTransferFromInsufficientApprove() external {
//         testMint();
//         vm.prank(alice);
//         impl.approve(address(this), 1e18);
//         impl.transferFrom(alice, bob, 2e18);
//     }

//     function testFailTransferFromInsufficientBalance() external {
//         testMint();
//         vm.prank(alice);
//         impl.approve(address(this), type(uint).max);

//         token.transferFrom(alice, bob, 3e18);
//     }

}
