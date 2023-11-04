#!/bin/bash

# Проверка наличия входных параметров
if [ $# -ne 2 ]; then
  echo "Usage: $0 <N> <M>"
  exit 1
fi

# Получение входных параметров
N=$1
M=$2

# Функция для генерации N случайных чисел и записи в файл
generate_numbers() {
  local count=$1
  local output_file=$2

  # Генерация случайных чисел и запись в файл
  for ((i=0; i<count; i++)); do
    echo $((RANDOM % 1000)) >> $output_file
  done
}

# Переменная для подсчета общего количества уникальных чисел
total_unique_numbers=0

# Повторение генерации чисел M раз
for ((j=0; j<M; j++)); do
  # Генерация чисел и запись в файл (используется имя файла с уникальным идентификатором)
  output_file="results_$j.txt"
  generate_numbers $N $output_file

  # Подсчет уникальных чисел
  unique_numbers=$(sort -u $output_file | wc -l)

  # Вывод результата для текущего файла
  echo "Iteration $((j+1)): $unique_numbers unique numbers"

  # Обновление общего количества уникальных чисел
  total_unique_numbers=$((total_unique_numbers + unique_numbers))
done

# Вывод общего количества уникальных чисел
echo "Total unique numbers: $total_unique_numbers"
