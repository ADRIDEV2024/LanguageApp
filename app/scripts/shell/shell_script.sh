analyze_performance() {
    echo "Analizando rendimiento con top y htop..."
    top -n 1 | head -20
    echo "Procesos más pesados:"
    ps aux --sort=-%mem | head -10
}

# 13. Reiniciar aplicación en caso de fallo
auto_restart() {
    echo "Activando reinicio automático en caso de fallo..."
    while true; do
        if ! pgrep -x "my_app" > /dev/null; then
            echo "La aplicación ha fallado, reiniciando..."
            systemctl restart my_app.service
        fi
        sleep 10
    done
}

changedir()
{
	DIR_NAME=$1
	# Check if the directory exist?
	[ -d "$DIR_NAME" ] || {
		echo Dir: $DIR_NAME does not exist 
		exit 1
	}

	# Check if the directory is readable
	[ -r "$DIR_NAME" ] || {
		echo Dir: $DIR_NAME not readable
		exit 2
	}

	# Check if we have execute perms on directory
	[ -x "$DIR_NAME" ] || {
		echo Dir: cannot cd to $DIR_NAME
		exit 3
	}

	# Check if the directory is writable
	[ -w "$DIR_NAME" ] || {
		echo Dir: $DIR_NAME not writeable
		exit 4
	}

	cd $DIR_NAME
	echo "Present directory $DIR_NAME"
}

changedir()
{
	DIR_NAME=$1
	# Check if the directory exist?
	[ -d "$DIR_NAME" ] || {
		echo Dir: $DIR_NAME does not exist 
		exit 1
	}

	# Check if the directory is readable
	[ -r "$DIR_NAME" ] || {
		echo Dir: $DIR_NAME not readable
		exit 2
	}

	# Check if we have execute perms on directory
	[ -x "$DIR_NAME" ] || {
		echo Dir: cannot cd to $DIR_NAME
		exit 3
	}

	# Check if the directory is writable
	[ -w "$DIR_NAME" ] || {
		echo Dir: $DIR_NAME not writeable
		exit 4
	}

	cd $DIR_NAME
	echo "Present directory $DIR_NAME"
}
# 14. Sincronización con servidor remoto
sync_remote() {
    echo "Sincronizando con servidor remoto..."
    rsync -avz --progress ./ usuario@servidor:/ruta/destino
}
