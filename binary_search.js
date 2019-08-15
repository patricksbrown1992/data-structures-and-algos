function binarySearch(array, target) {
    if (array.length === 0) {
        return false;
    }

    let mid = Math.floor(array.length/2);
    let left = array.slice(0, mid);
    let right = array.slice(mid + 1);

    if (target === array[mid]){
        return true;
    } else if (target < array[mid]){
        return binarySearch(left, target);
    } else {
        return binarySearch(right, target);
    }
}

function binarySearchIndex(array, target, lo = 0, hi = array.length - 1) {
    if (lo === hi) {
        return -1;
    }

    let midIdx = Math.floor((lo + hi) / 2);

    if (target < array[midIdx]) {
        return binarySearchIndex(array, target, lo, midIdx);
    } else if (target > array[midIdx]) {
        return binarySearchIndex(array, target, midIdx + 1, hi);
    } else {
        return midIdx;
    }
}


module.exports = {
    binarySearch,
    binarySearchIndex
};