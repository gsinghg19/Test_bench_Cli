# Test_bench_Cli
A repository to create bash files for testing

# Instructions:

1. To run go_playback : In your terminal run the following command:
```bash go.sh ```

and then just enter your aws-vault password and mfa code as usual.

2. To run cathode, run ; ```bash cathode.sh``` in your terminal.

3. To run neodelorian, run ; ```bash neo.sh``` in your terminal.

4. To run pywb, run ; ```bash pywb.sh``` in your terminal.



## Javascript_snippets Folder: 
This folder contains javascript snippets that I have written to help me with my work.
### 1.linereader.js:
In this code, we first use the fs module to read in the contents of the input file as a string. We then split the string into an array of lines using split('\n').

Next, we create an object called data to hold the information in the file. We loop through each line of the file and extract the fields using split(' '). We use the URL as the key in the data object and the http status code as the value.

We then use the readline module to prompt the user to enter a URL to search for. We use the question method of the readline interface to display the prompt and wait for the user to enter a response.

Once the user enters a URL, we look up the corresponding http status code in the data object. If a match is found, we log a message to the console with the URL and its corresponding http status code. If a match is not found, we log a message indicating that no record was found.

Note that this assumes that the input file has the format "date http_status_code id url sha1_value", with a space character as the separator between the fields. If your input file has a different format, you'll need to modify the split method to extract the fields correctly.



## TO DO: 
[√] create bash scripts for neo
[√] create bash scritp for pywb
[√] create bash script for go_playback
[√] create bash script for cathode
[√] create bash script for pywb troubleshooting repo (local pywb testing)
[] Add redis server command in my bash scripts.
[] create custom cli with;   ===> https://www.sitepoint.com/javascript-command-line-interface-cli-node-js/ <===(tutorial on hoow to create one on this site.)
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

