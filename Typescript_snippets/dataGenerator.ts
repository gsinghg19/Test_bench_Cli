const urls: string[] = [
  'https://www.example.com',
  'https://www.google.com',
  'https://www.facebook.com',
  'https://www.twitter.com',
  'https://www.github.com',
];

const statusCodes: number[] = [
  200, 201, 301, 302, 400, 401, 403, 404, 500, 503,
];

let output: string = '';

for (let i: number = 0; i < 50; i++) {
  const url: string = urls[Math.floor(Math.random() * urls.length)];
  const statusCode: number =
    statusCodes[Math.floor(Math.random() * statusCodes.length)];
  output += `${url} ${statusCode}\n`;
}

console.log(output);
