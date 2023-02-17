const fs = require('fs');

const file1Data = JSON.parse(fs.readFileSync('./file1.json', 'utf8')); //add json files here. They must be in the same directory as this file.
const file2Data = JSON.parse(fs.readFileSync('./file2.json', 'utf8'));

function compareJSON(obj1, obj2) {
  let result = {};

  // loop through each key in the first object
  for (let key in obj1) {
    if (key in obj2) {
      if (obj1[key] !== obj2[key]) {
        result[key] = [obj1[key], obj2[key]];
      }
    } else {
      result[key] = [obj1[key], undefined];
    }
  }
  for (let key in obj2) {
    if (!(key in obj1)) {
      result[key] = [undefined, obj2[key]];
    }
  }
  return result;
}

// compare the two JSON objects
const diff = compareJSON(file1Data, file2Data);

fs.writeFileSync('./diff.json', JSON.stringify(diff, null, 2));
