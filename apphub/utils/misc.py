from os import system


def xdg_open(url: str):
    system(f'xdg-open "{url}" &> /dev/null &')


def read_desktop_file(val):
    data = {}
    ctx_capt_header = False
    ctx_current_header = None
    ctx_current_key = None
    buffer = ""

    for char in val:
        if char == "[" and not ctx_capt_header:
            ctx_capt_header = True
            continue

        if char == "]" and ctx_capt_header:
            data[buffer] = {}
            ctx_current_header = buffer
            ctx_capt_header = False
            buffer = ""
            continue

        if ctx_current_header is not None:
            if char == "\n":
                if ctx_current_key is not None:
                    data[ctx_current_header][ctx_current_key] = buffer
                ctx_current_key = ""
                buffer = ""
                continue
            if char == "=":
                ctx_current_key = buffer
                buffer = ""
                continue

        buffer += char
    return data
