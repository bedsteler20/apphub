from os import system


def xdg_open(url: str):
    system(f'xdg-open "{url}" &> /dev/null &')
