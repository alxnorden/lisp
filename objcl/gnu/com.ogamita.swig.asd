;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-

#+(or (and ccl darwin) (and clisp macos))
(eval-when (:execute :compile-toplevel :load-toplevel)
  (pushnew :macosx *features*))

(asdf:defsystem :com.ogamita.swig
    :name "Swig generated packages." 
    :description  "This systems gathers all the CFFI packages generated by Swig."
    :author "<PJB> Pascal J. Bourguignon <pjb@ogamita.com"
    :version "0.0.3"
    :licence "Proprietary"
    :properties ((#:author-email                   . "pjb@ogamita.com")
                 (#:date                           . "Spring 2011")
                 ((#:albert #:output-dir)          . "../documentation/com.ogamita.swig/")
                 ((#:albert #:formats)             . ("docbook"))
                 ((#:albert #:docbook #:template)  . "book")
                 ((#:albert #:docbook #:bgcolor)   . "white")
                 ((#:albert #:docbook #:textcolor) . "black"))
    :depends-on ("cffi")
    :components ((:file "packages")
                 #-(and)
                 (:file "xcb"              :depends-on ("packages"))
                 #+macosx
                 (:file "coregraphics"     :depends-on ("packages"))
                 (:file "packages-exports" :depends-on (#-(and)  "xcb"
                                                        #+macosx "coregraphics"))))

;;;; THE END ;;;;