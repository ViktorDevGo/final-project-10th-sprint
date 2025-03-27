#!/bin/bash

# создаём каталог task с вложенными директориями
# task
#   dir1
#   dir2
#   dir3
#       dir4

mkdir /tmp/task
mkdir /tmp/task/dir1 /tmp/task/dir2 /tmp/task/dir3
mkdir /tmp/task/dir3/dir4

# изменяем текущую директорию на task

cd /tmp/task

# создаём пустой файл task/dir2/empty

touch /tmp/task/dir2/empty

# создаём файл task/dir2/hello.sh с таким содержанием:
# #!/bin/bash
# echo "$1, привет!"

echo '#!/bin/bash
echo "$1, привет!"' > /tmp/task/dir2/hello.sh

# устанавливаем для task/dir2/hello.sh права rwxrw-r--

cd /tmp/task/dir2
chmod 764 hello.sh

# сохраняем список файлов task/dir2 в task/dir2/list.txt

touch /tmp/task/dir2/list.txt
ls > list.txt

# копируем содержимое каталога task/dir2 в каталог task/dir3/dir4

cp -r /tmp/task/dir2/. /tmp/task/dir3/dir4

# записываем в task/dir1/summary.txt список файлов с расширением *.txt
# находящихся в task, включая поддиректории

touch /tmp/task/dir1/summary.txt
find /tmp/task -name "*.txt" > /tmp/task/dir1/summary.txt

# дописываем в task/dir1/summary.txt содержимое task/dir2/list.txt

cat /tmp/task/dir2/list.txt >> /tmp/task/dir1/summary.txt

# определяем переменную окружения NAME со значением "Всем студентам"

export NAME="Всем студентам"
export IFS=""

# запускаем task/dir2/hello.sh с переменной окружения NAME в качестве аргумента
# вывод скрипта должен дописаться в файл task/dir1/summary.txt

chmod +x hello.sh
./hello.sh $NAME

# перемещаем с переименованием task/dir1/summary.txt в task/Практическое задание

mv /tmp/task/dir1/summary.txt /tmp/task/'Практическое задание'

# выводим на консоль содержимое файла task/Практическое задание

cat /tmp/task/'Практическое задание'

# ищем в файле "Практическое задание" строки, которые содержат слово "dir"
# и затем отсортировываем их

grep -i "dir" /tmp/task/'Практическое задание' | sort

# меняем текущую директорию на родительскую для task

cd /tmp

# удаляем директорию task со всем содержимым

rm -rf /tmp/task
