# lootXploits
Bash script to search for and loot exploits of detected open services.

![banner-miniatura-lootxploits-2](https://user-images.githubusercontent.com/99199970/202931730-271d499c-fa9f-4a76-a9fe-88245388131b.png)

# Previous requirements
To run the script correctly you must have installed:
- NMAP
- Searchsploit

# How do I run the tool?
To begin with, when executing the tool we will see the following:

![image](https://user-images.githubusercontent.com/99199970/203101580-2b1461d8-9044-457a-bdf6-01a2c91379e1.png)

Options
[-h] Show this help panel

[-v] Show version

[-g] Pass IP or domain as argument; performs search for exploits for general version of services.

[-e] Pass IP or domain as argument; performs search for exploits for especific version of services. 
     Warning: if you don't get a result, try -g only 

The tool has two main modes:
- general: The IP or domain of the target is passed as an argument and a search for exploits is performed for the services detected in their general version and name. E.g. ftp service

![image](https://user-images.githubusercontent.com/99199970/202933589-2f8b6496-82af-4962-9a8f-96b1ec4f1632.png)

![image](https://user-images.githubusercontent.com/99199970/202933623-aef29d96-781e-4d58-b9e2-4bd32e779451.png)

![image](https://user-images.githubusercontent.com/99199970/202933689-cb6e62e1-e34c-4030-8845-5ef8092c41ab.png)


- specific: The IP or domain of the target is passed as an argument and a search for exploits is performed for the services detected in their specific version, taking into account the specific service name and version number. E.g. ftp vftpd 2.3.4

![image](https://user-images.githubusercontent.com/99199970/202933792-95b6c63f-a653-4221-b312-1149089df3d8.png)

![image](https://user-images.githubusercontent.com/99199970/202933822-57c35d71-a7b0-4442-aa6e-e612a61dcd75.png)

![image](https://user-images.githubusercontent.com/99199970/202933838-53c280bc-459f-4ac3-a1f1-2713a3bc9c90.png)

