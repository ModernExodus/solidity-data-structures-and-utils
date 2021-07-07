// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// implementation of binary min heap
contract MinHeap {
    uint256[] private minHeap;

    function insert(uint256 value) public returns (uint256 index) {
        minHeap.push(value);
        if (minHeap.length - 1 != 0) {
            return upHeap(minHeap, minHeap.length - 1);
        }
        return 0;
    }

    function getMin() public view returns (uint256 min) {
        return minHeap[0];
    }

    function getSize() public view returns (uint256 size) {
        return minHeap.length;
    }

    function upHeap(uint256[] memory heap, uint256 i) private returns (uint256 index) {
        uint256 temp;
        uint256 parent;
        while (true) {
            parent = (i - 1) >> 1;
            if (heap[i] <= heap[parent]) {
                temp = heap[parent];
                heap[parent] = heap[i];
                heap[i] = temp;
                i = parent;
                if (i == 0) {
                    minHeap = heap;
                    return 0;
                }
            } else {
                minHeap = heap;
                return i;
            }
        }
    }
}