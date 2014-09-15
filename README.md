# Emacs setup for hyPiRion

I think the current setup skips CEDET, as it is heavy to load. Feel free to
attempt to load this one without the struggles mentioned below.

I wished I could avoid creating my own readme, but setting up CEDET+JDEE is a
bit more hassle than I thought it would be. So, for CEDET+JDEE, here goes
instructions:

* Dowload CEDET 1.1 and put into your `~/.emacs.d/` directory
* Dowload JDEE 2.4.0.1 and put it into `~./emacs.d/` directory
* Hack a bit on `jdee-2.4.0.1/lisp/jde.el`, by replacing

```lisp
(defconst jde-cedet-max-version "1.0"
  "Cedet maximum version")
```

  with
```lisp
(defconst jde-cedet-max-version "1.1"
  "Cedet maximum version")
```

* Recompile from emacs, using `byte-recompile-file` on
  `jdee-2.4.0.1/lisp/jde.el`

Originally found [here][orig].
[orig]: http://forums.fedoraforum.org/showpost.php?p=1582591&postcount=4

In addition, setting up the Jde JDK registry is also something worth doing.

Set the `jde-jdk-registry` variable, which should be the version number and the
Java path on the form shown in `init.el`. On linux systems, the real java path
for a specific version could be found by doing `which javac | xargs readlink |
xargs readlink` and removing the `bin/javac` part afterwards. For openJDK and
Debian-based versions it's usually something like
`/usr/lib/jvm/java-VERSION-openjdk-ARCHITECTURE`.

Then, set the global classpath (`jde-global-classpath`) by taking the previous
path + the suffix `/jre/lib/`. (the directory should contain `target.jar`). Also
on the form shown in my `init.el` file.

And that should be it.

## Go mode

Install gocode (or uncomment the loading of `hypirion-go`) if you want to have
autocomplete for Go mode. <https://github.com/nsf/gocode> gives installation
instructions. The `go-autocomplete.el` file must be placed within the `hypirion`
directory.

## License

Copyright © 2012-2014 Jean Niklas L'orange. Distributed under the GPL 3.0, see
the file LICENSE.
