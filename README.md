# lootXploits
Bash script to search for and loot exploits of detected open services.

![banner-miniatura-lootxploits-2](https://user-images.githubusercontent.com/99199970/202931730-271d499c-fa9f-4a76-a9fe-88245388131b.png)

# Requisitos previos
Para correr el script correctamente se debe tener instalado:
- NMAP
- Searchsploit

# ¿Cómo ejecuto la herramienta?
Para empezar, al ejecutar la herramienta veremos lo siguiente:

![image](https://user-images.githubusercontent.com/99199970/202933256-f395a58b-106a-4845-b2d7-bd29751f9e42.png)

Options
[-h] Show this help panel

[-v] Show version

[-g] Pass IP or domain as argument; performs search for exploits for general version of services.

[-e] Pass IP or domain as argument; performs search for exploits for especific version of services. 
     Warning: if you don't get a result, try -t only 

La herramienta cuenta con dos modos principales:
- general: Se pasa como argumento la IP o dominio del objetivo y se realiza una búsqueda de exploits para los servicios detectados en su versión general y nombre.

![image](https://user-images.githubusercontent.com/99199970/202933589-2f8b6496-82af-4962-9a8f-96b1ec4f1632.png)

![image](https://user-images.githubusercontent.com/99199970/202933623-aef29d96-781e-4d58-b9e2-4bd32e779451.png)

![image](https://user-images.githubusercontent.com/99199970/202933689-cb6e62e1-e34c-4030-8845-5ef8092c41ab.png)


- especific: Se pasa como argumento la IP o dominio del objetivo y se realiza una búsqueda de exploits para los servicios detectados en su versión específica, teniendo en cuenta nombre específico de servicio y número de versión.

![image](https://user-images.githubusercontent.com/99199970/202933792-95b6c63f-a653-4221-b312-1149089df3d8.png)

![image](https://user-images.githubusercontent.com/99199970/202933822-57c35d71-a7b0-4442-aa6e-e612a61dcd75.png)

![image](https://user-images.githubusercontent.com/99199970/202933838-53c280bc-459f-4ac3-a1f1-2713a3bc9c90.png)

