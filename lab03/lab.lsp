
;@author Rafael Almeida Erthal Hermano
;@ra     121286
;@since  2013-09

;Changes all ocurrences of x to y in l recursive
;
;@param x value to be changed
;@param y value to be replaced
;@param l list of elements to evaluated
(defun swap (x y l) (
    cond
    ((eq l nil)
        nil
    )
    ((listp (car l))
        (cons (swap x y (car l)) (swap x y (cdr l)))
    )
    ((eq (car l) x)
        (cons y (swap x y (cdr l)))
    )
    (t
        (cons (car l) (swap x y (cdr l)))
    )
))

;Applies the function f in all elements of l
;
;@param f function to be applied
;@param l list of elements do be executed
(defun myMap (f l) (
    cond
    ((eq l nil)
        nil
    )
    (t
        (cons (funcall f (car l)) (myMap f (cdr l)))
    )
))
