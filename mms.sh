#!/bin/bash

parse_and_create_structure() {
    local estrutura_arquivo="$1"
    local pasta_destino="$2"
    
    if [ ! -f "$estrutura_arquivo" ]; then
        echo "Arquivo de estrutura não encontrado: $estrutura_arquivo"
        exit 1
    fi

    mkdir -p "$pasta_destino"
    
    local nivel_atual=0
    local diretorio_atual="$pasta_destino"
    local pilha_diretorios=("$pasta_destino")
    local indentacao_anterior=0
    
    while IFS= read -r linha || [ -n "$linha" ]; do
        [ -z "$(echo "$linha" | tr -d '[:space:]')" ] && continue
        
        identacao=$(echo "$linha" | grep -o -E "^[│ ]+" | wc -c)
        
        item=$(echo "$linha" | sed 's/[├└]//g' | sed 's/──//g' | sed 's/│//g' | sed 's/^ *//g' | sed 's/ *$//g')
        
        if [ "$identacao" -lt "$indentacao_anterior" ]; then
            diferenca=$((($indentacao_anterior - $identacao) / 4))
            for ((i=0; i<$diferenca; i++)); do
                unset "pilha_diretorios[${#pilha_diretorios[@]}-1]"
            done
            diretorio_atual="${pilha_diretorios[${#pilha_diretorios[@]}-1]}"
        fi
        
        if [[ "$item" == */ ]]; then
            nome_dir="${item%/}"
            caminho_completo="$diretorio_atual/$nome_dir"
            mkdir -p "$caminho_completo"
            pilha_diretorios+=("$caminho_completo")
            diretorio_atual="$caminho_completo"
        else
            touch "$diretorio_atual/$item"
        fi
        
        indentacao_anterior=$identacao
    done < "$estrutura_arquivo"
    
    echo "Estrutura criada com sucesso em: $pasta_destino"
}

selecionar_pasta() {
    echo "Digite o caminho para o diretório de destino (ou deixe em branco para usar o diretório atual):"
    read -r pasta
    
    if [ -z "$pasta" ]; then
        pasta="."
    fi
    
    echo "$pasta"
}

main() {
    local estrutura_arquivo="${1:-./examples/sample_structure.txt}"
    
    local pasta_destino
    if [ -n "$2" ]; then
        pasta_destino="$2"
    else
        pasta_destino=$(selecionar_pasta)
    fi
    
    parse_and_create_structure "$estrutura_arquivo" "$pasta_destino"
}

main "$@"