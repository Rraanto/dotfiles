#!/usr/bin/env python3
"""Install the exported files, backing up replacements inside the destination."""

import argparse
from datetime import datetime
import hashlib
import json
from pathlib import Path
import re
import shutil


def install(repository, destination, dry_run=False):
    destination = destination.expanduser().absolute()
    # Paths appear in shell, i3, Rasi and Python source, with different quoting rules.
    for path in (destination, Path.home()):
        if not re.fullmatch(r'/[A-Za-z0-9_./-]+', str(path)):
            raise ValueError('Home and config paths must use letters, digits, /, _, . or -.')
    manifest = json.loads((repository / 'manifest.json').read_text())
    files = []
    for name, digest in manifest.items():
        relative = Path(name)
        if relative.parts[0] != '.config' or '..' in relative.parts:
            raise ValueError(f'Invalid manifest path: {name}')
        source = repository / relative
        if hashlib.sha256(source.read_bytes()).hexdigest() != digest:
            raise ValueError(f'Export modified since manifest generation: {name}')
        relative = relative.relative_to('.config')
        target = destination / relative
        if target.is_symlink() or not target.resolve().is_relative_to(destination.resolve()):
            raise ValueError(f'Refusing to write through symlink: {target}')
        if target.exists() and not target.is_file():
            raise ValueError(f'Destination is not a file: {target}')
        content = source.read_bytes()
        if relative.parts[0] not in ('dotfiles-export', 'export-dotfiles.py'):
            content = content.replace(b'@CONFIG_DIR@', str(destination).encode())
            content = content.replace(b'@HOME@', str(Path.home()).encode())
        files.append((source, target, relative, content))
    backup = destination / '.dotfiles-backups' / datetime.now().strftime('%Y%m%d-%H%M%S-%f')
    if not backup.resolve().is_relative_to(destination.resolve()):
        raise ValueError('Backup directory points outside the destination.')
    for source, target, relative, content in files:
        if dry_run:
            print(target)
            continue
        target.parent.mkdir(parents=True, exist_ok=True)
        if target.exists():
            saved = backup / relative
            saved.parent.mkdir(parents=True, exist_ok=True)
            shutil.copy2(target, saved)
        target.write_bytes(content)
        target.chmod(source.stat().st_mode & 0o777)
    print(f'{"Would install" if dry_run else "Installed"} {len(files)} files in {destination}')
    if not dry_run and backup.exists():
        print(f'Previous files saved in {backup}')


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('destination', type=Path)
    parser.add_argument('--dry-run', action='store_true')
    args = parser.parse_args()
    try:
        install(Path(__file__).resolve().parent, args.destination, args.dry_run)
    except (OSError, ValueError) as error:
        parser.exit(1, f'Install failed: {error}\n')
