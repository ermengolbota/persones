# Persones
Exercici de DAW per desenvolupar una petita aplicació web LAMP clàssica, per a la gestió de "Persones".
Bàsicament s'han de crear CRUD's de php. 
El desenvolupament es fa utilitzant un entorn de dev aixecat amb docker compose (que aixeca una pila LAMP)

# Passos de l'exercici
1. Aixecar l'aplicació inicial (que ja està tota preparada)
    - Executar: `docker compose up`
    - Acccedir a http://localhost:8080 i veure un llistat "cutre" de 5 noms, que són les 5 persones que hi ha inicialment a l'aplicació. 
    - **PREGUNTA**: Qui / Com / Quan s'han creat aquestes 5 persones?
1. Modificar la portada (`index.html`) per tal de mostrar la llista de noms com una llista numerada
    - No cal apagar els contenidors, podem anar treballant amb aquest entorn
    - Afegir les capçaleres i peu html al fitxer `index.php` per tal de generar un html ben format
    - Modificar els echo i el bucle
        - Afegir l'obertura de la llista ABANS del bucle
        - A dins del bucle, generar cadascun dels `li`
    - **PREGUNTA:** La generació de les etiquetes `<ol>,</ol>` ha d'anar abans, dins o després del bucle?  
1. Preparar un formulari per afegir nous noms
    - Al final del llistat de la portada, afegir un enllaç `Afegir una persona` que apunti a un nou fitxer `afegir_persona.html`
    - Crear el fitxer `afegir_persona.html` que ha de ser un formulari ben fet amb un sol camp, `nom`.
    - Pots apuntar aquest formulari cap a https://daw.inspedralbes.cat/form/action.php, ja que aquesta action el que fa és enviar-ho cap a un php que només mostra els paràmetres rebuts. 
        - És a dir, el camp action del form que sigui: `action=https://daw.inspedralbes.cat/form/action.php`
    - **PREGUNTA:** El camp label i l'input com s'enllacen, i per què serveix enllaçar-los?
    - **PREGUNTA:** Quin paràmetre determina el nom de la clau que s'envia per cada input? id o name?
1. Un cop `afegir_persona.html` funcioni bé i enviï els camps correctes, creeu un `afegir_persona.php` que processi els paràmetres i els afegeix-hi a la BBDD
    - Canvieu l'action, que apuntava a form.php perquè apunti al vostre `afegir_persona.php`.
    - Podeu prendre com a referència: 
        - https://github.com/inspedralbes/form per la gestió dels paràmetres get i post
        - el fitxer index.php per la connexió a la BBDD
    - En aquesta primera versió, després d'inserir només feu un echo de "correcte" o "error: motiu"
    -  **PREGUNTA:**  Quan insereixes una nova persona, cal indicar el nou id? Sí, no, perquè.
1. Un cop funcioni bé la inserció heu de gestionar bé els missatges i els fluxos de navegació, en aquesta primera versió només cal fer:
    - Si tot ha anat bé, utilitzeu la capçalera  de php "location", `header("Location: index.php");` per reenviar l'usuari a la portada, on ja veurà el llistat actualitzat. 
        - Atenció!!! Aquesta instrucció, header, ha d'executar-se ABANS d'escriure cap caràcter html o fer cap echo.
    - Si hi ha hagut errors, es fa un echo amb la informació i ja està (o si ho voleu, hi afegiu un echo amb un enllaç a la portada)
1. Comprovar-ho tot bé, per exemple, amb un cas extrem per baix i un per dalt.
    - Camp del formulari buit
    - Un nom que ja existeixi
    - Un nom extremadament llarg
1. Un cop funcioni tot i estigui ben validat, anem a reorganitzar el codi. Ajuntarem el fitxer afegir_persona.html i afegir_persona.php en un sol fitxer, `afegir_persona.php`
    - El php ha de saber si ha rebut paràmetres (i ha d'insertar a la BBDD) o si no n'ha rebut (i ha de mostrar el form)
    - També, si ha intentat inserir i no ha pogut, ha de tornar a mostrar el formulari, amb els camps plens (amb els valors de l'usuari) i el missatge d'error.
        - Típicament, el missatge d'error s'inserta en un `div clas="error"` que el CSS ja mostrarà correctament.
        -  Per tant, ja comença a ser hora de crear un fitxer "estils.css" amb tots els estils de l'aplicació per tenir una aparença més agradable.
1. Fins aquí tenim:
    - `index.php`: que mostra tots els elements de la BBDD
    - `afegir_persona.php`: que si no rep cap paràmetre mostra el formulari per afegir persona, i si rep paràmetres fa la inserció i reenvia a la portada o mostra el missatge d'error.
    - `estils.css`: Amb l'aparença mínima
1. També tenim les dades de connexió a _DOS_ llocs, i per tant, serà més complicat fer-ne el manteniment. Per tant, ara utilitzant la instrucció `include` de php posa tot el codi que fa referència a la connexió amb la BBDD en un fitxer `conexio.php`. Aquest fitxer serà utilitzat pels altres codis. 
1. Ara volem guardar, per cada persona, el seu any de naixement. Fes totes les modificacions necessàries per guardar `nom` i `any de naixement`. Caldrà modificar tots els fitxers:
    - dades.sql: La càrrega inicial ha d'incloure la columna any de naixement. _Haureu d'esborrar el contenidor del mysql perquè torni a fer la carrega inicial amb les noves dades. `docker ps -a` i després `docker rm primersCaractersDelIdDelContenidor`_
    - index.php: Ha de mostrar també l'any. Poseu l'any en un div diferent que el nom.
    - afegir_persona.php: Un nou camp al formulari i modificar l'ordre d'inserció.
    - **PREGUNTA:** Caldrà modificar també conexio.php i/o estils.css?.
1.  En el llistat de persones, volem mostrar l'edat i no l'any de naixement.
    - Modifiqueu `index.php` per que mostri l'edat i no l'any. 
        - Teniu la funció `Date("Y")` que us retorna l'any actual. 
        - El php ha de marcar amb una classe diferent els `li` de les persones que són menors d'edat `class="menor"`
        - Modifica el CSS per què els menors d'edat tingui un color de fons gris.
    - **PREGUNTA:** Si el servidor està a Nova York, i nosaltres a Barcelona, hi ha algun moment de l'any en que el càlcul de l'edat serà incorrecte?
        - Com es podria solucionar? (no ho implementarem)
1. Ara ja tenim una aplicació senzilla per a gestionar persones i saber si són majors d'edat o no. Però encara no hem fet un CRUD sencer. Podem CREATE i READ , però ens falta l'UPDATE i el DELETE.
Començarem amb el DELETE.
Des del llistat hi haurà un enllaç que farà l'esborrat. La forma de fer-lo serà que per cada persona, afegirem un href cap a esborrar.php i passarem com a paràmetre GET l'id de l'element a esborrar:
    - Sempre que es fa un esborrat és OBLIGATORI demanar confirmació. MAI esborrarem un element sense confirmar-ho.
    - L'enllaç de cada fila serà de l'estil `<a href="esborrar_persona.php?id=XXX">(esborrar)</a>` on XXX és l'id de la persona (i cal posar els camps necessàris per que un href validi l'HTML)
    - `esborrar_persona.php` rep com a paràmetre GET l'id de la persona, i el que farà és mostrar les dades de la persona, i oferir un enllaç per esborrar-la realment. Podem fer que l'enllaç sigui `<a href="esborrar_persona.php?id=XXX&confirmat=1">(esborrar)</a>`. Per tant, el php si només rep id -->Mostra, si rep id i confirmat és cert --> Esborra
1. Ara permetrem l'edició d'una persona, amb la mateixa idea: fitxer `editar_persona.php` que rep l'id com a paràmetre. En aquests cas, mostra les dades de la persona en els camps d'un formulari (com afegir_persona.php) i a més a més té un camp ocult "id" per tal de saber quina persona s'està editant. L'action del formulari és ell mateix i en funció de si la resta de camps (nom i any) estan plens decideix actualitzar la persona o simplement mostrar-la.
    - En el fitxer `index.php` cada `li` és un enllaç cap a `editar_persona.php?id=XXX`.
    - Un cop fet l'UPDATE pots decidir si tornes a la pantalla d'edició o a l'index, el què preferiu.
- **PREGUNTA:** Es podria unificar el php d'inserció i amb d'edició? és a dir, que afegir_persona.php també servís per editar (i no calgués editar_persona.php)


# FELICITATS
Ja has fet la teva primera aplicació CRUD en php!!!
## Seguretat
És segura la teva aplicació?
Podries evitar l'acudit de _Bobby tables_ de [xkcd](https://xkcd.com/)?
![XKCD Bobby Tables](https://bobby-tables.com/img/xkcd.png)
* Prova d'atacar la teva aplicació inserint un nom d'usuari que "trenqui" l'aplicació.
* Tens més informació a https://bobby-tables.com/


## Opcions de millora
1. Unificar afegir i editar persona
1. Afegir seguretat a la injecció SQL fent servir "prepared statement" i no SQL "a pel".
1. Calcular l'edat en el navegador utilitzant Javascript, d'aquesta forma el càlcul serà sempre en la zona horària de l'usuari, i no en la zona horària del servidor.
1. Guardar la data de naixement, i no només l'any
1. Incloure tests unitaris i/o test E2E


    





        