const fs = require('fs');

const urls = [
  'https://www.example.com',
  'https://www.google.com',
  'https://www.facebook.com',
  'https://www.twitter.com',
  'https://www.github.com',
];

const statusCodes = [200, 201, 301, 302, 400, 401, 403, 404, 500, 503];

function encodeData(data) {
  // Simple XOR encryption
  const key = Math.floor(Math.random() * 256);
  const encoded = data
    .split('')
    .map((c) => String.fromCharCode(c.charCodeAt(0) ^ key))
    .join('');
  return `${key.toString(16).padStart(2, '0')}:${encoded}`;
}

let output = '';

for (let i = 0; i < 50; i++) {
  const url = urls[Math.floor(Math.random() * urls.length)];
  const statusCode =
    statusCodes[Math.floor(Math.random() * statusCodes.length)];
  const line = `${url} ${statusCode}`;
  const encodedLine = encodeData(line);
  output += `${encodedLine}\n`;
}

fs.writeFile('random_data.txt', output, (err) => {
  if (err) throw err;
  console.log('Data written to file');
});
