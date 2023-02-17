const readline = require('readline');
const fs = require('fs');

//import the crawl file to read
const inputFile =
  '/Users/gurpreetsingh/Documents/Test_bench_Cli/crawlLogs/crawl.txt'; //add file path here of file to analyize.

// Read in the text file
const fileData = fs.readFileSync(inputFile, 'utf-8');

// Split the file contents into an array of lines
const lines = fileData.trim().split('\n');

// Create an object to hold the data
const data = {};
for (let line of lines) {
  const [date, statusCode, id, url, sha1] = line.split(' ');
  data[url] = statusCode;
}

// Prompt the user to enter a URL
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.question('Enter a URL to search for: ', (url) => {
  const statusCode = data[url];
  if (statusCode) {
    console.log(`The http status code for ${url} is ${statusCode}`);
  } else {
    console.log(`Could not find a record for ${url}`);
  }
  rl.close();
});
