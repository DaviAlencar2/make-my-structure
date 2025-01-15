# make-my-structure

É um script simples em Python que cria automaticamente pastas e arquivos com base em uma descrição textual de estrutura de diretórios.

## Funcionalidades
- **Criar pastas e arquivos automaticamente.**
- **Interpretar uma descrição textual da estrutura.**
- **Salvar as pastas e arquivos em um diretório especificado pelo usuário.**
- **Futuramente, verificar se o usuário usou ou não o Chatgpt, para tratar os caracteres diferentes e tamanho de identação.**

##  Como Usar
1. **Clonar o repositório:**
   ```bash
   git clone <https://www.github.com/DaviAlencar2/make-my-structure>
   ```
2. **Instalar as dependências:(Por enquanto, NÃO NECESSÁRIO!!!)**
   ```bash
   pip install -r requirements.txt
   ```
3. **Executar o script:**
   ```bash
   python src/main.py
   ```
4. **Exemplo de entrada no arquivo `sample_structure.txt`:**
```plaintext
projeto/
├── src/
│    ├── main.py
│    ├── tests/
│    │    └── test.py
│    └── utils.py
├── README.md
├── docs/
│    └── hello.txt
└── .gitignore
```

O script criará essa estrutura de arquivos e pastas automaticamente no diretório escolhido.