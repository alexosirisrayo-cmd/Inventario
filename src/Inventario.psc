//Proyecto de creación de código de gestión de inventario.

//Funcion "Mostrar resumen de inventario", se creo para ser llamada donde se necesite en el algoritmo. 
SubProceso MostrarResumenMaterial(i,descripcionMaterial,cantidadMaterial,unidadMaterial,valorUnitario)
	Escribir "Listado de materiales registrados: ";
	Escribir "----------------------------------";
	Escribir "Descripción | Cantidad | Unidad | Valor Unitario | Valor total";
	Escribir i, descripcionMaterial[i],"    |   ", cantidadMaterial[i],"      |       ",unidadMaterial[i],"    |       ",valorUnitario[i],"        |       ",valorUnitario[i] *cantidadMaterial[i];
FinSubProceso


Algoritmo Inventario
	
	
	//Coleccion de vectores (materiales de inventario)
	Dimension descripcionMaterial[100];
	Dimension cantidadMaterial[100];
	Dimension unidadMaterial[100];
	Dimension valorUnitario[100];
	
	
	

	//Variable para capturar opcion del menú.
	Definir varOpcion Como Cadena;
	
	//Variable para realizar contador.
	Definir totalMateriales Como Entero;
	totalMateriales<-0;
	
	
	
	//Funcion mostrar resumen de material

	Definir descripcionMaterialVarDos Como Cadena;
	Definir existe Como Logico;
	Definir repuesta Como Cadena;
	Definir i Como Entero;
	Definir tipoMovimiento Como Cadena;
	Definir cantidadModificacion Como Entero;
	Repetir
		//Motrar opciones de menu principal.	
		Escribir "===INVENTARIO=====";
		Escribir"Seleccionar opciones";
		Escribir"1 Ver inventario completo";
		Escribir "2 Buscar material";
		Escribir "3 Agregar nuevo material";
		Escribir "4 Modificar Cantidad";
		Escribir "5 Salir";
		Leer varOpcion;
		
		
		Si varOpcion ="1" Entonces
			Si totalMateriales = 0 Entonces
				Escribir "El inventario esta vacio";
			SiNo
				Escribir "El inventario esta completo";
				Para i = 1 Hasta totalMateriales Con Paso 1 Hacer
					MostrarResumenMaterial(i,descripcionMaterial,cantidadMaterial,unidadMaterial,valorUnitario)
				FinPara
					
			FinSi
			Escribir "Presione una tecla para volver al menú principal...";
			Esperar Tecla;
		FinSi
		
		Si varOpcion ="2" Entonces
			existe <-falso;
			Escribir "Busqueda de material en inventario";
			Escribir "Ingrese la descripcion de material a buscar";
			Leer descripcionMaterialVarDos;
			
			Para i = 1 Hasta totalMateriales Con Paso 1 Hacer
				Si descripcionMaterial[i] = descripcionMaterialVarDos Entonces
					existe <-Verdadero;
					Escribir "Material encontrado";
					MostrarResumenMaterial(i,descripcionMaterial,cantidadMaterial,unidadMaterial,valorUnitario)
				FinSi
				
			FinPara
			Si No existe Entonces
				Escribir " El material no se encuentra en el inventario";
				Escribir "Desea agregarlo (si/no)";
				Leer repuesta;
				
				Si repuesta = "si" Entonces
					totalMateriales<-totalMateriales+1;
					
					Escribir "Ingrese descripción de material";
					Leer descripcionMaterial[totalMateriales];
					
					Repetir
						Escribir "Ingrese cantidad (mayor a 0): ";
						Leer cantidadMaterial[totalMateriales];
						Si cantidadMaterial[totalMateriales] <= 0 Entonces
							Escribir "La cantidad deber ser mayor a 0. ";
						FinSi
					Hasta Que cantidadMaterial[totalMateriales] > 0 
					
					Escribir "Ingrese unidad: ";
					Leer unidadMaterial[totalMateriales];
					//Validad que las unidades sean mayor a cero.
					
					Repetir
						Escribir "Ingrese valor unitario (mayor a 0): ";
						Leer valorUnitario[totalMateriales];
						Si valorUnitario[totalMateriales] <= 0 Entonces
							Escribir "El valor unitario debe ser mayor a 0. ";
						FinSi
					Hasta Que valorUnitario[totalMateriales] > 0
					
					Escribir "Material agregado correctamente";
					MostrarResumenMaterial(totalMateriales,descripcionMaterial,cantidadMaterial,unidadMaterial,valorUnitario)	
				FinSi
			SiNo
				Escribir "No se ha agregado ningún material"; 
				
				
			FinSi
			Escribir "Presione una tecla para volver al menú principal...";
			Esperar Tecla;
			
		FinSi
		
		//Funcion 3 - Buscar material en inventario.ç
		
		Si varOpcion = "3" Entonces	
			Escribir "Busqueda de material en inventario";
			
			Escribir "Ingrese descripción del material a buscar: ";
			Leer descripcionMaterialVarDos;
			
			//Buscar si existe material.
			Para i= 1 Hasta totalMateriales Con Paso 1 Hacer
				Si descripcionMaterial[i] = descripcionMaterialVarDos Entonces //Comprobamos nombre de inventario con nombre ingresado.
					existe<-verdadero;
					MostrarResumenMaterial(i,descripcionMaterial,cantidadMaterial,unidadMaterial,valorUnitario)
				FinSi	
			FinPara
			//si no existe agregar nuevo material.
			Si No existe Entonces
				Escribir "El material no existe en el inventario."; 
				Escribir "Desea agregarlo (si/no)";
				Leer repuesta;
				
				Si repuesta = "si" Entonces
					totalMateriales<-totalMateriales+1;
					
					Escribir "Ingrese descripción de material";
					Leer descripcionMaterial[totalMateriales];
					
					Repetir
						Escribir "Ingrese cantidad (mayor a 0): ";
						Leer cantidadMaterial[totalMateriales];
						Si cantidadMaterial[totalMateriales] <= 0 Entonces
							Escribir "La cantidad debe ser mayor a 0. ";
						FinSi
					Hasta Que cantidadMaterial[totalMateriales] > 0 
					
					Escribir "Ingrese unidad: ";
					Leer unidadMaterial[totalMateriales];
					//Validar que las unidades sean mayor a cero.
					
					Repetir
						Escribir "Ingrese valor unitario (mayor a 0): ";
						Leer valorUnitario[totalMateriales];
						Si valorUnitario[totalMateriales] <= 0 Entonces
							Escribir "El valor unitario debe ser mayor a 0. ";
						FinSi
					Hasta Que valorUnitario[totalMateriales] > 0
					
					Escribir "Material agregado correctamente";
					MostrarResumenMaterial(totalMateriales,descripcionMaterial,cantidadMaterial,unidadMaterial,valorUnitario)	
				FinSi
			SiNo
				Escribir "No se ha agregado ningún material"; 
				
				
			FinSi
			
			Escribir "Presione una tecla para volver al menú principal...";
			Esperar Tecla;
		FinSi
		
		Si varOpcion ="4" Entonces
			existe<-falso;
			Escribir"Busqueda de material en inventario"; 
			Escribir "Ingrese la descripcion del material a buscar"; 
			Leer descripcionMaterialVarDos;
			
			Para i = 1 Hasta totalMateriales Con Paso 1 Hacer
				Si descripcionMaterial[i] = descripcionMaterialVarDos Entonces
					existe<-Verdadero;
					Escribir "Material encontrado";
					MostrarResumenMaterial(i,descripcionMaterial,cantidadMaterial,unidadMaterial,valorUnitario)
					
					Escribir "Es un ingreso o una salida (i/s)";
					Leer tipoMovimiento;
					
					Escribir "Ingrese la cantidad a modificar";
					Leer cantidadModificacion;
					
					Si tipoMovimiento = "i" Entonces
						cantidadMaterial[i] <-cantidadMaterial[i]+cantidadModificacion;
						Escribir "Ingreso realizado.";
					SiNo
						Si cantidadMaterial[i]>=cantidadModificacion Entonces
							cantidadMaterial[i] <- cantidadMaterial[i]-cantidadModificacion;
							Escribir"Salida realizada.";
						SiNo
							Escribir "No se puede realizar la salida. Cantidad insuficiente";
							
							
						FinSi
						MostrarResumenMaterial(i,descripcionMaterial,cantidadMaterial,unidadMaterial,valorUnitario)
					FinSi
					
					
					
					Escribir "Presione una tecla para volver al menú principal...";
					Esperar Tecla;
					
					
				FinSi
			FinPara
			
			//si no existe agregar nuevo material.
			Si No existe Entonces
				Escribir "El material no existe en el inventario."; 
				Escribir "¿Desea agregarlo (si/no)?";
				Leer repuesta;
				
				Si repuesta = "si" Entonces
					totalMateriales<-totalMateriales+1;
					
					Escribir "Ingrese descripción de material";
					Leer descripcionMaterial[totalMateriales];
					
					Repetir
						Escribir "Ingrese cantidad (mayor a 0): ";
						Leer cantidadMaterial[totalMateriales];
						Si cantidadMaterial[totalMateriales] <= 0 Entonces
							Escribir "La cantidad deber ser mayor a 0. ";
						FinSi
					Hasta Que cantidadMaterial[totalMateriales] > 0 
					
					Escribir "Ingrese unidad: ";
					Leer unidadMaterial[totalMateriales];
					//Validad que las unidades sean mayor a cero.
					
					Repetir
						Escribir "Ingrese valor unitario (mayor a 0): ";
						Leer valorUnitario[totalMateriales];
						Si valorUnitario[totalMateriales] <= 0 Entonces
							Escribir "El valor unitario debe ser mayor a 0. ";
						FinSi
					Hasta Que valorUnitario[totalMateriales] > 0
					
					Escribir "Material agregado correctamente";
					MostrarResumenMaterial(totalMateriales,descripcionMaterial,cantidadMaterial,unidadMaterial,valorUnitario)	
				FinSi
			SiNo
				Escribir "No se ha agregado ningún material"; 
				
				
			FinSi
			
			
		FinSi
		
		
		
	Hasta Que varOpcion = "5";
	


FinAlgoritmo





