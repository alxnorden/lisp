(defparameter *cl-symbols-by-chapter*
  '(((3 "Evaluation and Compilation")
     (:symbol lambda)
     (:macro lambda)
     (:function compile)
     (:function eval)
     (:special-operator eval-when)
     (:special-operator load-time-value)
     (:special-operator quote)
     (:accessor compiler-macro-function)
     (:macro define-compiler-macro)
     (:macro defmacro)
     (:accessor macro-function)
     (:function macroexpand)
     (:function macroexpand-1)
     (:macro define-symbol-macro)
     (:special-operator symbol-macrolet)
     (:variable *macroexpand-hook*)
     (:function proclaim)
     (:macro declaim)
     (:symbol declare)
     (:declaration ignore)
     (:declaration ignorable)
     (:declaration dynamic-extent)
     (:declaration type)
     (:declaration inline)
     (:declaration notinline)
     (:declaration ftype)
     (:declaration declaration)
     (:declaration optimize)
     (:declaration special)
     (:special-operator locally)
     (:special-operator the)
     (:function special-operator-p)
     (:function constantp))
    ((4 "Types and Classes")
     (:type nil)
     (:type boolean)
     (:system-class function)
     (:type compiled-function)
     (:system-class generic-function)
     (:system-class  standard-generic-function)
     (:system-class class)
     (:system-class built-in-class)
     (:system-class structure-class)
     (:system-class standard-class)
     (:system-class method)
     (:system-class standard-method)
     (:class structure-object)
     (:class standard-object)
     (:system-class method-combination)
     (:system-class t)
     (:type-specifier satisfies)
     (:type-specifier member)
     (:type-specifier not)
     (:type-specifier and)
     (:type-specifier or)
     (:type-specifier values)
     (:type-specifier eql)
     (:function coerce)
     (:macro deftype)
     (:function subtypep)
     (:function type-of)
     (:function typep)
     (:condition-type type-error)
     (:function type-error-datum)
     (:function type-error-expected-type)
     (:condition-type simple-type-error))
    ((5 "Data and Control Flow")
     (:function apply)
     (:macro defun)
     (:accessor fdefinition)
     (:function fboundp)
     (:function fmakunbound)
     (:special-operator flet)
     (:special-operator labels)
     (:special-operator macrolet)
     (:function funcall)
     (:special-operator function)
     (:function  function-lambda-expression)
     (:function functionp)
     (:function compiled-function-p)
     (:constant-variable  call-arguments-limit)
     (:constant-variable  lambda-list-keywords)
     (:constant-variable  lambda-parameters-limit)
     (:macro defconstant)
     (:macro defparameter)
     (:macro defvar)
     (:macro destructuring-bind)
     (:special-operator let)
     (:special-operator let*)
     (:special-operator progv)
     (:special-form setq)
     (:macro psetq)
     (:special-operator block)
     (:special-operator catch)
     (:special-operator go)
     (:special-operator return-from)
     (:macro return)
     (:special-operator tagbody)
     (:special-operator throw)
     (:special-operator unwind-protect)
     (:constant-variable nil)
     (:function not)
     (:constant-variable t)
     (:function eq)
     (:function eql)
     (:function equal)
     (:function equalp)
     (:function identity)
     (:function complement)
     (:function constantly)
     (:function every)
     (:function some)
     (:function notevery)
     (:function notany)
     (:macro and)
     (:macro cond)
     (:special-operator if)
     (:macro or)
     (:macro when)
     (:macro unless)
     (:macro case)
     (:macro ccase)
     (:macro ecase)
     (:macro typecase)
     (:macro ctypecase)
     (:macro etypecase)
     (:macro multiple-value-bind)
     (:special-operator  multiple-value-call)
     (:macro multiple-value-list)
     (:special-operator  multiple-value-prog1)
     (:macro multiple-value-setq)
     (:accessor values)
     (:function values-list)
     (:constant-variable  multiple-values-limit)
     (:macro nth-value)
     (:macro prog)
     (:macro prog*)
     (:macro prog1)
     (:macro prog2)
     (:special-operator progn)
     (:macro define-modify-macro)
     (:macro defsetf)
     (:macro define-setf-expander)
     (:function get-setf-expansion)
     (:macro setf)
     (:macro psetf)
     (:macro shiftf)
     (:macro rotatef)
     (:condition-type control-error)
     (:condition-type program-error)
     (:condition-type  undefined-function))
    ((6 "Iteration")
     (:macro do)
     (:macro do*)
     (:macro dotimes)
     (:macro dolist)
     (:macro loop)
     (:local-macro loop-finish))
    ((7 "Objects")
     (:standard-generic-function  function-keywords)
     (:function ensure-generic-function)
     (:standard-generic-function  allocate-instance)
     (:standard-generic-function  reinitialize-instance)
     (:standard-generic-function  shared-initialize)
     (:standard-generic-function  update-instance-for-different-class)
     (:standard-generic-function  update-instance-for-redefined-class)
     (:standard-generic-function  change-class)
     (:function slot-boundp)
     (:function slot-exists-p)
     (:function slot-makunbound)
     (:standard-generic-function  slot-missing)
     (:standard-generic-function  slot-unbound)
     (:function slot-value)
     (:standard-generic-function  method-qualifiers)
     (:standard-generic-function  no-applicable-method)
     (:standard-generic-function  no-next-method)
     (:standard-generic-function  remove-method)
     (:standard-generic-function  make-instance)
     (:standard-generic-function  make-instances-obsolete)
     (:standard-generic-function  make-load-form)
     (:function  make-load-form-saving-slots)
     (:macro with-accessors)
     (:macro with-slots)
     (:macro defclass)
     (:macro defgeneric)
     (:macro defmethod)
     (:accessor find-class)
     (:local-function next-method-p)
     (:local-macro call-method)
     (:local-macro make-method)
     (:local-function call-next-method)
     (:standard-generic-function compute-applicable-methods)
     (:macro define-method-combination)
     (:standard-generic-function find-method)
     (:standard-generic-function add-method)
     (:standard-generic-function initialize-instance)
     (:standard-generic-function class-name)
     (:standard-generic-function (setf class-name))
     (:function class-of)
     (:condition-type unbound-slot)
     (:function unbound-slot-instance))
    ((8 "Structures")
     (:macro defstruct)
     (:function copy-structure))
    ((9 "Conditions")
     (:condition-type condition)
     (:condition-type warning)
     (:condition-type style-warning)
     (:condition-type serious-condition)
     (:condition-type error)
     (:condition-type cell-error)
     (:function cell-error-name)
     (:condition-type parse-error)
     (:condition-type storage-condition)
     (:macro assert)
     (:function error)
     (:function cerror)
     (:macro check-type)
     (:condition-type simple-error)
     (:function invalid-method-error)
     (:function method-combination-error)
     (:function signal)
     (:condition-type simple-condition)
     (:function  simple-condition-format-control)
     (:function  simple-condition-format-arguments)
     (:function warn)
     (:condition-type simple-warning)
     (:function invoke-debugger)
     (:function break)
     (:variable *debugger-hook*)
     (:variable *break-on-signals*)
     (:macro handler-bind)
     (:macro handler-case)
     (:macro ignore-errors)
     (:macro define-condition)
     (:function make-condition)
     (:system-class restart)
     (:function compute-restarts)
     (:function find-restart)
     (:function invoke-restart)
     (:function  invoke-restart-interactively)
     (:macro restart-bind)
     (:macro restart-case)
     (:function restart-name)
     (:macro with-condition-restarts)
     (:macro with-simple-restart)
     (:restart abort)
     (:restart continue)
     (:restart muffle-warning)
     (:restart store-value)
     (:restart use-value)
     (:function abort)
     (:function continue)
     (:function muffle-warning)
     (:function store-value)
     (:function use-value))
    ((10 "Symbols")
     (:system-class symbol)
     (:type keyword)
     (:function symbolp)
     (:function keywordp)
     (:function make-symbol)
     (:function copy-symbol)
     (:function gensym)
     (:variable *gensym-counter*)
     (:function gentemp)
     (:accessor symbol-function)
     (:function symbol-name)
     (:function symbol-package)
     (:accessor symbol-plist)
     (:accessor symbol-value)
     (:accessor get)
     (:function remprop)
     (:function boundp)
     (:function makunbound)
     (:function set)
     (:condition-type unbound-variable))
    ((11 "Packages")
     (:system-class package)
     (:function export)
     (:function find-symbol)
     (:function find-package)
     (:function find-all-symbols)
     (:function import)
     (:function list-all-packages)
     (:function rename-package)
     (:function shadow)
     (:function shadowing-import)
     (:function delete-package)
     (:function make-package)
     (:macro with-package-iterator)
     (:function unexport)
     (:function unintern)
     (:macro in-package)
     (:function unuse-package)
     (:function use-package)
     (:macro defpackage)
     (:macro do-symbols)
     (:macro do-external-symbols)
     (:macro do-all-symbols)
     (:function intern)
     (:function package-name)
     (:function package-nicknames)
     (:function  package-shadowing-symbols)
     (:function package-use-list)
     (:function package-used-by-list)
     (:function packagep)
     (:variable *package*)
     (:condition-type package-error)
     (:function package-error-package))
    ((12 "Numbers")
     (:system-class number)
     (:system-class complex)
     (:system-class real)
     (:system-class float)
     (:type short-float)
     (:type single-float)
     (:type double-float)
     (:type long-float)
     (:system-class rational)
     (:system-class ratio)
     (:system-class integer)
     (:type signed-byte)
     (:type unsigned-byte)
     (:type-specifier mod)
     (:type bit)
     (:type fixnum)
     (:type bignum)
     (:function =)
     (:function /=)
     (:function <)
     (:function >)
     (:function <=)
     (:function >=)
     (:function max)
     (:function min)
     (:function minusp)
     (:function plusp)
     (:function zerop)
     (:function floor)
     (:function ffloor)
     (:function ceiling)
     (:function fceiling)
     (:function truncate)
     (:function ftruncate)
     (:function round)
     (:function fround)
     (:function sin)
     (:function cos)
     (:function tan)
     (:function asin)
     (:function acos)
     (:function atan)
     (:constant-variable pi)
     (:function sinh)
     (:function cosh)
     (:function tanh)
     (:function asinh)
     (:function acosh)
     (:function atanh)
     (:function *)
     (:function +)
     (:function -)
     (:function /)
     (:function 1+)
     (:function 1-)
     (:function abs)
     (:function evenp)
     (:function oddp)
     (:function exp)
     (:function expt)
     (:function gcd)
     (:macro incf)
     (:macro decf)
     (:function lcm)
     (:function log)
     (:function mod)
     (:function rem)
     (:function signum)
     (:function sqrt)
     (:function isqrt)
     (:system-class random-state)
     (:function make-random-state)
     (:function random)
     (:function random-state-p)
     (:variable *random-state*)
     (:function numberp)
     (:function cis)
     (:function complex)
     (:function complexp)
     (:function conjugate)
     (:function phase)
     (:function realpart)
     (:function imagpart)
     (:function  upgraded-complex-part-type)
     (:function realp)
     (:function numerator)
     (:function denominator)
     (:function rational)
     (:function rationalize)
     (:function rationalp)
     (:function ash)
     (:function integer-length)
     (:function integerp)
     (:function parse-integer)
     (:function boole)
     (:constant-variable boole-1)
     (:constant-variable boole-2)
     (:constant-variable boole-and)
     (:constant-variable boole-andc1)
     (:constant-variable boole-andc2)
     (:constant-variable boole-c1)
     (:constant-variable boole-c2)
     (:constant-variable boole-clr)
     (:constant-variable boole-eqv)
     (:constant-variable boole-ior)
     (:constant-variable boole-nand)
     (:constant-variable boole-nor)
     (:constant-variable boole-orc1)
     (:constant-variable boole-orc2)
     (:constant-variable boole-set)
     (:constant-variable boole-xor)
     (:function logand)
     (:function logandc1)
     (:function logandc2)
     (:function logeqv)
     (:function logior)
     (:function lognand)
     (:function lognor)
     (:function lognot)
     (:function logorc1)
     (:function logorc2)
     (:function logxor)
     (:function logbitp)
     (:function logcount)
     (:function logtest)
     (:function byte)
     (:function byte-size)
     (:function byte-position)
     (:function deposit-field)
     (:function dpb)
     (:accessor ldb)
     (:function ldb-test)
     (:accessor mask-field)
     (:constant-variable  most-positive-fixnum)
     (:constant-variable  most-negative-fixnum)
     (:function decode-float)
     (:function scale-float)
     (:function float-radix)
     (:function float-sign)
     (:function float-digits)
     (:function float-precision)
     (:function integer-decode-float)
     (:function float)
     (:function floatp)
     (:constant-variable  most-positive-short-float)
     (:constant-variable  least-positive-short-float)
     (:constant-variable  least-positive-normalized-short-float)
     (:constant-variable  most-positive-double-float)
     (:constant-variable  least-positive-double-float)
     (:constant-variable  least-positive-normalized-double-float)
     (:constant-variable  most-positive-long-float)
     (:constant-variable  least-positive-long-float)
     (:constant-variable  least-positive-normalized-long-float)
     (:constant-variable  most-positive-single-float)
     (:constant-variable  least-positive-single-float)
     (:constant-variable  least-positive-normalized-single-float)
     (:constant-variable  most-negative-short-float)
     (:constant-variable  least-negative-short-float)
     (:constant-variable  least-negative-normalized-short-float)
     (:constant-variable  most-negative-single-float)
     (:constant-variable  least-negative-single-float)
     (:constant-variable  least-negative-normalized-single-float)
     (:constant-variable  most-negative-double-float)
     (:constant-variable  least-negative-double-float)
     (:constant-variable  least-negative-normalized-double-float)
     (:constant-variable  most-negative-long-float)
     (:constant-variable  least-negative-long-float)
     (:constant-variable  least-negative-normalized-long-float)
     (:constant-variable  short-float-epsilon)
     (:constant-variable  short-float-negative-epsilon)
     (:constant-variable  single-float-epsilon)
     (:constant-variable  single-float-negative-epsilon)
     (:constant-variable  double-float-epsilon)
     (:constant-variable  double-float-negative-epsilon)
     (:constant-variable  long-float-epsilon)
     (:constant-variable  long-float-negative-epsilon)
     (:condition-type arithmetic-error)
     (:function  arithmetic-error-operands)
     (:function  arithmetic-error-operation)
     (:condition-type division-by-zero)
     (:condition-type  floating-point-invalid-operation)
     (:condition-type  floating-point-inexact)
     (:condition-type  floating-point-overflow)
     (:condition-type  floating-point-underflow))
    ((13 "Characters")
     (:system-class character)
     (:type base-char)
     (:type standard-char)
     (:type extended-char)
     (:function char=)
     (:function char/=)
     (:function char<)
     (:function char>)
     (:function char<=)
     (:function char>=)
     (:function char-equal)
     (:function char-not-equal)
     (:function char-lessp)
     (:function char-greaterp)
     (:function char-not-greaterp)
     (:function char-not-lessp)
     (:function character)
     (:function characterp)
     (:function alpha-char-p)
     (:function alphanumericp)
     (:function digit-char)
     (:function digit-char-p)
     (:function graphic-char-p)
     (:function standard-char-p)
     (:function char-upcase)
     (:function char-downcase)
     (:function upper-case-p)
     (:function lower-case-p)
     (:function both-case-p)
     (:function char-code)
     (:function char-int)
     (:function code-char)
     (:constant-variable char-code-limit)
     (:function char-name)
     (:function name-char))
    ((14 "Conses")
     (:system-class list)
     (:system-class null)
     (:system-class cons)
     (:type atom)
     (:function cons)
     (:function consp)
     (:function atom)
     (:function rplaca)
     (:function rplacd)
     (:accessor car)
     (:accessor cdr)
     (:accessor caar)
     (:accessor cadr)
     (:accessor cdar)
     (:accessor cddr)
     (:accessor caaar)
     (:accessor caadr)
     (:accessor cadar)
     (:accessor caddr)
     (:accessor cdaar)
     (:accessor cdadr)
     (:accessor cddar)
     (:accessor cdddr)
     (:accessor caaaar)
     (:accessor caaadr)
     (:accessor caadar)
     (:accessor caaddr)
     (:accessor cadaar)
     (:accessor cadadr)
     (:accessor caddar)
     (:accessor cadddr)
     (:accessor cdaaar)
     (:accessor cdaadr)
     (:accessor cdadar)
     (:accessor cdaddr)
     (:accessor cddaar)
     (:accessor cddadr)
     (:accessor cdddar)
     (:accessor cddddr)
     (:function copy-tree)
     (:function sublis)
     (:function nsublis)
     (:function subst)
     (:function subst-if)
     (:function subst-if-not)
     (:function nsubst)
     (:function nsubst-if)
     (:function nsubst-if-not)
     (:function tree-equal)
     (:function copy-list)
     (:function list)
     (:function list*)
     (:function list-length)
     (:function listp)
     (:function make-list)
     (:macro push)
     (:macro pop)
     (:accessor first)
     (:accessor second)
     (:accessor third)
     (:accessor fourth)
     (:accessor fifth)
     (:accessor sixth)
     (:accessor seventh)
     (:accessor eighth)
     (:accessor ninth)
     (:accessor tenth)
     (:accessor nth)
     (:function endp)
     (:function null)
     (:function nconc)
     (:function append)
     (:function revappend)
     (:function nreconc)
     (:function butlast)
     (:function nbutlast)
     (:function last)
     (:function ldiff)
     (:function tailp)
     (:function nthcdr)
     (:accessor rest)
     (:function member)
     (:function member-if)
     (:function member-if-not)
     (:function mapc)
     (:function mapcar)
     (:function mapcan)
     (:function mapl)
     (:function maplist)
     (:function mapcon)
     (:function acons)
     (:function assoc)
     (:function assoc-if)
     (:function assoc-if-not)
     (:function copy-alist)
     (:function pairlis)
     (:function rassoc)
     (:function rassoc-if)
     (:function rassoc-if-not)
     (:function get-properties)
     (:accessor getf)
     (:macro remf)
     (:function intersection)
     (:function nintersection)
     (:function adjoin)
     (:macro pushnew)
     (:function set-difference)
     (:function nset-difference)
     (:function set-exclusive-or)
     (:function nset-exclusive-or)
     (:function subsetp)
     (:function union)
     (:function nunion))
    ((15 "Arrays")
     (:system-class array)
     (:type simple-array)
     (:system-class vector)
     (:type simple-vector)
     (:system-class bit-vector)
     (:type simple-bit-vector)
     (:function make-array)
     (:function adjust-array)
     (:function adjustable-array-p)
     (:accessor aref)
     (:function array-dimension)
     (:function array-dimensions)
     (:function array-element-type)
     (:function array-has-fill-pointer-p)
     (:function array-displacement)
     (:function array-in-bounds-p)
     (:function array-rank)
     (:function array-row-major-index)
     (:function array-total-size)
     (:function arrayp)
     (:accessor fill-pointer)
     (:accessor row-major-aref)
     (:function upgraded-array-element-type)
     (:constant-variable  array-dimension-limit)
     (:constant-variable  array-rank-limit)
     (:constant-variable  array-total-size-limit)
     (:function simple-vector-p)
     (:accessor svref)
     (:function vector)
     (:function vector-pop)
     (:function vector-push)
     (:function vector-push-extend)
     (:function vectorp)
     (:accessor bit)
     (:accessor sbit)
     (:function bit-and)
     (:function bit-andc1)
     (:function bit-andc2)
     (:function bit-eqv)
     (:function bit-ior)
     (:function bit-nand)
     (:function bit-nor)
     (:function bit-not)
     (:function bit-orc1)
     (:function bit-orc2)
     (:function bit-xor)
     (:function bit-vector-p)
     (:function simple-bit-vector-p))
    ((16 "Strings")
     (:system-class string)
     (:type base-string)
     (:type simple-string)
     (:type simple-base-string)
     (:function simple-string-p)
     (:accessor char)
     (:accessor schar)
     (:function string)
     (:function string-upcase)
     (:function string-downcase)
     (:function string-capitalize)
     (:function nstring-upcase)
     (:function nstring-downcase)
     (:function nstring-capitalize)
     (:function string-trim)
     (:function string-left-trim)
     (:function string-right-trim)
     (:function string=)
     (:function string/=)
     (:function string<)
     (:function string>)
     (:function string<=)
     (:function string>=)
     (:function string-equal)
     (:function string-not-equal)
     (:function string-lessp)
     (:function string-greaterp)
     (:function string-not-greaterp)
     (:function string-not-lessp)
     (:function stringp)
     (:function make-string))
    ((17 "Sequences")
     (:system-class sequence)
     (:function copy-seq)
     (:accessor elt)
     (:function fill)
     (:function make-sequence)
     (:accessor subseq)
     (:function map)
     (:function map-into)
     (:function reduce)
     (:function count)
     (:function count-if)
     (:function count-if-not)
     (:function length)
     (:function reverse)
     (:function nreverse)
     (:function sort)
     (:function stable-sort)
     (:function find)
     (:function find-if)
     (:function find-if-not)
     (:function position)
     (:function position-if)
     (:function position-if-not)
     (:function search)
     (:function mismatch)
     (:function replace)
     (:function substitute)
     (:function substitute-if)
     (:function substitute-if-not)
     (:function nsubstitute)
     (:function nsubstitute-if)
     (:function nsubstitute-if-not)
     (:function concatenate)
     (:function merge)
     (:function remove)
     (:function remove-if)
     (:function remove-if-not)
     (:function delete)
     (:function delete-if)
     (:function delete-if-not)
     (:function remove-duplicates)
     (:function delete-duplicates))
    ((18 "Hash Tables")
     (:system-class hash-table)
     (:function make-hash-table)
     (:function hash-table-p)
     (:function hash-table-count)
     (:function hash-table-rehash-size)
     (:function hash-table-rehash-threshold)
     (:function hash-table-size)
     (:function hash-table-test)
     (:accessor gethash)
     (:function remhash)
     (:function maphash)
     (:macro with-hash-table-iterator)
     (:function clrhash)
     (:function sxhash))
    ((19 "Filenames")
     (:system-class pathname)
     (:system-class logical-pathname)
     (:function pathname)
     (:function make-pathname)
     (:function pathnamep)
     (:function pathname-host)
     (:function pathname-device)
     (:function pathname-directory)
     (:function pathname-name)
     (:function pathname-type)
     (:function pathname-version)
     (:function load-logical-pathname-translations)
     (:accessor logical-pathname-translations)
     (:function logical-pathname)
     (:variable *default-pathname-defaults*)
     (:function namestring)
     (:function file-namestring)
     (:function directory-namestring)
     (:function host-namestring)
     (:function enough-namestring)
     (:function parse-namestring)
     (:function wild-pathname-p)
     (:function pathname-match-p)
     (:function translate-logical-pathname)
     (:function translate-pathname)
     (:function merge-pathnames))
    ((20 "Files")
     (:function directory)
     (:function probe-file)
     (:function ensure-directories-exist)
     (:function truename)
     (:function file-author)
     (:function file-write-date)
     (:function rename-file)
     (:function delete-file)
     (:condition-type file-error)
     (:function file-error-pathname))
    ((21 "Streams")
     (:system-class stream)
     (:system-class broadcast-stream)
     (:system-class concatenated-stream)
     (:system-class echo-stream)
     (:system-class file-stream)
     (:system-class string-stream)
     (:system-class synonym-stream)
     (:system-class two-way-stream)
     (:function input-stream-p)
     (:function output-stream-p)
     (:function interactive-stream-p)
     (:function open-stream-p)
     (:function stream-element-type)
     (:function streamp)
     (:function read-byte)
     (:function write-byte)
     (:function peek-char)
     (:function read-char)
     (:function read-char-no-hang)
     (:function terpri)
     (:function fresh-line)
     (:function unread-char)
     (:function write-char)
     (:function read-line)
     (:function write-string)
     (:function write-line)
     (:function read-sequence)
     (:function write-sequence)
     (:function file-length)
     (:function file-position)
     (:function file-string-length)
     (:function open)
     (:function stream-external-format)
     (:macro with-open-file)
     (:function close)
     (:macro with-open-stream)
     (:function listen)
     (:function clear-input)
     (:function finish-output)
     (:function force-output)
     (:function clear-output)
     (:function y-or-n-p)
     (:function yes-or-no-p)
     (:function make-synonym-stream)
     (:function synonym-stream-symbol)
     (:function broadcast-stream-streams)
     (:function make-broadcast-stream)
     (:function make-two-way-stream)
     (:function two-way-stream-input-stream)
     (:function two-way-stream-output-stream)
     (:function echo-stream-input-stream)
     (:function echo-stream-output-stream)
     (:function make-echo-stream)
     (:function concatenated-stream-streams)
     (:function make-concatenated-stream)
     (:function get-output-stream-string)
     (:function make-string-input-stream)
     (:function make-string-output-stream)
     (:macro with-input-from-string)
     (:macro with-output-to-string)
     (:variable *debug-io*)
     (:variable *error-output*)
     (:variable *query-io*)
     (:variable *standard-input*)
     (:variable *standard-output*)
     (:variable *trace-output*)
     (:variable *terminal-io*)
     (:condition-type stream-error)
     (:function stream-error-stream)
     (:condition-type end-of-file))
    ((22 "Printer")
     (:function copy-pprint-dispatch)
     (:macro formatter)
     (:function pprint-dispatch)
     (:local-macro pprint-exit-if-list-exhausted)
     (:function pprint-fill)
     (:function pprint-linear)
     (:function pprint-tabular)
     (:function pprint-indent)
     (:macro pprint-logical-block)
     (:function pprint-newline)
     (:local-macro pprint-pop)
     (:function pprint-tab)
     (:standard-generic-function  print-object)
     (:macro print-unreadable-object)
     (:function set-pprint-dispatch)
     (:function write)
     (:function prin1)
     (:function print)
     (:function pprint)
     (:function princ)
     (:function write-to-string)
     (:function prin1-to-string)
     (:function princ-to-string)
     (:variable *print-array*)
     (:variable *print-base*)
     (:variable *print-radix*)
     (:variable *print-case*)
     (:variable *print-circle*)
     (:variable *print-escape*)
     (:variable *print-gensym*)
     (:variable *print-level*)
     (:variable *print-length*)
     (:variable *print-lines*)
     (:variable *print-miser-width*)
     (:variable *print-pprint-dispatch*)
     (:variable *print-pretty*)
     (:variable *print-readably*)
     (:variable *print-right-margin*)
     (:condition-type print-not-readable)
     (:function print-not-readable-object)
     (:function format))
    ((23 "Reader")
     (:system-class readtable)
     (:function copy-readtable)
     (:function make-dispatch-macro-character)
     (:function read)
     (:function read-preserving-whitespace)
     (:function read-delimited-list)
     (:function read-from-string)
     (:accessor readtable-case)
     (:function readtablep)
     (:function set-dispatch-macro-character)
     (:function get-dispatch-macro-character)
     (:function set-macro-character)
     (:function get-macro-character)
     (:function set-syntax-from-char)
     (:macro with-standard-io-syntax)
     (:variable *read-base*)
     (:variable *read-default-float-format*)
     (:variable *read-eval*)
     (:variable *read-suppress*)
     (:variable *readtable*)
     (:condition-type reader-error))
    ((24 "System Construction")
     (:function compile-file)
     (:function compile-file-pathname)
     (:function load)
     (:macro with-compilation-unit)
     (:variable *features*)
     (:variable *compile-file-pathname*)
     (:variable *compile-file-truename*)
     (:variable *load-pathname*)
     (:variable *load-truename*)
     (:variable *compile-print*)
     (:variable *compile-verbose*)
     (:variable *load-print*)
     (:variable *load-verbose*)
     (:variable *modules*)
     (:function provide)
     (:function require))
    ((25 "Environment")
     (:function decode-universal-time)
     (:function encode-universal-time)
     (:function get-universal-time)
     (:function get-decoded-time)
     (:function sleep)
     (:function apropos)
     (:function apropos-list)
     (:function describe)
     (:standard-generic-function  describe-object)
     (:macro trace)
     (:macro untrace)
     (:macro step)
     (:macro time)
     (:constant-variable  internal-time-units-per-second)
     (:function get-internal-real-time)
     (:function get-internal-run-time)
     (:function disassemble)
     (:standard-generic-function documentation)
     (:standard-generic-function (setf documentation))
     (:function room)
     (:function ed)
     (:function inspect)
     (:function dribble)
     (:variable -)
     (:variable +)
     (:variable ++)
     (:variable +++)
     (:variable *)
     (:variable **)
     (:variable ***)
     (:variable /)
     (:variable //)
     (:variable ///)
     (:function lisp-implementation-type)
     (:function lisp-implementation-version)
     (:function short-site-name)
     (:function long-site-name)
     (:function machine-instance)
     (:function machine-type)
     (:function machine-version)
     (:function software-type)
     (:function software-version)
     (:function user-homedir-pathname))))
