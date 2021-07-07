const { heapTestCases } = require('./test-cases.js');

const Heap = artifacts.require('Heap');
const MinHeap = artifacts.require('MinHeap');
const MaxHeap = artifacts.require('MaxHeap');

contract('Heap', async accounts => {
    let minHeap;
    let maxHeap;

    beforeEach(async () => {
        minHeap = await Heap.new(true);
        maxHeap = await Heap.new(false);
    });

    for (const test of heapTestCases) {
        it('should build a correct heap given the values in test case id: ' + test.id, async () => {
            await buildHeap(minHeap, test.values);
            await buildHeap(maxHeap, test.values);
            const min = (await minHeap.getMin()).toNumber();
            const max = (await maxHeap.getMax()).toNumber();
            assert.strictEqual(min, test.min);
            assert.strictEqual(max, test.max);
        });
    }
});

// included for sake of completion
contract('MinHeap', async accounts => {
    let minHeap;

    beforeEach(async () => {
        minHeap = await MinHeap.new();
    });

    for (const test of heapTestCases) {
        it('should build a correct MinHeap given the values in test case id: ' + test.id, async () => {
            await buildHeap(minHeap, test.values);
            const min = (await minHeap.getMin()).toNumber();
            assert.strictEqual(min, test.min);
        });
    }
});

// included for sake of completion
contract('MaxHeap', async accounts => {
    let maxHeap;

    beforeEach(async () => {
        maxHeap = await MaxHeap.new();
    });

    for (const test of heapTestCases) {
        it('should build a correct MaxHeap given the values in test case id: ' + test.id, async () => {
            await buildHeap(maxHeap, test.values);
            const max = (await maxHeap.getMax()).toNumber();
            assert.strictEqual(max, test.max);
        });
    }
});

// O(nlog(n)) time complexity until heapify functions implemented
async function buildHeap(heap, values) {
    for (v of values) {
        await heap.insert(v);
    }
}