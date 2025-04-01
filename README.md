# RVVI - Versioning Vi and Restore Vi

RVVI provides two scripts, `vvi` and `rvi`, to manage file versions with backups while editing in `vi`.

## Features
- **`vvi`**: Wraps `vi` to back up files before editing.
  - Default: Empties the file after backup.
  - `-e`: Keeps original contents.
- **`rvi`**: Restores backups and opens them in `vi`.
  - `--list`: Lists all backups.
  - `<filename>`: Lists or restores backups.
  - `<filename> <version>`: Restores a specific version.

## Installation
1. Clone the repository:
   ```bash
   git clone <repo-url>
   cd rvvi
   ```
2. Run the install script:
   ```bash
   sudo ./install.sh
   ```
   - Installs `vvi` and `rvi` to `/usr/local/bin/`.
   - Creates `/var/rvvi_backup` (default backup directory).
   - Installs `/etc/default/rvvi` for configuration.

## Configuration
Edit `/etc/default/rvvi` to override defaults:
```bash
# Example: Change backup directory
BACKUP_DIR="/custom/backup/path"
```

## Usage
- **Edit with backup**:
  ```bash
  vvi /path/to/file        # Backup and empty file
  vvi -e /path/to/file     # Backup and keep contents
  ```
- **Restore a backup**:
  ```bash
  rvi --list               # List all backups
  rvi /path/to/file        # Restore (single backup) or list versions
  rvi /path/to/file 20250401_123456  # Restore specific version
  ```

## Backup Format
Backups are stored in `/var/rvvi_backup` (or configured directory) as:
- `_path_to_file_TIMESTAMP` (e.g., `_usr_bin_gk_20250401_123456`)

## Help
Run `vvi --help` or `rvi --help` for usage details.

## License
MIT License (or your preferred license).
