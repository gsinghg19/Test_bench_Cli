const fs = require('fs');

const inputFile = 'input.txt';
const outputFile = 'output.txt';

const regex = /(https?:\/\/[^\s]+)\s+(\d+)/g;

fs.readFile(inputFile, 'utf-8', (err, data) => {
  if (err) throw err;

  const results = [];
  let match;

  while ((match = regex.exec(data)) !== null) {
    results.push({
      url: match[1],
      statusCode: parseInt(match[2], 10),
    });
  }

  const output = results
    .filter((result) => result.statusCode === 200)
    .map((result) => `${result.url} ${result.statusCode}`)
    .join('\n');

  fs.writeFile(outputFile, output, (err) => {
    if (err) throw err;
    console.log(`Results written to ${outputFile}`);
  });
});
