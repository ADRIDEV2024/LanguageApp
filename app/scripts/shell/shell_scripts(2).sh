# 9. Crear y restaurar snapshots del código
create_snapshot() {
    echo "Creando snapshot del código..."
    tar -czvf snapshot_$(date +%F_%T).tar.gz .
}

restore_snapshot() {
    echo "Restaurando snapshot..."
    read -p "Ingrese el nombre del snapshot a restaurar: " snapshot_file
    tar -xzvf "$snapshot_file"
}

# 10. Comprobar el estado del servidor
check_server() {
    echo "Comprobando estado del servidor..."
    systemctl status my_app.service
}

# 11. Optimizar base de datos
optimize_db() {
    echo "Optimizando base de datos..."
    psql -U usuario -d basededatos -c "VACUUM FULL;"
}

# Mostrar opciones
echo "Seleccione una opción:"
echo "1) Instalar dependencias"
echo "2) Configurar entorno virtual"
echo "3) Iniciar servidor de desarrollo"
echo "4) Ejecutar pruebas"
echo "5) Desplegar aplicación"
echo "6) Backup de la base de datos"
echo "7) Restaurar base de datos"
echo "8) Monitorear logs"
echo "9) Limpiar caché"
echo "10) Crear snapshot del código"
echo "11) Restaurar snapshot"
echo "12) Comprobar estado del servidor"
echo "13) Optimizar base de datos"
read -p "Opción: " option

case $option in
    1) install_dependencies ;;
    2) setup_venv ;;
    3) start_server ;;
    4) run_tests ;;
    5) deploy_app ;;
    6) backup_db ;;
    7) restore_db ;;
    8) monitor_logs ;;
    9) clean_cache ;;
    10) create_snapshot ;;
    11) restore_snapshot ;;
    12) check_server ;;
    13) optimize_db ;;
    *) echo "Opción no válida" ;;
esac
