#!/bin/bash

echo -e "\e[35m
╭━━╮╭━━┳━╮╱╭╮
┃╭╮┃╰┫┣┫┃╰╮┃┃
┃╰╯╰╮┃┃┃╭╮╰╯┃
┃╭━╮┃┃┃┃┃╰╮┃┃
┃╰━╯┣┫┣┫┃╱┃┃┃
╰━━━┻━━┻╯╱╰━╯
╭━━━┳━━━┳━╮╱╭╮
┃╭━╮┃╭━━┫┃╰╮┃┃
┃┃╱╰┫╰━━┫╭╮╰╯┃
┃┃╭━┫╭━━┫┃╰╮┃┃
┃╰┻━┃╰━━┫┃╱┃┃┃
╰━━━┻━━━┻╯╱╰━╯\e[0m"

echo -e "\e[31mGENERADOR DE BINES GUS\e[0m"

# Función para generar contraseña segura
generate_password() {
    local length=12
    local chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()-+=_'
    local password=""
    
    for ((i=0; i<length; i++)); do
        password="${password}${chars:RANDOM%${#chars}:1}"
    done
    
    echo "$password"
}

# Crear directorio
mkdir -p /sdcard/contraseñas

# Solicitar cantidad
echo "Cuantas contraseñas quieres generar:"
read quantity

# Crear archivo
filename="/sdcard/contraseñas/passwords_$(date +%Y%m%d_%H%M%S).txt"

# Generar contraseñas
for ((i=1; i<=quantity; i++)); do
    password=$(generate_password)
    echo "$password" >> "$filename"
done

echo "Contraseñas generadas y guardadas en $filename"