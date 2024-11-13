#/bin/bash

files=()
	extension=""
	replacement=""

	while [[ $# -gt 0 ]]
	do
		case $1 in
			--file)
			if [[ -z "$2" || "$2" == --* ]]; then
                echo "Ошибка: после --file должно следовать имя файла"
                exit 1
            else
                files+=("$2")
            fi
            shift ;;

			--extension)
			if [[ -z "$2" || "$2" == --* ]]; then
                echo "Ошибка: после --extension должно следовать расширение файла"
                exit 1
            else
                extension=$2
            fi
            shift ;;

			--replacement)
			if [[ -z "$2" || "$2" == --* ]]; then
                echo "Ошибка: после --replacement должно следовать расширение файла"
                exit 1
            else
                replacement=$2
            fi
            shift ;;

			*) echo "Error: аргумент $1 не найден"
		esac
		shift
	done

	if [[ -z "$files" || -z "$extension" || -z "$replacement" ]]; then
		echo "Один из обязательных параметров не задан. Обязательные параметры: --file --extension --replacement"
	exit 1
	fi

	for file in "${files[@]}"
	do
		if [[ "${file##*.}" == $extension ]]; then
			new_name="${file%.$extension}.$replacement"
			mv "$file" "$new_name"
			echo "$new_name"
 		fi
	done