pragma solidity ^0.8.15;

// import "foundry-huff/HuffDeployer.sol";
// import "foundry-huff/HuffDeployer.sol";
import "forge-std/Test.sol";
import "forge-std/console.sol";

import "src/interfaces/IERC721.sol";

import {HuffDeployer} from "src/lib/utils/HuffDeployer.sol";


contract ERC721 is Test {

    ///@notice create a new instance of HuffDeployer
    HuffDeployer huffDeployer = new HuffDeployer();

    IERC721 erc721;

    function setUp() public {
        // Deploy a new instance of src/ERC20.huff
        erc721 = IERC721(huffDeployer.deployContract("ERC721"));
        // erc721 = IERC721(impl);

    }

    // function testName() external {
    //     assertEq("PICCOLO",erc721.name());
    // }

}
