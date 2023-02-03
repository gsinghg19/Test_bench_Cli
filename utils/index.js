const chalk = require("chalk");
const clear = require("clear");
const figlet = require("figlet");
const files = require("../lib/files.js");

clear();

console.log(
  chalk.yellow(figlet.textSync("Test Bench", { horizontalLayout: "full" }))
);
