#!/bin/bash

case "$1" in
  --date)
    echo $(date)
    ;;
  
  --logs)
    if [ -z "$2" ]; then
      num_files=100
    else
      num_files=$2
    fi
    
    for ((i=1; i<=$num_files; i++)); do
      filename="log$i.txt"
      echo "Nazwa pliku: $filename" > "$filename"
      echo "Nazwa skryptu: skrypt.sh" >> "$filename"
      echo "Data: $(date)" >> "$filename"
    done
    ;;
  
  --help)
    echo "Dostępne opcje:"
    echo "--help (-h)   - Wyświetla pomoc"
    echo "--logs (-l)   - Tworzy pliki logx.txt, gdzie x to numer pliku (domyślnie 100)"
    echo "--date (-d)   - Wyświetla dzisiejszą datę"
    echo "--init        - Klonuje całe repozytorium i ustawia ścieżkę w zmiennej PATH"
    echo "--error (-e)  - Tworzy pliki errorx.txt, gdzie x to numer pliku (domyślnie 100)"
    ;;
  
  --init)
    git clone <adres_repozytorium> .
    export PATH="$PATH:$(pwd)"
    ;;
  
  --error | -e)
    if [ -z "$2" ]; then
      num_files=100
    else
      num_files=$2
    fi
    
    for ((i=1; i<=$num_files; i++)); do
      filename="error$i.txt"
      echo "Nazwa pliku: $filename" > "$filename"
      echo "Nazwa skryptu: skrypt.sh" >> "$filename"
      echo "Data: $(date)" >> "$filename"
    done
    ;;
  
  *)
    echo "Nieznana opcja. Użyj --help (-h) aby wyświetlić dostępne opcje."
    ;;
esac
