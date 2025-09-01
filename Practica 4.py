
# Práctica 1. Análisis de Expresiones Regulares
# Jasiel Linares Carrada

import re

def analizar_con_estructuras_datos():
    """Análisis usando estructuras de datos y algoritmos"""
    print("=== ANÁLISIS CON ESTRUCTURAS DE DATOS ===")
    
    simbolos_especiales = {'@', '#', '$', '%', '&', '_'}
    entrada = input("Ingrese las cadenas a clasificar: ")
    lista_cadenas = entrada.split()
    
    resultados = {
        'Entero': 0,
        'Minusculas': 0,
        'Mayusculas': 0,
        'Identificador': 0,
        'Simbolo': 0,
        'Compuesta': 0
    }
    
    for cadena in lista_cadenas:
        tiene_numeros = False
        tiene_letras_min = False
        tiene_letras_may = False
        tiene_simbolos = False
        tiene_guion_bajo = False
        
        for caracter in cadena:
            if '0' <= caracter <= '9':
                tiene_numeros = True
            elif 'a' <= caracter <= 'z':
                tiene_letras_min = True
            elif 'A' <= caracter <= 'Z':
                tiene_letras_may = True
            elif caracter == '_':
                tiene_guion_bajo = True
            elif caracter in simbolos_especiales:
                tiene_simbolos = True
        
        # Clasificación
        if tiene_simbolos:
            clasificacion = "Simbolo" if len(cadena) == 1 and cadena in simbolos_especiales else "Compuesta"
        elif tiene_numeros and not tiene_letras_min and not tiene_letras_may and not tiene_guion_bajo:
            clasificacion = "Entero"
        elif tiene_letras_min and not tiene_numeros and not tiene_letras_may and not tiene_simbolos and not tiene_guion_bajo:
            clasificacion = "Minusculas"
        elif tiene_letras_may and not tiene_numeros and not tiene_letras_min and not tiene_simbolos and not tiene_guion_bajo:
            clasificacion = "Mayusculas"
        elif (tiene_letras_min or tiene_letras_may or tiene_guion_bajo) and not tiene_simbolos:
            clasificacion = "Identificador"
        else:
            clasificacion = "Compuesta"
        
        resultados[clasificacion] += 1
        print(f"{cadena}: {clasificacion}")
    
    print("\n--- RESULTADOS ---")
    for categoria, cantidad in resultados.items():
        print(f"{categoria}: {cantidad}")

def analizar_con_expresiones_regulares():
    """Análisis usando expresiones regulares"""
    print("\n=== ANÁLISIS CON EXPRESIONES REGULARES ===")
    
    # Expresiones regulares definidas
    patrones = {
        'Entero': r'^\d+$',
        'Minusculas': r'^[a-z]+$',
        'Mayusculas': r'^[A-Z]+$',
        'Identificador': r'^[a-z A-Z_][a-z A-Z 0-9_]*$',
        'Simbolo': r'^[@#$%&]$',
        'Compuesta': r'.*'  
    }
    
    entrada = input("Ingrese las cadenas a clasificar: ")
    lista_cadenas = entrada.split()
    
    resultados = {categoria: 0 for categoria in patrones.keys()}
    
    for cadena in lista_cadenas:
        clasificada = False
        for categoria, patron in patrones.items():
            if re.match(patron, cadena):
                resultados[categoria] += 1
                print(f"{cadena}: {categoria}")
                clasificada = True
                break
        
        if not clasificada:
            resultados['Compuesta'] += 1
            print(f"{cadena}: Compuesta")
    
    print("\n--- RESULTADOS ---")
    for categoria, cantidad in resultados.items():
        print(f"{categoria}: {cantidad}")

def main():
    """Función principal"""
    print("PRÁCTICA 1: ANÁLISIS DE EXPRESIONES REGULARES")
    
    while True:
        print("\nSeleccione el método de análisis:")
        print("1. Estructuras de datos")
        print("2. Expresiones regulares")
        print("3. Salir")
        
        opcion = input("Opción: ")
        
        if opcion == '1':
            analizar_con_estructuras_datos()
        elif opcion == '2':
            analizar_con_expresiones_regulares()
        elif opcion == '3':
            print("¡Hasta luego!")
            break
        else:
            print("Opción no válida. Intente de nuevo.")

if __name__ == "__main__":
    main()