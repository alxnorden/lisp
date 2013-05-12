;;;; -*- mode:lisp;coding:utf-8 -*-
;;;;**************************************************************************
;;;;FILE:               set.lisp
;;;;LANGUAGE:           Common-Lisp
;;;;SYSTEM:             Common-Lisp
;;;;USER-INTERFACE:     NONE
;;;;DESCRIPTION
;;;;    
;;;;    Defines an abstract SET class API.
;;;;    
;;;;AUTHORS
;;;;    <PJB> Pascal J. Bourguignon <pjb@informatimago.com>
;;;;MODIFICATIONS
;;;;    2013-05-08 <PJB> Created.
;;;;BUGS
;;;;LEGAL
;;;;    AGPL3
;;;;    
;;;;    Copyright Pascal J. Bourguignon 2013 - 2013
;;;;    
;;;;    This program is free software: you can redistribute it and/or modify
;;;;    it under the terms of the GNU Affero General Public License as published by
;;;;    the Free Software Foundation, either version 3 of the License, or
;;;;    (at your option) any later version.
;;;;    
;;;;    This program is distributed in the hope that it will be useful,
;;;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;;;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;;;    GNU Affero General Public License for more details.
;;;;    
;;;;    You should have received a copy of the GNU Affero General Public License
;;;;    along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;;;**************************************************************************

(in-package "COMMON-LISP-USER")
(defpackage "COM.INFORMATIMAGO.COMMON-LISP.CESARUM.SET"
  (:use "COMMON-LISP"
        "COM.INFORMATIMAGO.COMMON-LISP.CESARUM.SIMPLE-TEST"
        "COM.INFORMATIMAGO.COMMON-LISP.CESARUM.ARRAY"
        "COM.INFORMATIMAGO.COMMON-LISP.CESARUM.UTILITY")
  (:shadow "MERGE" "INTERSECTION" "UNION")
  (:shadow "INCLUDE")
  (:export
   "CONTAINS" "CARDINAL" "EMPTYP" "MINIMUM" "MAXIMUM"
   "COLLECTING-RESULT" "MAKE-COLLECTOR" "MAPELEMENTS" "THEREIS"
   "THEREIS1" "ALWAYS" "SET-EQUAL" "IS-SUBSET" "IS-STRICT-SUBSET"
   "INTENSION" "COPY" "UNION" "INTERSECTION" "DIFFERENCE"
   "SYMETRIC-DIFFERENCE" "INCLUDE" "EXCLUDE" "ASSIGN-EMPTY"
   "ASSIGN-SINGLETON" "ASSIGN" "MERGE" "INTERSECT" "SUBTRACT")
  (:documentation
   "

This package defines an abstract set class API.

License:

    AGPL3
    
    Copyright Pascal J. Bourguignon 2013 - 2013
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.
    
    You should have received a copy of the GNU Affero General Public License
    along with this program.
    If not, see <http://www.gnu.org/licenses/>
"))
(in-package "COM.INFORMATIMAGO.COMMON-LISP.CESARUM.SET")


;; The minimum implementation should define methods for: include
;; exclude contains cardinal select minimum maximum mapelements
;; make-collector.  But an efficient implementation will have to
;; implement specialization for the other generic functions too.


(defgeneric contains              (set element)
  (:method ((set sequence) element)
    (find element set)))

(defgeneric cardinal              (set)
  (:method ((set sequence))
    (length set)))

(defgeneric emptyp              (set)
  (:method (set)
    (zerop (cardinal set)))
  (:method ((set null))
    t)
  (:method ((set cons))
    nil))


(defgeneric select                (set)
  (:documentation "
PRE:    (not (emptyp SET))
RETURN: one element from the SET.
"))


;; When the elements are ordered:

(defgeneric minimum               (set)
    (:documentation "
PRE:    (not (emptyp SET))
RETURN: the smallest element of the SET.
"))

(defgeneric maximum               (set)
  (:documentation "
PRE:    (not (emptyp SET))
RETURN: the biggest element of the SET.
"))



;; result-type:
;;   empty-result: --> set
;;   include: set element -> set


(defgeneric make-collector        (result-type)
  (:method ((result-type (eql 'nil)))
    (declare (ignore result-type))
    (lambda (&optional set element)
      (declare (ignore set element))
      (values)))
  (:method ((result-type (eql 'list)))
    (declare (ignorable result-type))
    (lambda (&optional set (element nil add-element-p))
      (if add-element-p
          (cons element set)
          '())))
  (:method ((result-type (eql 'vector)))
    (declare (ignorable result-type))
    (lambda (&optional set (element nil add-element-p))
      (if add-element-p
          (progn
            (vector-push-extend element set (length set))
            set)
          (make-array 2 :element-type 'integer :adjustable t :fill-pointer 0)))))


#+emacs (put 'collecting-result 'lisp-indent-function 1)
(defmacro collecting-result ((collect-operator-name result-type) &body body)
  (let ((collector (gensym))
        (result    (gensym)))
    `(let* ((,collector (make-collector ,result-type))
            (,result (funcall ,collector)))
       (flet ((,collect-operator-name (element)
                (setf ,result (funcall ,collector ,result element))))
         ,@body)
       ,result)))


(defgeneric mapelements           (result-type mapper set)
  (:method (result-type mapper (elements sequence))
    (collecting-result (collect result-type)
      (map nil
           (lambda (element)
             (collect (funcall mapper element)))
           elements))))


(defgeneric thereis               (predicate set)
  (:method (predicate set)
    (mapelements nil (lambda (element)
                       (when (funcall predicate element)
                         (return-from thereis t)))
                 set)
    nil))


(defgeneric thereis1              (predicate set)
  (:method (predicate set)
    (let ((seen-one nil))
      (mapelements nil (lambda (element)
                         (when (funcall predicate element)
                           (if seen-one
                               (return-from thereis1)
                               (setf seen-one t))))
                   set)
      seen-one)))


(defgeneric always                (predicate set)
  (:method (predicate set)
    (mapelements nil (lambda (element)
                       (unless (funcall predicate element)
                         (return-from always nil)))
                 set)
    t))


(defgeneric set-equal             (set1 set2)
  (:method ((set1 list) (set2 list))
    (and (subsetp set1 set2)
         (subsetp set2 set1)))
  (:method (set1 set2)
    (and (is-subset set1 set2)
         (is-subset set2 set1))))


(defgeneric is-subset             (subset set)
  (:method (subset set)
    (and (<= (cardinal subset) (cardinal set))
         (always (curry (function contains) set) subset))))


(defgeneric is-strict-subset      (subset set)
  (:method (subset set)
    (and (< (cardinal subset) (cardinal set))
         (always (curry (function contains) set) subset))))



(defgeneric intension             (result-type predicate set)
  (:documentation "Return a new set containing only the elements of SET that have PREDICATE true.")
  (:method (result-type predicate set)
    (collecting-result (collect result-type)
      (mapelements nil (lambda (element)
                         (when (funcall predicate element)
                           (collect element)))
                   set))))


(defgeneric copy                  (result-type set)
  (:method (result-type set)
    (mapelements result-type 'identity set)))


(defgeneric union                 (result-type set1 set2)
  (:method (result-type set1 set2)
    (collecting-result (collect result-type)
      (mapelements nil (function collect) set1)
      (mapelements nil (function collect) set2))))


(defgeneric intersection          (result-type set1 set2)
  (:method (result-type set1 set2)
    (let* ((smallest-is-1  (< (cardinal set1) (cardinal set2)))
           (smallest (if smallest-is-1
                         set1
                         set2))
           (biggest (if smallest-is-1
                        set2
                        set1)))
      (intension result-type (curry (function contains) biggest) smallest))))


(defgeneric difference            (result-type set1 set2)
  (:method (result-type set1 set2)
    (intension result-type (complement (curry (function contains) set2)) set1)))


(defgeneric symetric-difference   (result-type set1 set2)
  (:method (result-type set1 set2)
    (union result-type
           (difference (class-of set1) set1 set2)
           (difference (class-of set2) set2 set1))))


;;; Mutation

(defgeneric include               (destination-set element)
  (:documentation "
POST:   (contains DESTINATION-SET ELEMENT)
RETURN: DESTINATION-SET
"))

(defgeneric exclude               (destination-set element)
    (:documentation "
POST:   (not (contains DESTINATION-SET ELEMENT))
RETURN: DESTINATION-SET
"))

(defgeneric assign-empty          (destination-set)
  (:documentation "
POST:   (emptyp DESTINATION-SET))
RETURN: DESTINATION-SET
")
  (:method (destination-set)
    (loop
      :until (emptyp destination-set)
      :do (exclude destination-set (select destination-set)))
    destination-set))

(defgeneric assign-singleton      (destination-set element)
  (:documentation "
POST:   (and (= 1 (cardinal DESTINATION-SET)) (contains DESTINATION-SET ELEMENT))
RETURN: DESTINATION-SET
")
  (:method (destination-set element)
    (assign-empty destination-set)
    (include destination-set element)
    destination-set))

(defgeneric assign                (destination-set source-set)
  (:documentation "
POST:   (and (set-equal DESTINATION-SET  SOURCE-SET)
             (set-equal (old SOURCE-SET) SOURCE-SET))
RETURN: DESTINATION-SET
")
  (:method (destination-set source-set)
    (assign-empty destination-set)
    (mapelements nil (lambda (element) (include destination-set element)) source-set)
    destination-set))

(defgeneric merge                 (destination-set source-set)
  (:documentation "
POST:   (and (is-subset SOURCE-SET DESTINATION-SET)
             (set-equal (old SOURCE-SET) SOURCE-SET))
RETURN: DESTINATION-SET
")
  (:method (destination-set source-set)
    (mapelements nil (curry (function include) destination-set) source-set)
    destination-set))

(defgeneric intersect             (destination-set source-set)
  (:documentation "
POST:   (and (set-equal DESTINATION-SET (intersection (old DESTINATION-SET) SOURCE-SET))
             (set-equal (old SOURCE-SET) SOURCE-SET))
RETURN: DESTINATION-SET
")
  (:method (destination-set source-set)
    (mapelements nil (lambda (element)
                       (unless (contains source-set element)
                         (exclude destination-set element)))
                 destination-set)
    destination-set))

(defgeneric subtract              (destination-set source-set)
  (:documentation "
POST:   (and (set-equal DESTINATION-SET (difference (old DESTINATION-SET) SOURCE-SET))
             (set-equal (old SOURCE-SET) SOURCE-SET))
RETURN: DESTINATION-SET
")
  (:method (destination-set source-set)
    (mapelements nil (curry (function exclude) destination-set) source-set)
    destination-set))



;;; I/O


;; Note: different set could be serialized differently.

(defgeneric read-set (set stream)
  (:documentation "
DO:      Accumulate in SET the elements read from the stream as a list.
RETURN:  SET.
")
  (:method (set stream)
    (assign-empty set)
    (when (peek-char (character "(") stream nil nil)
      (read-char stream)
      (do ()
          ((char= (peek-char t stream nil (character ")")) (character ")")))
        (include set (read stream))))
    (read-char stream)
    set))


(defgeneric write-set (set stream)
  (:documentation "
DO:     Writes to the stream the elements in SET as a list of elements.
RETURN: SET.
")
  (:method (set stream)
    (princ "(" stream)
    (let ((separator ""))
      (mapelements nil
                   (lambda (element)
                     (princ separator stream)
                     (princ element stream)
                     (setf separator " "))
                   set))
    (princ ")" stream)
    set))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; LIST-SET CLASS
;;;
;;; A simple implementation to test the default methods.
;;;

(defclass list-set ()
  ((elements :initform '() :initarg :elements :reader elements)))

(defmethod print-object ((set list-set) stream)
  (print-unreadable-object (set stream :type t :identity t)
    (prin1 (slot-value set 'elements) stream))
  set)

(defmethod include               ((destination-set list-set) element)
  (pushnew element (slot-value destination-set 'elements))
  destination-set)

(defmethod exclude               ((destination-set list-set) element)
  (setf  (slot-value destination-set 'elements) (delete element (slot-value destination-set 'elements)))
  destination-set)

(defmethod contains               ((set list-set) element)
  (not (not (member element (slot-value set 'elements)))))

(defmethod cardinal               ((set list-set))
  (length  (slot-value set 'elements)))

(defmethod select               ((set list-set))
  (if (slot-value set 'elements)
      (first (slot-value set 'elements))
      (values)))

(defmethod mapelements           (result-type mapper (set list-set))
  (collecting-result (collect result-type)
    (map nil
         (lambda (element)
           (collect (funcall mapper element)))
         (slot-value set 'elements))))

(defmethod make-collector        ((result-type (eql 'list-set)))
  (declare (ignorable result-type))
  (lambda (&optional set (element nil add-element-p))
    (if add-element-p
        (progn
          (pushnew element (slot-value set 'elements))
          set)
        (make-instance 'list-set))))

(defmethod minimum               ((set list-set))
  (when (every (function realp) (slot-value set 'elements))
    (reduce (function min) (slot-value set 'elements))))

(defmethod maximum               ((set list-set))
  (when (every (function realp) (slot-value set 'elements))
    (reduce (function max) (slot-value set 'elements))))


;;;-----------------------------------------------------------------------
;;; TESTS
;;;-----------------------------------------------------------------------

(defun test-sets (test-class)
  (list '() '(1) '(1 2 3)
        '#() '#(1) '#(1 2 3)
        (copy test-class '()) (copy test-class '(1)) (copy test-class '(1 2 3))))

(define-test test/all/nil ()
  (loop
    :for seq :in (test-sets 'list-set)
    :do
    (test eql (mapelements nil (function identity) seq) nil)
    (test set-equal (let ((result '()))
                      (mapelements nil (lambda (element) (push element result)) seq)
                      result)
          seq)))

(define-test test/mapelements (test-class)
  (loop
    :for set :in (test-sets test-class)
    :do (loop
          :for class :in (list 'list 'vector test-class)
          :do (test set-equal (mapelements class (function identity) set)
                    (ecase (cardinal set)
                      (0 '())
                      (1 '(1))
                      (3 '(1 2 3)))))))

(define-test test/copy (test-class)
  (loop
    :for (expected type original)
    :in (list (list nil        'nil       '(1 2 3 4))
              (list '(1 2 3 4) 'list      '(1 2 3 4))
              (list '(1 2 3 4) 'vector    '(1 2 3 4))
              (list '(1 2 3 4) test-class '(1 2 3 4)))
    :do
    (test set-equal               (copy type original)  expected (type original))
    (test set-equal (copy 'list   (copy type original)) expected (type original))
    (test set-equal (copy 'vector (copy type original)) expected (type original))))


(define-test test/is-subseq (test-class1 test-class2)
  (flet ((test-set1 (&rest elements)
           (copy test-class1 elements))
         (test-set2 (&rest elements)
           (copy test-class2 elements)))
    (assert-true (is-subset (test-set1)
                            (test-set2)))
    (assert-true (is-subset (test-set1 1)
                            (test-set2 1)))
    (assert-true (is-subset (test-set1 1 2 3)
                            (test-set2 1 2 3)))
    (assert-true (is-subset (test-set1 1 2 3  11 12 13)
                            (test-set2 11 12 13 1 2 3)))
    (assert-true (is-subset (test-set1)
                            (test-set2 1)))
    (assert-true (not (is-subset (test-set1 1)
                                 (test-set2))))
    (assert-true (not (is-subset (test-set1 1)
                                 (test-set2 2))))
    (assert-true (is-subset (test-set1 1 2 3)
                            (test-set2 1 2 3 4)))
    (assert-true (not (is-subset (test-set1 1 2 3 4)
                                 (test-set2 1 2 3))))))


(define-test test/set-equal (test-class)
  (flet ((test-set (&rest elements)
           (copy test-class elements)))
    (assert-true (set-equal (test-set)
                            (test-set)))
    (assert-true (set-equal (test-set 1)
                            (test-set 1)))
    (assert-true (set-equal (test-set 1 2 3)
                            (test-set 1 2 3)))
    (assert-true (set-equal (test-set 1 2 3  11 12 13)
                            (test-set 11 12 13 1 2 3)))
    (assert-true (not (set-equal (test-set)
                                 (test-set 1))))
    (assert-true (not (set-equal (test-set 1)
                                 (test-set))))
    (assert-true (not (set-equal (test-set 1)
                                 (test-set 2))))
    (assert-true (not (set-equal (test-set 1 2 3)
                                 (test-set 1 2 3 4))))
    (assert-true (not (set-equal (test-set 1 2 3 4)
                                 (test-set 1 2 3))))))


(define-test test/union (operator test-class)
  (flet ((test-set (&rest elements)
           (copy test-class elements))
         (test set-equal (funcall operator 
                                  (test-set 1 2 3 7 8 10 11 12)
                                  (test-set 1 2 3 7 8 10 11 12))
               (test-set 1 2 3 7 8 10 11 12))

         (test set-equal (funcall operator 
                                  (test-set)
                                  (test-set 1 2 3 7 8 10 11 12))
               (test-set 1 2 3 7 8 10 11 12))

         (test set-equal (funcall operator 
                                  (test-set 1 2 3 7 8 10 11 12)
                                  (test-set))
               (test-set 1 2 3 7 8 10 11 12))

         (test set-equal (funcall operator 
                                  (test-set 1 2 3 7 8 10 11 12)
                                  (test-set 0 4 5 6 9 10))
               (test-set 0 1 2 3 4 5 6 7 8 9 10 11 12))

         (test set-equal (funcall operator 
                                  (test-set 10 11 12)
                                  (test-set 1 2 3 7 8))
               (test-set 1 2 3 7 8 10 11 12))

         (test set-equal (funcall operator 
                                  (test-set 1 2 3 7 8)
                                  (test-set 10 11 12))
               (test-set 1 2 3 7 8 10 11 12))

         (test set-equal (funcall operator 
                                  (test-set 1 2 3 5 6 7)
                                  (test-set 3 4 5 7 8 9  12 13))
               (test-set 1 2 3 4 5 6 7 8 9 12 13))

         (test set-equal (funcall operator 
                                  (test-set 1 2 3 5 6 7  12 13)
                                  (test-set 3 4 5 7 8 9))
               (test-set 1 2 3 4 5 6 7 8 9 12 13))

         (test set-equal (funcall operator 
                                  (test-set 1 2 3  11 12 13)
                                  (test-set 3 4 5  13 14 15))
               (test-set 1 2 3 4 5 11 12 13 14 15))
         
         (test set-equal (funcall operator 
                                  (test-set 3 4 5  13 14 15)
                                  (test-set 1 2 3  11 12 13))
               (test-set 1 2 3 4 5 11 12 13 14 15)))))


(define-test test/intersection (operator test-class)
  (flet ((test-set (&rest elements)
           (copy test-class elements)))
    (test set-equal (funcall operator
                             (test-set 1 2 3 7 8 10 11 12)
                             (test-set 1 2 3 7 8 10 11 12))
          (test-set 1 2 3 7 8 10 11 12))

    (test set-equal (funcall operator
                             (test-set)
                             (test-set 1 2 3 7 8 10 11 12))
          (test-set))

    (test set-equal (funcall operator
                             (test-set 1 2 3 7 8 10 11 12)
                             (test-set))
          (test-set))

    (test set-equal (funcall operator
                             (test-set 1 2 3 7 8 10 11 12)
                             (test-set 0 4 5 6 9 10))
          (test-set 10))

    (test set-equal (funcall operator
                             (test-set 10 11 12)
                             (test-set 1 2 3 7 8))
          (test-set))

    (test set-equal (funcall operator
                             (test-set 1 2 3 7 8)
                             (test-set 10 11 12))
          (test-set))

    (test set-equal (funcall operator
                             (test-set 1 2 3 5 6 7)
                             (test-set 3 4 5 7 8 9  12 13))
          (test-set 3 5 7))

    (test set-equal (funcall operator
                             (test-set 1 2 3 5 6 7  12 13)
                             (test-set 3 4 5 7 8 9))
          (test-set 3 5 7))

    (test set-equal (funcall operator
                             (test-set 1 2 3  11 12 13)
                             (test-set 3 4 5  13 14 15))
          (test-set 3 13))
    
    (test set-equal (funcall operator
                             (test-set 3 4 5  13 14 15)
                             (test-set 1 2 3  11 12 13))
          (test-set 3 13))))



(define-test test/all/sequence (test-class)
  "All the tests working on LIST or VECTOR as sets."
  (test/is-subseq test-class test-class)
  (test/set-equal test-class)
  (test/copy        test-class)
  (test/mapelements test-class))

(define-test test/all/class (test-class)
  "All the tests working on set classes."
  (test/all/sequence test-class)
  (test/is-subseq test-class 'list)
  (test/is-subseq test-class 'vector)
  (test/is-subseq 'list   test-class)
  (test/is-subseq 'vector test-class)
  (test/union (function merge) test-class)
  (test/union (curry (function union) test-class) test-class)
  (test/union (curry (function union) 'vector) test-class)
  (test/intersection (function intersect) test-class)
  (test/intersection (curry (function intersection) test-class) test-class)
  (test/intersection (curry (function intersection) 'vector) test-class))

(define-test test/all ()
  "All the set tests."
  (test/all/nil)
  (test/all/sequence 'list)
  (test/all/sequence 'vector)
  (test/all/class    'list-set))

(test/all)

;;;; THE END ;;;;