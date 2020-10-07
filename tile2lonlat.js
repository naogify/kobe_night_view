// const argv = require("minimist")(process.argv.slice(2));
// console.log(argv);

function tile2long(x,z) {
return (x/Math.pow(2,z)*360-180);
}

function tile2lat(y,z) {
var n=Math.PI-2*Math.PI*y/Math.pow(2,z);
return (180/Math.PI*Math.atan(0.5*(Math.exp(n)-Math.exp(-n))));
}