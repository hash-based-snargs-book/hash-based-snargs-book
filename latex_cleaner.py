import sys
import re


def remove_command(input_string, command):
    depth = 0
    output = []
    skip = 0

    com_len = len(command)

    i = 0
    while i < len(input_string):
        if input_string[i:i+2 + com_len] == '\\' + command + '{':
            if depth == 0:
                skip = 1
            depth += 1
            i += 4  # Move the index to the end of '\ale{'
        elif input_string[i] == '{' and depth > 0:
            depth += 1
            i += 1
        elif input_string[i] == '}' and depth > 0:
            depth -= 1
            if depth == 0:
                skip = 0
                i += 1  # Skip the closing '}'
                continue
        if depth == 0 and not skip:
            output.append(input_string[i])
        i += 1

    return ''.join(output)


def process_latex_file(input_file, output_file):
    with open(input_file, 'r') as file:
        lines = file.readlines()

    with open(output_file, 'w') as file:
        # Always write the first line as is
        file.write(lines[0])

        for line in lines[1:]:
            # Remove comments, but keep lines starting with %%%%%
            if not line.lstrip().startswith('%%%%%'):
                line = re.sub(r'(?<!\\)%.*', '', line)

            line = line.replace('\\later', '')

            # Remove specific LaTeX commands
            line = remove_command(line, "ale")
            line = remove_command(line, "eylon")

            if ("dtcolornote" in line):
                line = ""
            
            if ("notes=true,draft]{dtrt}" in line):
                line = "\\usepackage[later=false,notes=true]{dtrt}\n"

            line = line.rstrip()
            if not line.endswith('\n'):
                line += '\n'

            file.write(line)

def main():
    if len(sys.argv) != 2:
        print("Usage: python latex_cleaner.py <input_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = "public-" + input_file
    process_latex_file(input_file, output_file)

if __name__ == "__main__":
    main()
