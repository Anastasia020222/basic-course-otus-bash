#/bin/bash

path=""
text=""

	while [[ $# -gt 0 ]]
	do
		case $1 in
			--file)
			if [[ -z "$2" || "$2" == --* ]]; then
				echo "Ошибка: после --file должен следовать путь файла"
				exit 1
			else
				path="$2"
			fi
        	shift ;;

  		--search)
			if [[ -z "$2" || "$2" == --* ]]; then
            	echo "Ошибка: после --search должен следовать тект, который необходимо найти в файле"
            	exit 1
        	else
        		text="$2"
        	fi
        	shift ;;

			*) echo "Error: параметр $1 не найден"
    	esac
		shift
	done

	if [[ -z "$path" || -z "$text" ]]; then
		echo "Один из обязательных параметров не задан. Обязательные параметры: --file --search"
	exit 1
	fi

  count="$(grep -o -i "$text" "$path" | wc -l)"

  if [ "$count" == 0 ]; then
    echo "Не найдено не одного совпадения в файле $(realpath $path)"
  exit 1
  fi

  echo "Найдено количество совпадений: $count"