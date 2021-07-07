// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// implementation of binary heap (either min or max set on construction)
contract Heap {
    bool private minHeap;
    uint256[] private _heap;

    // true -> min heap; false -> max heap
    constructor (bool ht) {
        minHeap = ht;
    }

    function insert(uint256 value) public returns (uint256 index) {
        _heap.push(value);
        if (_heap.length - 1 != 0) {
            return upHeap(_heap, _heap.length - 1);
        }
        return 0;
    }

    function getMin() public view returns (uint256 min) {
        require(minHeap);
        return _heap[0];
    }

    function getMax() public view returns (uint256 max) {
        require(!minHeap);
        return _heap[0];
    }

    function getSize() public view returns (uint256 size) {
        return _heap.length;
    }

    function upHeap(uint256[] memory heap, uint256 i) private returns (uint256 index) {
        uint256 temp;
        uint256 parent;
        while (true) {
            parent = (i - 1) >> 1;
            if (minHeap ? heap[i] <= heap[parent] : heap[i] >= heap[parent]) {
                temp = heap[parent];
                heap[parent] = heap[i];
                heap[i] = temp;
                i = parent;
                if (i == 0) {
                    _heap = heap;
                    return 0;
                }
            } else {
                _heap = heap;
                return i;
            }
        }
    }
}