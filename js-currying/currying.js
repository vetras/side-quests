function add(a, b, c) {
  return a + b + c
}

function curryAdd(a) {
  return function (b) {
    return function (c) {
      return a + b + c
    }
  }
}

// just looks weird at first on lambda syntax, but reads nice
let lambdaCurryAdd = a => b => c => a + b + c

// composition -- wow
let addOne = a => 1 + curryAdd(a)(0)(0)

export default {
  add,
  curryAdd,
  lambdaCurryAdd,
  addOne
}