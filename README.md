# Emacs setup for hyPiRion

I was hoping I could avoid a readme, but setting up CEDET+JDEE is a bit more
hassle than I thought it would be. So, for CEDET+JDEE, here goes instructions:

* Dowload CEDET 1.1 and put into your `~/.emacs.d/` directory
* Dowload JDEE 2.4.0.1 and put it into `~./emacs.d/` directory
* Hack a bit on `jdee-2.4.0.1/lisp/jde.el`, by replacing
  ```cl
  (defconst jde-cedet-max-version "1.0"
    "Cedet maximum version")
  ```
  with
  ```cl
  (defconst jde-cedet-max-version "1.1"
    "Cedet maximum version")
  ```
* Delete `jdee-2.4.0.1/lisp/jde.elc`

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
