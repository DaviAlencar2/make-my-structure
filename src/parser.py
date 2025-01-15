def parse_structure(file_path) -> dict:

    structure = {}
    stack = [structure]
    previous_indent = 0

    with open(file_path,"r",encoding="utf-8") as file:
        lines = file.readlines()

    for line in lines:
        line = line.rstrip()
        if not line.strip():
            continue

        indent_level = len(line) - len(line.lstrip("│ "))

        while indent_level < previous_indent:
            if len(stack) > 2:  
                stack.pop()
            previous_indent -= 4 
            # print(indent_level, previous_indent)

        if line.endswith("/"):
            folder_name = line.replace('├── ', '').replace('└──','').replace('│   ', '').replace('/', '').strip()
            current_folder = {}
            stack[-1][folder_name] = current_folder
            stack.append(current_folder)

        else:
            file_name = line.replace('├──', '').replace('└──','').replace('│    ','').strip()
            stack[-1][file_name] = None
            
        previous_indent = indent_level


    return structure

#teste rapido
if __name__ == "__main__":
    structure = parse_structure("./examples/sample_structure.txt")
    print(structure)