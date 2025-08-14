
#Del alumno Jasiel Linares Carrada en colaboracion con mi compañero Mario Rodrigo Martinez Angeles 

entrada = input("Ingrese la o las listas de caracteres que necesite clasificar: ")

simbolos_especiales = {'@', '#', '$', '%', '&'}

lista_cadenas = entrada.split()

for cadena in lista_cadenas:
    tiene_numeros = False
    tiene_letras = False
    tiene_simbolos = False
    
    for caracter in cadena:
        if '0' <= caracter <= '9':
            tiene_numeros = True
        elif ('a' <= caracter <= 'z') or ('A' <= caracter <= 'Z'):
            tiene_letras = True
        elif caracter in simbolos_especiales:
            tiene_simbolos = True
            
    if tiene_simbolos:
        clasificacion = "Compuesta"
    elif tiene_numeros and not tiene_letras:
        clasificacion = "Numero"
    elif tiene_letras and not tiene_numeros:
        clasificacion = "Palabra"
    else:
        clasificacion = "Compuesta"
    
    print(f"{cadena}: {clasificacion}")
    