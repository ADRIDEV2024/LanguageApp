#!/bin/bash

# 1. Instalación de dependencias
install_dependencies() {
    echo "Instalando dependencias..."
    npm install  # Para aplicaciones Node.js
    pip install -r requirements.txt  # Para aplicaciones Python
}

# 2. Configuración del entorno virtual (Python)
setup_venv() {
    echo "Configurando entorno virtual..."
    python3 -m venv venv
    source venv/bin/activate
    pip install -r requirements.txt
}

# 3. Iniciar el servidor de desarrollo
start_server() {
    echo "Iniciando servidor de desarrollo..."
    export FLASK_APP=app.py  # Para Flask
    flask run --host=0.0.0.0 --port=5000
}

# 4. Realizar pruebas automatizadas
run_tests() {
    echo "Ejecutando pruebas..."
    pytest tests/  # Para aplicaciones con pytest
}

# 5. Desplegar la aplicación en un servidor
deploy_app() {
    echo "Desplegando aplicación..."
    git pull origin main
    systemctl restart my_app.service  # Reemplazar con el servicio adecuado
}

# 6. Backup y restauración de la base de datos
backup_db() {
    echo "Realizando backup de la base de datos..."
    pg_dump -U usuario -d basededatos > backup.sql
}

restore_db() {
    echo "Restaurando base de datos..."
    psql -U usuario -d basededatos < backup.sql
}

# 7. Monitorización de logs en tiempo real
monitor_logs() {
    echo "Monitoreando logs..."
    tail -f /var/log/my_app.log  # Reemplazar con la ruta del log adecuado
}

# 8. Limpiar caché y archivos temporales
clean_cache() {
    echo "Limpiando caché y archivos temporales..."
    rm -rf __pycache__ */__pycache__
    rm -rf node_modules/.cache
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
    *) echo "Opción no válida" ;;
esac
