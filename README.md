Aquí tienes un README completo y profesional para tu repositorio:

---

# multi-hping3

Script de Bash para lanzar múltiples instancias paralelas de `hping3` contra un objetivo, útil para **pruebas de estrés de red en entornos controlados y autorizados**.

> ⚠️ **AVISO LEGAL**: Este script está diseñado exclusivamente para pruebas en redes propias o con permiso explícito del propietario. El uso no autorizado contra sistemas ajenos es ilegal en la mayoría de jurisdicciones. El autor no se responsabiliza del uso indebido.

---

## ¿Para qué sirve?

`multi-hping3` automatiza el lanzamiento de N instancias simultáneas de `hping3` en modo flood SYN contra una IP objetivo durante un tiempo determinado. Permite simular carga de red elevada para:

- Testear la resiliencia de firewalls y sistemas IDS/IPS propios.
- Evaluar el comportamiento de un servidor bajo condiciones de saturación.
- Practicar en entornos de laboratorio de ciberseguridad.

---

## Uso

```bash
sudo bash multi-hping3.sh <IP> <Número de ataques> <Duración en segundos>
```

**Ejemplo:**
```bash
sudo bash multi-hping3.sh 192.168.1.100 4 30
```
Lanza 4 instancias de flood SYN contra `192.168.1.100` durante 30 segundos.

**Ayuda:**
```bash
bash multi-hping3.sh -h
```

---

## ¿Cómo funciona?

1. Valida los argumentos de entrada.
2. Lanza en bucle `N` procesos de `hping3` en segundo plano, cada uno enviando paquetes SYN de 200 bytes en modo flood (`--flood`).
3. Espera el tiempo especificado.
4. Mata todos los procesos `hping3` activos con `killall`.

---

## Dependencias

| Herramienta | Descripción |
|-------------|-------------|
| `bash`      | Intérprete de shell (≥ 4.x) |
| `hping3`    | Generador de paquetes TCP/IP |
| `sudo`      | Necesario para enviar paquetes raw |

### Instalación de dependencias

**Debian / Ubuntu (APT):**
```bash
sudo apt update && sudo apt install -y hping3
```

**Fedora / RHEL / CentOS (DNF):**
```bash
sudo dnf install -y hping3
```
> En RHEL/CentOS puede requerirse habilitar el repositorio EPEL primero:
> ```bash
> sudo dnf install -y epel-release
> ```

**Arch Linux / Manjaro (Pacman):**
```bash
sudo pacman -S hping
```

---

## Requisitos

- Sistema operativo Linux.
- Ejecutar como `root` o con `sudo` (requerido por `hping3` para operar con sockets raw).

---

## Licencia

MIT — úsalo bajo tu propia responsabilidad y siempre dentro del marco legal.

---

Puedes copiar esto directamente como `README.md` en la raíz de tu repositorio. Si quieres también puedo generarte el archivo para descargarlo directamente.
