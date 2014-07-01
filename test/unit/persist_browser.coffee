assert  = require("assert")
exec = require("exec");
path = require("path")

describe "Option to persist browser across tests", ->
  it "should run without failing", (done) ->
    this.timeout(20000);
    dillPath = path.resolve(path.join(__dirname, "../", "../", "bin/dill"))
    featurePath = path.resolve(path.join(__dirname, "../", "integration/features/form.feature"))
    exec [dillPath, featurePath, "--driver=phantomjs", "--prevent-browser-reload"], (err, out, code) ->
      assert.equal(code, 0, "Error running tests with --prevent-browser-reload flag.")
      done()

