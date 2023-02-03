const index = require("../utils/index.js");

describe("Test index file", () => {
  test("should first get the current directory where bash scripts are kept", () => {
    expect(index.getCurrentDirectoryBase()).toBe("scripts");
    expect(index.getCurrentDirectoryBase()).toBe("cathode.sh");
  });
});
