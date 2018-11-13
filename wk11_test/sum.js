function sum(list) {
    var Sum = 0;
    for (var i in list){
        temp = parseInt(list[i]);
        Sum += temp;
    }
    return Sum;
}

module.exports = sum;
