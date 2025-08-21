
# Del alumno Jasiel Linares Carrada en colaboracion con mi compañero Mario Rodrigo Martinez Angeles 

entrada = input("Ingrese la o las listas de caracteres que necesite clasificar: ")

simbolos_especiales = {'@', '#', '$', '%', '&'}

lista_cadenas = entrada.split()

contador_numeros = 0
contador_palabras = 0
contador_compuestas = 0

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
        contador_compuestas += 1
    elif tiene_numeros and not tiene_letras:
        clasificacion = "Numero"
        contador_numeros += 1
    elif tiene_letras and not tiene_numeros:
        clasificacion = "Palabra"
        contador_palabras += 1
    else:
        clasificacion = "Compuesta"
        contador_compuestas += 1
    
    print(f"{cadena}: {clasificacion}")

def mostrar_resumen(numeros, palabras, compuestas):
    resultados = []
    if numeros > 0:
        resultados.append(f"{numeros} - entero")
    if palabras > 0:
        resultados.append(f"{palabras} - palabra")
    if compuestas > 0:
        resultados.append(f"{compuestas} - compuesta")
    
    print(", ".join(resultados))  

mostrar_resumen(contador_numeros, contador_palabras, contador_compuestas)
    