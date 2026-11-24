# Linux Security Baseline

Herramienta inicial de auditoría básica para revisar algunos controles de seguridad en servidores Linux.

## Objetivo
Desarrollar una herramienta sencilla que recopile información de seguridad de un sistema Linux y muestre comprobaciones básicas que ayuden a identificar configuraciones que conviene revisar.

## Tecnologías
- Bash
- GNU/Linux
- Git y GitHub
- Comandos del sistema: `id`, `ss`, `systemctl`, `stat` y otros

## Alcance inicial
La primera versión realiza comprobaciones informativas sobre:
- Usuario con el que se ejecuta el análisis.
- Estado del servicio SSH, si está disponible.
- Estado del firewall mediante UFW, si está instalado.
- Puertos TCP en escucha.
- Permisos del archivo de configuración de SSH, si existe.

El script no modifica configuraciones ni aplica cambios al sistema. Los resultados deben interpretarse como una revisión inicial, no como una auditoría de seguridad completa.

## Estructura del proyecto
```text
linux-security-baseline/
├── README.md
├── scripts/
│   └── auditoria.sh
└── docs/
    └── alcance.md
```

## Requisitos
- Una distribución GNU/Linux.
- Bash.
- Permisos de lectura para consultar algunos datos del sistema.

## Ejecución
Desde la carpeta del proyecto:

```bash
chmod +x scripts/auditoria.sh
./scripts/auditoria.sh
```

Para obtener más información de algunos servicios, puede ser necesario ejecutar el script con permisos elevados:

```bash
sudo ./scripts/auditoria.sh
```

## Autor
[Tu nombre y apellidos]

## Estado
Versión inicial (v0.1). Proyecto en desarrollo.
