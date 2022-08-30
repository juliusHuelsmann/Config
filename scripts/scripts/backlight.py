import click
import os
from typing import *

default_path = '/sys/class/backlight/nvidia_wmi_ec_backlight'

@click.group()
def cli():
    pass

def read(path: str, file: str) -> int:
    with open(os.path.join(path, file), 'r') as f:
        return int(f.read())

def read_brightness(path: str) -> int:
    return read(path=path, file='brightness')

def read_max(path: str) -> int:
    return read(path=path, file='max_brightness')

@cli.command('write')
@click.option('--change', '-c', required=False, type=int, default=5)
@click.option('--path', '-p', required=False, type=str, default=default_path)
def c_write(change: int, path: str):
    value: int = int(read_brightness(path=path)) + change
    max_value: int = max(int(read_max(path)) + change, 1)
    value = min(max(value, 1), max_value)
    with open(os.path.join(path, 'brightness'), 'w') as f:
        f.write(str(value))
    print(value)


@cli.command('read')
@click.option('--path', '-f', required=False, type=str, default=default_path)
def c_read(path: str) -> None:
    print(read_brightness(path=path))

if __name__ == '__main__':
    cli()
