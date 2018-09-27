const {join} = require("path");
const  { readFileSync} = require("fs");
const { execSync } = require("child_process");

const name = process.argv[2];

const workspace = getWorkspaceName(name);

if (isOpen(getWorkspaces(), workspace)) {
  execSync("i3-msg workspace " + workspace);
} else {
  execSync("workflow " + name);
}

function getWorkspaceName(name) {
  const path = join("/home/havard/.workflow/flows", name);
  const file = readFileSync(path);

  return /name={.(.*).}/.exec(file)[1];
}

function getWorkspaces() {
  return JSON.parse(execSync("i3-msg -t get_workspaces").toString());

}

function isOpen(workspaces, workspace) {
  for (let ws of workspaces) {
    if (ws.name === workspace) {
      return true;
    }
  }
  return false;
}
