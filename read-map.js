const fs = require("fs");
const path = require("path");
let msgpack = require('msgpack5')() // namespace our extensions
    , encode  = msgpack.encode
    , decode  = msgpack.decode

let readStream = fs.readFileSync(path.resolve(__dirname, "./maps/map-12.msg"));

// show multiple objects decoded from stream
console.log(decode(readStream))
