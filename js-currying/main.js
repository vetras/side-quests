import c from "./currying.js";

let sum = 0;

sum = c.add(1, 2, 3);
console.log('The sum of add(1,2,3) is: ', sum);

sum = c.curryAdd(2)(2)(3);
console.log('The sum of curryAdd(2)(2)(3) is: ', sum);

sum = c.lambdaCurryAdd(3)(3)(3);
console.log('The sum of lambdaCurryAdd(3)(3)(3) is: ', sum);

sum = c.addOne(3);
sum = c.addOne(sum)
sum = c.addOne(sum)
console.log('The sum of addOne(3) x3 is: ', sum);