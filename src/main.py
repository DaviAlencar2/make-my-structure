from creator import create_structure,select_folder
from parser import parse_structure

sample_path = "./examples/sample_structure.txt"

create_structure(select_folder(),parse_structure(sample_path))