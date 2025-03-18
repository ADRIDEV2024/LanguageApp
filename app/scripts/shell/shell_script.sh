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

# 14. Sincronización con servidor remoto
sync_remote() {
    echo "Sincronizando con servidor remoto..."
    rsync -avz --progress ./ usuario@servidor:/ruta/destino
}
