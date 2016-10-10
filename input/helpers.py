def isreal(txt):
    try:
        float(txt)
        return True
    except ValueError:
        return False
