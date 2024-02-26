import { InputBoxOptions, OpenDialogOptions, window } from "vscode";
import * as _ from "lodash";
import { writeFile } from "fs";
import mkdirp from "mkdirp";

export function promptForName(value: string): Thenable<string | undefined> {
    const pageName: InputBoxOptions = {
        prompt: "Name",
        placeHolder: "product",
        value: value,
    };
    return window.showInputBox(pageName);
}

export async function promptForTargetDirectory(): Promise<string | undefined> {
    const options: OpenDialogOptions = {
        canSelectMany: false,
        openLabel: "Select a folder to create the page in",
        canSelectFolders: true,
    };

    return window.showOpenDialog(options).then((uri) => {
        if (_.isNil(uri) || _.isEmpty(uri)) {
            return undefined;
        }
        return uri[0].fsPath;
    });
}

export function createDirectory(targetDirectory: string) {
    mkdirp.mkdirpSync(targetDirectory);
  }
  
  export function createFile(
    fileName: string,
    targetDirectory: string,
    content: string
  ) {
    return new Promise<void>(async (resolve, reject) => {
      writeFile(`${targetDirectory}/${fileName}`, content, "utf8", (error) => {
        if (error) {
          reject(error);
          return;
        }
        resolve();
      });
    });
  }
  