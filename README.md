# Test_bench_Cli

A repository to create files for testing

## Installation

Run 'npm install' to install dependencies.

# Commands:

1. To run go_playback : In your terminal run the following command:
   `bash go.sh `

and then just enter your aws-vault password and mfa code as usual.

2. To run cathode, run ; `bash cathode.sh` in your terminal.

3. To run neodelorian, run ; `bash neo.sh` in your terminal.

4. To run pywb, run ; `bash pywb.sh` in your terminal.

5. node lineReader.js

6. node urlHttpCodeFormatter.js

7. node randoDataGenerator.js

## Javascript_snippets Folder:

This folder contains javascript snippets that I have written to help me with my work.

### 1.linereader.js:

In this code, we first use the fs module to read in the contents of the input file as a string. We then split the string into an array of lines using split('\n').

Next, we create an object called data to hold the information in the file. We loop through each line of the file and extract the fields using split(' '). We use the URL as the key in the data object and the http status code as the value.

We then use the readline module to prompt the user to enter a URL to search for. We use the question method of the readline interface to display the prompt and wait for the user to enter a response.

Once the user enters a URL, we look up the corresponding http status code in the data object. If a match is found, we log a message to the console with the URL and its corresponding http status code. If a match is not found, we log a message indicating that no record was found.

Note that this assumes that the input file has the format "date http_status_code id url sha1_value", with a space character as the separator between the fields. If your input file has a different format, you'll need to modify the split method to extract the fields correctly.

### 2. urlHttpcodeFormatter.js

This code uses a regular expression to match URLs and their corresponding HTTP status codes in the input text file. The regular expression /(https?:\/\/[^\s]+)\s+(\d+)/g matches any string starting with http:// or https://, followed by one or more non-whitespace characters, followed by one or more whitespace characters, followed by a numeric HTTP status code. The g flag at the end of the regular expression ensures that all matches are found, not just the first one.

The code then loops through all matches and pushes them to an array of objects with url and statusCode properties.

Finally, the code filters the array to include only objects with a statusCode property of 200, formats them as strings, and writes them to a new file using the fs.writeFile method.

### 3. RandoDataGenerator.js

In this version of the code, we've added a encodeData() function that implements a simple XOR encryption scheme. The function takes a string of data, generates a random key between 0 and 255, applies the XOR operation between the key and the ASCII code of each character in the data string, and returns a string with the format <key>:<encoded data>. The encodedLine variable is then generated by passing the line variable through the encodeData() function.

The output variable is then generated as before, but using encodedLine instead of line. Finally, we write the output variable to the random_data.txt file as before.

### 4. jsonDiffChecker.js

This code first reads the contents of the two JSON files using the fs.readFileSync() function. It then defines a compareJSON() function that takes two JSON objects as input and returns an object containing the differences between the two objects. The compareJSON() function loops through each key in the first object and compares it to the corresponding key in the second object. If the keys are the same and the values are different, the key and both values are added to the result object. If the key exists only in the first object, the key and its value are added to the result object with the second value set to undefined. If the key exists only in the second object, the key and its value are added to the result object with the first value set to undefined.

The code then calls the compareJSON() function with the contents of the two JSON files and saves the result to a new file named diff.json using the fs.writeFileSync() function. The JSON.stringify() function is used to convert the result object to a JSON string, and the null and 2 arguments are used to format the output for readability.

Note that this code assumes that the two JSON files have the same structure and that the keys are unique within each file. If the files have different structures or duplicate keys, the code may produce unexpected results.

### 5. mimeType.js

### still a work in progress.

This code creates a http request to the user-provided URL and collects the response data. It then analyzes the MIME types by parsing the content-type header of the response, and writes the MIME types to a new file called mime-types.txt using the fs module.

## TO DO:

[√] create bash scripts for neo

[√] create bash scritp for pywb

[√] create bash script for go_playback

[√] create bash script for cathode

[√] create bash script for pywb troubleshooting repo (local pywb testing)

[] Add redis server command in my bash scripts.

[] create custom cli with; ===> https://www.sitepoint.com/javascript-command-line-interface-cli-node-js/ <===(tutorial on hoow to create one on this site.)

chalk — colorizes the output

clear — clears the terminal screen

clui — draws command-line tables, gauges and spinners

figlet — creates ASCII art from text

inquirer — creates interactive command-line user interface

minimist — parses argument options

configstore — easily loads and saves config without you having to think about where and how.

Additionally, we’ll also be using the following:

@octokit/rest — a GitHub REST API client for Node.js

@octokit/auth-basic — an implementation of one of GitHub’s authentication strategies

lodash — a JavaScript utility library

simple-git — a tool for running Git commands in a Node.js application

touch — a tool for implementing the Unix touch command.
