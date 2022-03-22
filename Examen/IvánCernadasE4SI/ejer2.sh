#!\bin\bash
if [ $# -le 2 ]
then
	echo Error en los argumentos
else
	while echo [V] Vacío
	echo [P] Primeras
	echo [D] Doble
	echo [M] Mitad
	echo [F] FIN
	read opcion
	[ $opcion != FIN ]
do
	case $opcion in
		V|v) file=("$@")
			for(( i=0; i<$#; i++ ))
			do
				[ -f ${file[$i]} ] && (cat ejer2.sh >> ${file[$i]}) && echo ${file[$i]} "es un fichero, copiando el script"|| echo ${file[$i]} "No es un fichero"
			done;
			echo"";;
		P|p) echo Introduce un nombre de un fichero
			read file
			([ -r $file ] && (head -n5 $file))|| echo "El fichero no existe o no tiene permiso de lectura";;
		M|m)
		par=$(($# / 2))
		impares=$(($par + 1))
		if [ $(expr $# % 2) -eq 0 ];
		 then
			eval echo \$$par
		fi
			eval echo \$$impares;;
		D|d)    if [ $1 -eq $2 ]
			then
				echo "$1 y $2 son iguales"
				break	
			elif [ $1 -gt $2 ]
			then
				min=$2
				max=$1
			else
				min=$1
				max=$2
			fi
			for (( i=$min+1 ; i<$max; i++))
			do
				echo " $(($i*2))"
			done;;
		F|f) echo "Fin del programa"
			exit;;
		*) echo "opción incorrecta"
	esac
	done
fi
 
			
