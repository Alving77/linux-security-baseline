#!/usr/bin/env bash
# Linux Security Baseline - auditoría informativa inicial
# Este script solo consulta información; no modifica el sistema.

set -u

line() {
  printf '%s\n' "--------------------------------------------------"
}

section() {
  line
  printf '%s\n' "$1"
  line
}

section "LINUX SECURITY BASELINE"
printf 'Fecha: %s\n' "$(date)"
printf 'Equipo: %s\n' "$(hostname 2>/dev/null || echo "No disponible")'
printf 'Usuario: %s\n' "$(id -un 2>/dev/null || echo "No disponible")"

section "1. IDENTIDAD Y PRIVILEGIOS"
id

section "2. SERVICIO SSH"
if command -v systemctl >/dev/null 2>&1; then
  if systemctl is-active --quiet ssh 2>/dev/null; then
    echo "SSH: activo"
  elif systemctl is-active --quiet sshd 2>/dev/null; then
    echo "SSHD: activo"
  else
    echo "SSH: no aparece activo o no se pudo consultar"
  fi
else
  echo "systemctl no está disponible"
fi

section "3. FIREWALL UFW"
if command -v ufw >/dev/null 2>&1; then
  ufw status 2>&1
else
  echo "UFW no está instalado. Puede existir otro firewall."
fi

section "4. PUERTOS TCP EN ESCUCHA"
if command -v ss >/dev/null 2>&1; then
  ss -lnt 2>&1
else
  echo "El comando ss no está disponible"
fi

section "5. PERMISOS DE CONFIGURACIÓN SSH"
SSH_CONFIG="/etc/ssh/sshd_config"
if [ -f "$SSH_CONFIG" ]; then
  stat -c 'Permisos: %a | Propietario: %U | Grupo: %G | Archivo: %n' "$SSH_CONFIG" 2>&1
else
  echo "No se encuentra $SSH_CONFIG"
fi

section "FIN DEL ANÁLISIS"
echo "Revisión informativa terminada. Comprueba manualmente los resultados."
