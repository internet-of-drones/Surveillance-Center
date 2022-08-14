const fs = require("fs");
const path = require("path");
let msgpack = require('msgpack5')() // namespace our extensions
    , encode  = msgpack.encode
    , decode  = msgpack.decode

let readStream = fs.readFileSync(path.resolve(__dirname, "./maps/map-12.msg"));

let csv = "x,y\n"
// show multiple objects decoded from stream
let pointCloud2 = decode(readStream);
let {
    cameras,
    frame_next_id,
    keyframe_next_id,
    keyframes,
    landmark_next_id,
    landmarks,
    orb_params
} = pointCloud2;
for (const landmarksKey in landmarks) {
    let {
        // '1st_keyfrm',
        n_fnd,
        n_vis,
        pos_w: [ x, y, z ],
        ref_keyfrm
    } = landmarks[landmarksKey]
    csv += `${x},${y}\n`
}
fs.writeFileSync(path.resolve(__dirname, "./pointcloud.csv"), csv)
