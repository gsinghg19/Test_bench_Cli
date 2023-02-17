const http = require('http');
const fs = require('fs');

// Replace "http://example.com" with the URL you want to analyze
const url = 'http://www.youtube.com/watch?v=o2cE8hKHhF0';

http
  .get(url, (response) => {
    let data = '';

    response.on('data', (chunk) => {
      data += chunk;
    });

    // When the response is finished, analyze the MIME types and write them to a new file
    response.on('end', () => {
      const mimeTypes = {};
      const contentTypeHeader = response.headers['content-type'];

      if (contentTypeHeader) {
        const contentTypeParts = contentTypeHeader.split(';');
        const mimeType = contentTypeParts[0];

        if (mimeTypes[mimeType]) {
          mimeTypes[mimeType] += 1;
        } else {
          mimeTypes[mimeType] = 1;
        }
      }

      fs.writeFile('mime-types.txt', JSON.stringify(mimeTypes), (err) => {
        if (err) throw err;
        console.log('The file has been saved!');
      });
    });
  })
  .on('error', (err) => {
    console.error(`Error: ${err.message}`);
  });
