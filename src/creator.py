from tkinter import Tk
from tkinter.filedialog import askdirectory
import os

def create_structure(base_path, structure) -> None:
    for name, content in structure.items():
        current_path = os.path.join(base_path, name)
        
        if isinstance(content, dict):
            os.makedirs(current_path, exist_ok=True)
            create_structure(current_path, content)
        else:
            with open(current_path, 'w', encoding='utf-8') as file:
                file.write("")  

def select_folder() -> str:
    Tk().withdraw()
    folder = askdirectory(title="Selecione a pasta onde a estrutura será criada")
    return folder