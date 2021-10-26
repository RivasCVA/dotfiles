/**
 * Dotfile Manager script.
 * This script will save all files and directories into
 * a local folder to push to GitHub or any other service.
 * 
 * How to use:
 * 
 * (1) Add all of your file and directory paths into the "dotfiles.save" file.
 * - All paths must begin from the root (i.e. ~/path/to/save).
 * 
 * (2) Run the "main.cpp" script.
 * - Run: `g++ main.cpp && ./a.out`.
 * 
 * (3) Push the entire "dotfiles/" directory to GitHub or any other service.
 * - The "save/" directory will hold all of your saved files and directories.
 * 
 * Note: The "other/" directory can be used to save other miscellaneous files and directories.
 * 
 * Author: Carlos Rivas
 */

#include <iostream>
#include <fstream>
#include <string>

using namespace std;
bool run_command(string command);

/** File holding all of the dotfile paths to save. */
const string SAVE_FILE_NAME = "dotfiles.save";

/** Path to the save directory. */
const string SAVE_DIR_PATH = "save";

int main() {
    // clear the save directory
    if (run_command("rm -rf " + SAVE_DIR_PATH + " && mkdir " + SAVE_DIR_PATH)) {
        cout << "- reset save directory" << endl;
    } else {
        cerr << "ERROR: Could not reset save directory" << endl;
        exit(EXIT_FAILURE);
    };

    // read the dotfile paths
    ifstream input_file(SAVE_FILE_NAME);
    string line;

    if (!input_file.is_open()) {
        cerr << "ERROR: Could not open file \"" << SAVE_FILE_NAME << "\"" << endl;
        exit(EXIT_FAILURE);
    }

    // process each file path
    while (getline(input_file, line)) {
        if (!line.length()) {
            continue;
        }

        // ignore comments
        if (line.length() >= 2 && line[0] == '/' && line[1] == '/') {
            continue;
        }

        if (line[0] != '~') {
            cout << "WARNING: Did not copy \"" << line << "\"" << endl;
            cout << "- Path must begin at the root: ~/path/to/dotfile" << endl;
            continue;
        }

        // copy the file or directory into the save directory
        if (run_command("cp -r " + line + " " + SAVE_DIR_PATH)) {
            cout << "- saved " << line << endl;
        } else {
            cerr << "ERROR: Did not save " << line << endl;
        }
    }

    input_file.close();
    return 0;
}

/**
 * Run a shell command.
 * @param command Command to execute.
 * @returns Status of the execution:
 * true if successful, false if failure.
 */
bool run_command(string command) {
    int system_status = system(command.c_str());
    return system_status == 0;
}
