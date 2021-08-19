def is_float(str_value):
    try:
        float(str_value)
    except ValueError:
        return False
    return True
