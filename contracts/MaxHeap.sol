// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// implementation of binary max heap
contract MaxHeap {
    uint256[] private maxHeap;

    function insert(uint256 value) public returns (uint256 index) {
        maxHeap.push(value);
        if (maxHeap.length - 1 != 0) {
            return upHeap(maxHeap, maxHeap.length - 1);
        }
        return 0;
    }

    function getMax() public view returns (uint256 max) {
        return maxHeap[0];
    }

    function getSize() public view returns (uint256 size) {
        return maxHeap.length;
    }

    function upHeap(uint256[] memory heap, uint256 i) private returns (uint256 index) {
        uint256 temp;
        uint256 parent;
        while (true) {
            parent = (i - 1) >> 1;
            if (heap[i] >= heap[parent]) {
                temp = heap[parent];
                heap[parent] = heap[i];
                heap[i] = temp;
                i = parent;
                if (i == 0) {
                    maxHeap = heap;
                    return 0;
                }
            } else {
                maxHeap = heap;
                return i;
            }
        }
    }
}