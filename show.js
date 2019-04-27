
var nums = [1024, 512, 256, 128, 64, 32, 16, 8, 7, 6, 5, 4, 3, 2, 1];
var vals = ["F", "E", "D", "C", "B", "A", "9", "8", "7", "6", "5", "4", "3", "2", "1"];
var res = {};
nums.forEach((num,i) => {
    res[num.toString()] = "\\uF82" + vals[i]
    res[-num] = "\\uF80" + vals[i]
})

console.log(res)