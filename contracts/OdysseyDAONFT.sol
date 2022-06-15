// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract OdysseyDAONFT is ERC721, Ownable {
  constructor() ERC721("Odyssey DAO NFT", "OdysseyDAONFT") {}

  function toString(uint256 value) internal pure returns (string memory) {
    if (value == 0) {
        return "0";
    }
    uint256 temp = value;
    uint256 digits;
    while (temp != 0) {
        digits++;
        temp /= 10;
    }
    bytes memory buffer = new bytes(digits);
    while (value != 0) {
        digits -= 1;
        buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
        value /= 10;
    }
    return string(buffer);
  }

  function random(string memory input) internal pure returns (uint256) {
    return uint256(keccak256(abi.encodePacked(input)));
  }

  function getBackgroundColor(uint256 tokenId) public pure returns (string memory) {
    uint256 rand = random(string(abi.encodePacked(toString(tokenId))));
    bytes32 val = bytes32(rand);
    bytes memory hx = "0123456789ABCDEF";
    bytes memory str = new bytes(6);

    for (uint i = 0; i < 6; i++) {
      str[i] = hx[uint8(val[i]) & 0x0f];
    }

    return string(str);
  }

  function tokenURI(uint256 tokenId) override public pure returns (string memory) {
    string[20] memory parts;

    string memory backgroundColor = getBackgroundColor(tokenId);
    parts[0]= '<svg height="100%" stroke-miterlimit="10" style="fill-rule:nonzero;clip-rule:evenodd;stroke-linecap:round;stroke-linejoin:round;" version="1.1" viewBox="0 0 180 180" width="100%" xml:space="preserve" xmlns="http://www.w3.org/2000/svg" xmlns:vectornator="http://vectornator.io" xmlns:xlink="http://www.w3.org/1999/xlink">';
    parts[1]= '<defs/><clipPath id="ArtboardFrame"><rect height="180" width="180" x="0" y="0"/></clipPath>';
    parts[2]= '<g clip-path="url(#ArtboardFrame)" id="Layer-1" vectornator:layerName="Layer 1">';
    parts[3]= '<path d="M-13.7622-6.67312L198.266-6.67312L198.266 193.233L-13.7622 193.233L-13.7622-6.67312Z" fill="#';
    parts[4]=backgroundColor;
    parts[5]='" fill-rule="evenodd" opacity="1" stroke="none"/>';
    parts[6]= '<path d="M10.9003 80.9652C12.4187 61.3814 46.3185 43.4089 89.7206 43.4089C133.123 43.4089 168.53 61.726 168.777 82.3936C168.911 93.6971 133.123 113.864 89.7206 113.864C46.3185 113.864 9.39693 100.356 10.9003 80.9652Z" fill="none" fill-rule="evenodd" opacity="1" stroke="#ffffff" stroke-linecap="butt" stroke-linejoin="miter" stroke-width="2.5"/>';
    parts[7]= '<path d="M10.0307 86.3593C10.0307 64.5439 45.7911 46.859 89.9037 46.859C134.017 46.859 169.777 64.5439 169.777 86.3593C169.777 108.174 134.017 125.859 89.9037 125.859C45.7911 125.859 10.0307 108.174 10.0307 86.3593Z" fill="#141414" fill-rule="evenodd" opacity="1" stroke="#ffffff" stroke-linecap="butt" stroke-linejoin="miter" stroke-width="0.5"/>';
    parts[8]= '<path d="M10.0486 82.5494C10.0486 61.1813 45.5243 42.6419 89.632 42.6419C133.74 42.6419 169.777 61.1813 169.777 82.5494C169.777 103.917 134.021 121.24 89.9127 121.24C45.805 121.24 10.0486 103.917 10.0486 82.5494Z" fill="#141414" fill-rule="evenodd" opacity="1" stroke="none"/>';
    parts[9]= '<path d="M13.4463 82.4031C13.4463 62.6364 47.0975 46.6123 88.6085 46.6123C130.12 46.6123 163.771 62.6364 163.771 82.4031C163.771 102.169 130.12 118.194 88.6085 118.194C47.0975 118.194 13.4463 102.169 13.4463 82.4031Z" fill="#f9f9f9" fill-rule="evenodd" opacity="0.623665" stroke="none"/>';
    parts[10]= '<path d="M14.722 79.546C14.722 59.7793 48.3099 43.7552 89.7426 43.7552C131.176 43.7552 164.763 59.7793 164.763 79.546C164.763 99.3127 131.176 115.336 89.7426 115.336C48.3099 115.336 14.722 99.3127 14.722 79.546Z" fill="#ff0000" fill-rule="evenodd" opacity="1" stroke="#141414" stroke-linecap="butt" stroke-linejoin="miter" stroke-width="2.5"/>';
    parts[11]= '<path d="M63.4647 53.5806C63.9652 48.5287 85.9043 46.3527 104.001 48.5846C122.098 50.8165 138.116 56.4908 137.615 61.5427C137.115 66.5946 120.553 68.0208 102.457 65.7889C84.3597 63.557 62.9642 58.6325 63.4647 53.5806Z" fill="#ffffff" fill-rule="evenodd" opacity="0.408391" stroke="none"/>';
    parts[12]= '<path d="M27.1711 79.0194C28.601 72.817 45.5705 73.3571 68.8473 79.7077C92.1241 86.0583 111.013 94.4827 109.583 100.685C108.153 106.887 77.741 109.62 54.4642 103.269C31.1874 96.919 25.7412 85.2218 27.1711 79.0194Z" fill="#ffffff" fill-rule="evenodd" opacity="0.408391" stroke="none"/>';
    parts[13]= '<path d="M26.3622 76.2255C26.3622 61.5681 53.9988 49.6859 88.0902 49.6859C122.182 49.6859 149.818 61.5681 149.818 76.2255C149.818 90.8829 122.182 102.765 88.0902 102.765C53.9988 102.765 26.3622 90.8829 26.3622 76.2255Z" fill="#ff0000" fill-rule="evenodd" opacity="1" stroke="none"/>';
    parts[14]= '<path d="M71.5853 63.0756C74.649 61.029 78.1246 59.9274 83.1675 59.5833C87.3029 59.3011 94.713 59.6011 94.713 59.6011C94.713 59.6011 103.198 59.3995 108.538 63.927C110.968 65.9872 112.981 69.8183 112.976 72.8988C112.971 76.0976 112.952 79.0678 112.952 79.0678C112.952 79.0678 112.405 84.4208 108.297 87.523C103.439 91.1925 96.9296 91.7151 96.9296 91.7151L84.95 91.7455C84.95 91.7455 77.5151 92.2386 71.6784 88.3782C66.414 84.8963 65.6061 78.7379 65.6061 78.7379L65.8138 72.3694C65.8138 72.3694 65.675 67.0237 71.5853 63.0756Z" fill="#14111a" fill-rule="evenodd" opacity="1" stroke="none"/>';
    parts[15]= '<path d="M169.991 81.742L169.679 90.1756" fill="none" fill-rule="evenodd" opacity="1" stroke="#ffffff" stroke-linecap="butt" stroke-linejoin="miter" stroke-width="0.5"/>';
    parts[16]= '<path d="M9.85939 80.8222L9.84832 87.0742" fill="none" fill-rule="evenodd" opacity="1" stroke="#ffffff" stroke-linecap="butt" stroke-linejoin="miter" stroke-width="0.5"/>';
    parts[17]= '<path d="M57.9616 72.454L57.9274 78.5351L120.891 78.8134L120.912 72.7878L57.9616 72.454Z" fill="#14111a" fill-rule="evenodd" opacity="1" stroke="none"/>';
    parts[18]= '<path d="M101.472 66.833C106.744 69.8197 106.956 80.5004 101.82 84.1725C97.909 86.9683 82.3858 87.9441 76.7729 84.1238C70.4995 79.8538 72.1703 69.8678 76.338 66.9842C80.9384 63.8012 95.9896 63.7272 101.472 66.833Z" fill="#ff0000" fill-rule="evenodd" opacity="1" stroke="none"/>';
    parts[19]= '</g></svg>';

    string memory output = string(abi.encodePacked(parts[0], parts[1], parts[2], parts[3], parts[4], parts[5], parts[6], parts[7], parts[8]));
    output = string(abi.encodePacked(output, parts[9], parts[10], parts[11], parts[12], parts[13], parts[14], parts[15], parts[16]));
    output = string(abi.encodePacked(output, parts[17], parts[18], parts[19]));
   
    string memory json = Base64.encode(bytes(string(abi.encodePacked('{"name": "OdysseyDAO Launch button NFT", "description": "This NFT represents participation in OdysseyDAO.", "image": "data:image/svg+xml;base64,', Base64.encode(bytes(output)), '"}'))));
    output = string(abi.encodePacked('data:application/json;base64,', json));

    return output;
  }

  function mint(uint256 tokenId) public {
    _safeMint(_msgSender(), tokenId);
  }
}

library Base64 {
    bytes internal constant TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    /// @notice Encodes some bytes to the base64 representation
    function encode(bytes memory data) internal pure returns (string memory) {
        uint256 len = data.length;
        if (len == 0) return "";

        // multiply by 4/3 rounded up
        uint256 encodedLen = 4 * ((len + 2) / 3);

        // Add some extra buffer at the end
        bytes memory result = new bytes(encodedLen + 32);

        bytes memory table = TABLE;

        assembly {
            let tablePtr := add(table, 1)
            let resultPtr := add(result, 32)

            for {
                let i := 0
            } lt(i, len) {

            } {
                i := add(i, 3)
                let input := and(mload(add(data, i)), 0xffffff)

                let out := mload(add(tablePtr, and(shr(18, input), 0x3F)))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(12, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(6, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(input, 0x3F))), 0xFF))
                out := shl(224, out)

                mstore(resultPtr, out)

                resultPtr := add(resultPtr, 4)
            }

            switch mod(len, 3)
            case 1 {
                mstore(sub(resultPtr, 2), shl(240, 0x3d3d))
            }
            case 2 {
                mstore(sub(resultPtr, 1), shl(248, 0x3d))
            }

            mstore(result, encodedLen)
        }

        return string(result);
    }
}
