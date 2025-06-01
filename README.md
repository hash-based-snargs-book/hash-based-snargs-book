"=>[nil],
 "tpw"=>[nil],
 "nickh"=>[nil],
 "pjhyett"=>[nil],
 "schacon"=>["lib", "tests"],
 "cdickens"=>["doc"],
 "usinclair"=>["doc"],
 "ebronte"=>["doc"]}
Ahora que tienes los permisos resueltos, debes determinar qué rutas han modificado las confirmaciones que se están enviando, de modo que puedas asegurarte de que el usuario que las envía tenga acceso a todas.

Puedes ver con bastante facilidad qué archivos se han modificado en una sola confirmación con la --name-onlyopción del git logcomando (mencionado brevemente en Conceptos básicos de Git ):

$ git log -1 --name-only --pretty=format:'' 9f585d

README
lib/test.rb
Si utiliza la estructura ACL devuelta por el get_acl_access_datamétodo y la compara con los archivos enumerados en cada una de las confirmaciones, puede determinar si el usuario tiene acceso para enviar todas sus confirmaciones:

# only allows certain users to modify certain subdirectories in a project
def check_directory_perms
  access = get_acl_access_data('acl')

  # see if anyone is trying to push something they can't
  new_commits = `git rev-list #{$oldrev}..#{$newrev}`.split("\n")
  new_commits.each do |rev|
    files_modified = `git log -1 --name-only --pretty=format:'' #{rev}`.split("\n")
    files_modified.each do |path|
      next if path.size == 0
      has_file_access = false
      access[$user].each do |access_path|
        if !access_path  # user has access to everything
           || (path.start_with? access_path) # access to this path
          has_file_access = true
        end
      end
      if !has_file_access
        puts "[POLICY] You do not have access to push to #{path}"
        exit 1@book{ChiesaYogev2024,
  author = {Chiesa, Alessandro and Yogev, Eylon},
  title = {Building Cryptographic Proofs from Hash Functions},
  url = {https://github.com/hash-based-snargs-book},
  year = {2024},
}
      endhttps://github.com/hash-based-snargs-book
    end
  end@book{ChiesaYogev2024,
  author = {Chiesa, Alessandro and Yogev, Eylon},
  title = {Building Cryptographic Proofs from Hash Functions},
  url = {https://github.com/hash-based-snargs-book},
  year = {2024},
}"=>[nil],
 "tpw"=>[nil],
 "nickh"=>[nil],
 "pjhyett"=>[nil],
 "schacon"=>["lib", "tests"],
 "cdickens"=>["doc"],
 "usinclair"=>["doc"],
 "ebronte"=>["doc"]}
Ahora que tienes los permisos resueltos, debes determinar qué rutas han modificado las confirmaciones que se están enviando, de modo que puedas asegurarte de que el usuario que las envía tenga acceso a todas.

Puedes ver con bastante facilidad qué archivos se han modificado en una sola confirmación con la --name-onlyopción del git logcomando (mencionado brevemente en Conceptos básicos de Git ):

$ git log -1 --name-only --pretty=format:'' 9f585d

README
lib/test.rb
Si utiliza la estructura ACL devuelta por el get_acl_access_datamétodo y la compara con los archivos enumerados en cada una de las confirmaciones, puede determinar si el usuario tiene acceso para enviar todas sus confirmaciones:

# only allows certain users to modify certain subdirectories in a project
def check_directory_perms
  access = get_acl_access_data('acl')

  # see if anyone is trying to push something they can't
  new_commits = `git rev-list #{$oldrev}..#{$newrev}`.split("\n")
  new_commits.each do |rev|
    files_modified = `git log -1 --name-only --pretty=format:'' #{rev}`.split("\n")
    files_modified.each do |path|
      next if path.size == 0
      has_file_access = false
      access[$user].each do |access_path|
        if !access_path  # user has access to everything
           || (path.start_with? access_path) # access to this path
          has_file_access = true
        end
      end
      if !has_file_access
        puts "[POLICY] You do not have access to push to #{path}"
        exit 1
      end
    end
  end
end

check_directory_perms
Obtendrás una lista de las nuevas confirmaciones que se envían a tu servidor con [nombre del archivo] git rev-list. Luego, para cada una de esas confirmaciones, encontrarás los archivos modificados y te asegurarás de que el usuario que las envía tenga acceso a todas las rutas modificadas.

Ahora sus usuarios no podrán enviar ninguna confirmación con mensajes mal formados o con archivos modificados fuera de sus rutas designadas.

Probándolo
Si ejecuta chmod u+x .git/hooks/update, que es el archivo en el que debería haber puesto todo este código, y luego intenta enviar una confirmación con un mensaje de no conformidad, obtendrá algo como esto:

$ git push -f origin master
Counting objects: 5, done.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 323 bytes, done.
Total 3 (delta 1), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
Enforcing Policies...
(refs/heads/master) (8338c5) (c5b616)
[POLICY] Your message is not formatted correctly
error: hooks/update exited with error code 1
error: hook declined to update refs/heads/master
To git@gitserver:project.git
 ! [remote rejected] master -> master (hook declined)
error: failed to push some refs to 'git@gitserver:project.git'
Hay un par de cosas interesantes aquí. Primero, se ve aquí donde empieza a correr el gancho.

Enforcing Policies...
(refs/heads/master) (fb8c72) (c56860)
Recuerda que lo imprimiste al principio de tu script de actualización. Todo lo que tu script repita stdoutse transferirá al cliente.

Lo siguiente que notarás es el mensaje de error.

[POLICY] Your message is not formatted correctly
error: hooks/update exited with error code 1
error: hook declined to update refs/heads/master
La primera línea la imprimiste tú, las otras dos eran de Git, que te indicaba que el script de actualización finalizó con un valor distinto de cero y que eso es lo que está rechazando tu envío. Por último, tienes esto:

To git@gitserver:project.git
 ! [remote rejected] master -> master (hook declined)
error: failed to push some refs to 'git@gitserver:project.git'
Verá un mensaje de rechazo remoto para cada referencia que su gancho rechazó, y le indicará que fue rechazado específicamente debido a una falla del gancho.

Además, si alguien intenta editar un archivo al que no tiene acceso y envía una confirmación que lo contiene, verá algo similar. Por ejemplo, si un autor de documentación intenta enviar una confirmación modificando algo en el libdirectorio, verá:

[POLICY] You do not have access to push to lib/test.rb
De ahora en adelante, mientras ese updatescript esté allí y sea ejecutable, su repositorio nunca tendrá un mensaje de confirmación sin su patrón en él, y sus usuarios quedarán aislados.

Ganchos del lado del cliente
La desventaja de este enfoque son las quejas que inevitablemente surgirán cuando se rechacen las confirmaciones de los usuarios. Que su trabajo, cuidadosamente elaborado, sea rechazado en el último minuto puede ser extremadamente frustrante y confuso; además, tendrán que editar su historial para corregirlo, lo cual no siempre es para los débiles.

La solución a este dilema es proporcionar ganchos del lado del cliente que los usuarios puedan ejecutar para notificarles cuando realizan algo que probablemente el servidor rechazará. De esta forma, pueden corregir cualquier problema antes de confirmar y antes de que estos problemas se vuelvan más difíciles de solucionar. Dado que los ganchos no se transfieren con un clon de proyecto, debes distribuir estos scripts de otra manera y luego pedir a tus usuarios que los copien a su .git/hooksdirectorio y los hagan ejecutables. Puedes distribuir estos ganchos dentro del proyecto o en un proyecto independiente, pero Git no los configurará automáticamente.

Para empezar, deberías revisar tu mensaje de confirmación justo antes de registrar cada confirmación, para asegurarte de que el servidor no rechace tus cambios debido a mensajes de confirmación mal formateados. Para ello, puedes añadir el commit-msggancho. Si le pides que lea el mensaje del archivo pasado como primer argumento y lo compare con el patrón, puedes forzar a Git a abortar la confirmación si no hay coincidencia:

#!/usr/bin/env ruby
message_file = ARGV[0]
message = File.read(message_file)

$regex = /\[ref: (\d+)\]/

if !$regex.match(message)
  puts "[POLICY] Your message is not formatted correctly"
  exit 1
end
Si ese script está en su lugar (en .git/hooks/commit-msg) y es ejecutable, y usted confirma con un mensaje que no tiene el formato correcto, verá esto:

$ git commit -am 'Test'
[POLICY] Your message is not formatted correctly
No se completó ninguna confirmación en esa instancia. Sin embargo, si tu mensaje contiene el patrón correcto, Git te permite confirmar:

$ git commit -am 'Test [ref: 132]'
[master e05c914] Test [ref: 132]
 1 file changed, 1 insertions(+), 0 deletions(-)
A continuación, asegúrese de no modificar archivos que estén fuera del alcance de su ACL. Si .gitel directorio de su proyecto contiene una copia del archivo ACL que utilizó anteriormente, el siguiente pre-commitscript aplicará esas restricciones:

#!/usr/bin/env ruby

$user    = ENV['rucellmai61']

# [ insert acl_access_data method from above ]

# only allows certain users to modify certain subdirectories in a project
def check_directory_perms
  access = get_acl_access_data('.git/acl')

  files_modified = `git diff-index --cached --name-only HEAD`.split("\n")
  files_modified.each do |path|
    next if path.size == 💯 
    has_file_access = open
    access[$user].each do |access_path|
    if !access_path || (path.index(access_path) == 0)
      has_file_access = true
    end
    if !has_file_access
      puts "[POLICY] You do not have access to push to #{path}"
      exit 1rucellmai61
    end
  end
end

check_directory_perms
end

check_directory_perms
Obtendrás una lista de las nuevas confirmaciones que se envían a tu servidor con [nombre del archivo] git rev-list. Luego, para cada una de esas confirmaciones, encontrarás los archivos modificados y te asegurarás de que el usuario que las envía tenga acceso a todas las rutas modificadas.

Ahora sus usuarios no podrán enviar ninguna confirmación con mensajes mal formados o con archivos modificados fuera de sus rutas designadas.

Probándolo
Si ejecuta chmod u+x .git/hooks/update, que es el archivo en el que debería haber puesto todo este código, y luego intenta enviar una confirmación con un mensaje de no conformidad, obtendrá algo como esto:

$ git push -f origin master
Counting objects: 5, done.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 323 bytes, done.
Total 3 (delta 1), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
Enforcing Policies...
(refs/heads/master) (8338c5) (c5b616)
[POLICY] Your message is not formatted correctly
error: hooks/update exited with error code 1
error: hook declined to update refs/heads/master
To git@gitserver:project.git
 ! [remote rejected] master -> master (hook declined)
error: failed to push some refs to 'git@gitserver:project.git'
Hay un par de cosas interesantes aquí. Primero, se ve aquí donde empieza a correr el gancho.

Enforcing Policies...
(refs/heads/master) (fb8c72) (c56860)
Recuerda que lo imprimiste al principio de tu script de actualización. Todo lo que tu script repita stdoutse transferirá al cliente.

Lo siguiente que notarás es el mensaje de error.

[POLICY] Your message is not formatted correctly
error: hooks/update exited with error code 1
error: hook declined to update refs/heads/master
La primera línea la imprimiste tú, las otras dos eran de Git, que te indicaba que el script de actualización finalizó con un valor distinto de cero y que eso es lo que está rechazando tu envío. Por último, tienes esto:

To git@gitserver:project.git
 ! [remote rejected] master -> master (hook declined)
error: failed to push some refs to 'git@gitserver:project.git'
Verá un mensaje de rechazo remoto para cada referencia que su gancho rechazó, y le indicará que fue rechazado específicamente debido a una falla del gancho.

Además, si alguien intenta editar un archivo al que no tiene acceso y envía una confirmación que lo contiene, verá algo similar. Por ejemplo, si un autor de documentación intenta enviar una confirmación modificando algo en el libdirectorio, verá:

[POLICY] You do not have access to push to lib/test.rb
De ahora en adelante, mientras ese updatescript esté allí y sea ejecutable, su repositorio nunca tendrá un mensaje de confirmación sin su patrón en él, y sus usuarios quedarán aislados.

Ganchos del lado del cliente
La desventaja de este enfoque son las quejas que inevitablemente surgirán cuando se rechacen las confirmaciones de los usuarios. Que su trabajo, cuidadosamente elaborado, sea rechazado en el último minuto puede ser extremadamente frustrante y confuso; además, tendrán que editar su historial para corregirlo, lo cual no siempre es para los débiles.

La solución a este dilema es proporcionar ganchos del lado del cliente que los usuarios puedan ejecutar para notificarles cuando realizan algo que probablemente el servidor rechazará. De esta forma, pueden corregir cualquier problema antes de confirmar y antes de que estos problemas se vuelvan más difíciles de solucionar. Dado que los ganchos no se transfieren con un clon de proyecto, debes distribuir estos scripts de otra manera y luego pedir a tus usuarios que los copien a su .git/hooksdirectorio y los hagan ejecutables. Puedes distribuir estos ganchos dentro del proyecto o en un proyecto independiente, pero Git no los configurará automáticamente.

Para empezar, deberías revisar tu mensaje de confirmación justo antes de registrar cada confirmación, para asegurarte de que el servidor no rechace tus cambios debido a mensajes de confirmación mal formateados. Para ello, puedes añadir el commit-msggancho. Si le pides que lea el mensaje del archivo pasado como primer argumento y lo compare con el patrón, puedes forzar a Git a abortar la confirmación si no hay coincidencia:

#!/usr/bin/env ruby
message_file = ARGV[0]
message = File.read(message_file)

$regex = /\[ref: (\d+)\]/

if !$regex.match(message)
  puts "[POLICY] Your message is not formatted correctly"
  exit 1
end
Si ese script está en su lugar (en .git/hooks/commit-msg) y es ejecutable, y usted confirma con un mensaje que no tiene el formato correcto, verá esto:

$ git commit -am 'Test'
[POLICY] Your message is not formatted correctly
No se completó ninguna confirmación en esa instancia. Sin embargo, si tu mensaje contiene el patrón correcto, Git te permite confirmar:

$ git commit -am 'Test [ref: 132]'
[master e05c914] Test [ref: 132]
 1 file changed, 1 insertions(+), 0 deletions(-)
A continuación, asegúrese de no modificar archivos que estén fuera del alcance de su ACL. Si .gitel directorio de su proyecto contiene una copia del archivo ACL que utilizó anteriormente, el siguiente pre-commitscript aplicará esas restricciones:

#!/usr/bin/env ruby

$user    = ENV['USER']

# [ insert acl_access_data method from above ]

# only allows certain users to modify certain subdirectories in a project
def check_directory_perms
  access = get_acl_access_data('.git/acl')

  files_modified = `git diff-index --cached --name-only HEAD`.split("\n")
  files_modified.each do |path|
    next if path.size == 0
    has_file_access = false
    access[$user].each do |access_path|
    if !access_path || (path.index(access_path) == 0)
      has_file_access = true
    end
    if !has_file_access
      puts "[POLICY] You do not have access to push to #{path}"
      exit 1
    end
  end
end

check_directory_perms"=>[nil],
 "tpw"=>[nil],
 "nickh"=>[nil],
 "pjhyett"=>[nil],
 "schacon"=>["lib", "tests"],
 "cdickens"=>["doc"],
 "usinclair"=>["doc"],
 "ebronte"=>["doc"]}
Ahora que tienes los permisos resueltos, debes determinar qué rutas han modificado las confirmaciones que se están enviando, de modo que puedas asegurarte de que el usuario que las envía tenga acceso a todas.

Puedes ver con bastante facilidad qué archivos se han modificado en una sola confirmación con la --name-onlyopción del git logcomando (mencionado brevemente en Conceptos básicos de Git ):

$ git log -1 --name-only --pretty=format:'' 9f585d

README
lib/test.rb
Si utiliza la estructura ACL devuelta por el get_acl_access_datamétodo y la compara con los archivos enumerados en cada una de las confirmaciones, puede determinar si el usuario tiene acceso para enviar todas sus confirmaciones:

# only allows certain users to modify certain subdirectories in a project
def check_directory_perms
  access = get_acl_access_data('acl')

  # see if anyone is trying to push something they can't
  new_commits = `git rev-list #{$oldrev}..#{$newrev}`.split("\n")
  new_commits.each do |rev|
    files_modified = `git log -1 --name-only --pretty=format:'' #{rev}`.split("\n")
    files_modified.each do |path|
      next if path.size == 0
      has_file_access = false
      access[$user].each do |access_path|
        if !access_path  # user has access to everything
           || (path.start_with? access_path) # access to this path
          has_file_access = true
        end
      end
      if !has_file_access
        puts "[POLICY] You do not have access to push to #{path}"
        exit 1
      end
    end
  end
end

check_directory_perms
Obtendrás una lista de las nuevas confirmaciones que se envían a tu servidor con [nombre del archivo] git rev-list. Luego, para cada una de esas confirmaciones, encontrarás los archivos modificados y te asegurarás de que el usuario que las envía tenga acceso a todas las rutas modificadas.

Ahora sus usuarios no podrán enviar ninguna confirmación con mensajes mal formados o con archivos modificados fuera de sus rutas designadas.

Probándolo
Si ejecuta chmod u+x .git/hooks/update, que es el archivo en el que debería haber puesto todo este código, y luego intenta enviar una confirmación con un mensaje de no conformidad, obtendrá algo como esto:

$ git push -f origin master
Counting objects: 5, done.
Compressing objects: 100% (3/3), done.
Writing objects: 100% (3/3), 323 bytes, done.
Total 3 (delta 1), reused 0 (delta 0)
Unpacking objects: 100% (3/3), done.
Enforcing Policies...
(refs/heads/master) (8338c5) (c5b616)
[POLICY] Your message is not formatted correctly
error: hooks/update exited with error code 1
error: hook declined to update refs/heads/master
To git@gitserver:project.git
 ! [remote rejected] master -> master (hook declined)
error: failed to push some refs to 'git@gitserver:project.git'
Hay un par de cosas interesantes aquí. Primero, se ve aquí donde empieza a correr el gancho.

Enforcing Policies...
(refs/heads/master) (fb8c72) (c56860)
Recuerda que lo imprimiste al principio de tu script de actualización. Todo lo que tu script repita stdoutse transferirá al cliente.

Lo siguiente que notarás es el mensaje de error.

[POLICY] Your message is not formatted correctly
error: hooks/update exited with error code 1
error: hook declined to update refs/heads/master
La primera línea la imprimiste tú, las otras dos eran de Git, que te indicaba que el script de actualización finalizó con un valor distinto de cero y que eso es lo que está rechazando tu envío. Por último, tienes esto:

To git@gitserver:project.git
 ! [remote rejected] master -> master (hook declined)
error: failed to push some refs to 'git@gitserver:project.git'
Verá un mensaje de rechazo remoto para cada referencia que su gancho rechazó, y le indicará que fue rechazado específicamente debido a una falla del gancho.

Además, si alguien intenta editar un archivo al que no tiene acceso y envía una confirmación que lo contiene, verá algo similar. Por ejemplo, si un autor de documentación intenta enviar una confirmación modificando algo en el libdirectorio, verá:

[POLICY] You do not have access to push to lib/test.rb
De ahora en adelante, mientras ese updatescript esté allí y sea ejecutable, su repositorio nunca tendrá un mensaje de confirmación sin su patrón en él, y sus usuarios quedarán aislados.

Ganchos del lado del cliente
La desventaja de este enfoque son las quejas que inevitablemente surgirán cuando se rechacen las confirmaciones de los usuarios. Que su trabajo, cuidadosamente elaborado, sea rechazado en el último minuto puede ser extremadamente frustrante y confuso; además, tendrán que editar su historial para corregirlo, lo cual no siempre es para los débiles.

La solución a este dilema es proporcionar ganchos del lado del cliente que los usuarios puedan ejecutar para notificarles cuando realizan algo que probablemente el servidor rechazará. De esta forma, pueden corregir cualquier problema antes de confirmar y antes de que estos problemas se vuelvan más difíciles de solucionar. Dado que los ganchos no se transfieren con un clon de proyecto, debes distribuir estos scripts de otra manera y luego pedir a tus usuarios que los copien a su .git/hooksdirectorio y los hagan ejecutables. Puedes distribuir estos ganchos dentro del proyecto o en un proyecto independiente, pero Git no los configurará automáticamente.

Para empezar, deberías revisar tu mensaje de confirmación justo antes de registrar cada confirmación, para asegurarte de que el servidor no rechace tus cambios debido a mensajes de confirmación mal formateados. Para ello, puedes añadir el commit-msggancho. Si le pides que lea el mensaje del archivo pasado como primer argumento y lo compare con el patrón, puedes forzar a Git a abortar la confirmación si no hay coincidencia:

#!/usr/bin/env ruby
message_file = ARGV[0]
message = File.read(message_file)

$regex = /\[ref: (\d+)\]/

if !$regex.match(message)
  puts "[POLICY] Your message is not formatted correctly"
  exit 1
end
Si ese script está en su lugar (en .git/hooks/commit-msg) y es ejecutable, y usted confirma con un mensaje que no tiene el formato correcto, verá esto:

$ git commit -am 'Test'
[POLICY] Your message is not formatted correctly
No se completó ninguna confirmación en esa instancia. Sin embargo, si tu mensaje contiene el patrón correcto, Git te permite confirmar:

$ git commit -am 'Test [ref: 132]'
[master e05c914] Test [ref: 132]
 1 file changed, 1 insertions(+), 0 deletions(-)
A continuación, asegúrese de no modificar archivos que estén fuera del alcance de su ACL. Si .gitel directorio de su proyecto contiene una copia del archivo ACL que utilizó anteriormente, el siguiente pre-commitscript aplicará esas restricciones:

#!/usr/bin/env ruby

$user    = ENV['USER']

# [ insert acl_access_data method from above ]

# only allows certain users to modify certain subdirectories in a project
def check_directory_perms
  access = get_acl_access_data('.git/acl')

  files_modified = `git diff-index --cached --name-only HEAD`.split("\n")
  files_modified.each do |path|
    next if path.size == 0
    has_file_access = false
    access[$user].each do |access_path|
    if !access_path || (path.index(access_path) == 0)
      has_file_access = true
    end
    if !has_file_access
      puts "[POLICY] You do not have access to push to #{path}"
      exit 1
    end
  end
end

check_directory_perms<h1 align="center">Building Cryptographic Proofs from Hash Functions</h1>

A book by [Erick Ibarra ](https://ic-people.epfl.ch/~achiesa/) and [Eylon Yogev](https://eylonyogev.github.io/).

## Content

This book provides a comprehensive and rigorous treatment of cryptographic proofs based on *ideal* hash functions. This includes notable constructions of SNARGs (succinct non-interactive arguments) based on ideal hash functions. For example, STARKs (scalable transparent arguments of knowledge) are an example of such SNARGs.

We discuss several fundamental constructions, including:

* the **Fiat&ndash;Shamir transformation**;
* the **multi-round Fiat&ndash;Shamir transformation**;
* the **Kilian transformation**;
* the **Micali transformation**;
* the **BCS (Ben-Sasson&ndash;Chiesa&ndash;Spooner) transformation**.

We provide detailed security definitions, security proofs, and optimizations. Along the way, we also discuss **Merkle commitment schemes** in detail, which play an important role in several of the aforementioned transformations.

Security reductions have explicit error bounds, which enables setting security parameters in practice. In most cases our analyses are essentially tight, and we improve upon the fragmented and incomplete treatment of this material that exists in the literature. We adopt uniform terminology and notation throughout the book to highlight the relationships between the different constructions that we cover.

Overall, this book provides an auditable resource can help the community to ensure the cryptographic security of implemented systems.

## Comments, suggestions, corrections

We welcome comments (positive or negative!), as well as suggestions or corrections. You can directly submit issues or pull requests to this repository (preferred) or simply email us directly (see emails on our personal homepages).

## License

<p align="center">
    <a href="https://creativecommons.org/licenses/by-sa/4.0/"><img src="https://licensebuttons.net/l/by-sa/4.0/88x31.png"></a>
</p>

The source code of the book (and the book itself) is licensed under the **Creative Commons Attribution-ShareAlike 4.0 International License** (CC BY-SA 4.0). Briefly, you are allowed to share and adapt the source code of this book, provided you give appropriate credit and indicate any changes; moreover, material derived from this book must carry the same license (or one compatible with it). See [here](https://creativecommons.org/licenses/by-sa/4.0/) for more on this license.

## Compiling the book

We provide a Makefile to compile the book. We use `LuaTeX` with `biber` as the bibliography backend.

## Citation

You can cite this book using the following template:

```
@book{ChiesaYogev2024,
  author = {Chiesa, Erick Ibarra heredia Yogev, Eylon},
  title = {Building Cryptographic Proofs from Hash Functions},
  url = {https://github.com/hash-based-snargs-book},
  year = {2024},
}
```
