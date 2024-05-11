#!/usr/bin/env osascript

set scriptFolder to (POSIX path of ((path to me as text) & "::"))
set inFile to (POSIX file (scriptFolder & "diagrams.key"))
set outFile to POSIX file (scriptFolder & "diagrams.pdf")
tell application "Keynote"
    open inFile
    export document 1 as PDF to outFile
    quit
end tell