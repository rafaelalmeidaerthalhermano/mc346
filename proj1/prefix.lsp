;@author Rafael Almeida Erthal Hermano
;@ra     121286
;@since  2013-09

;-------------------------------------------------------------------------------
;Checks if the simbol is an operator
;
;@param symbol
(defun isOperator (symbol) (
    cond
    ((eq symbol '+) t)
    ((eq symbol '-) t)
    ((eq symbol '*) t)
    ((eq symbol '/) t)
    (t nil)
))

(defun leftTree (expression) (
    convertExpression (cdr expression)
))

(defun rightTree (expression) (
    convertExpression (cdr (convertExpression (cdr expression)))
))

;-------------------------------------------------------------------------------
;Converts a prefix expression into a infix expression
;
;@param expression infix expression
(defun convertExpression (expression) (
    cond
    ((numberp (car expression)) expression)
    ((isOperator (car expression)) (
        cond
        ((eq (leftTree expression) nil) nil)
        ((eq (rightTree expression) nil) nil)
        (t (
         cons
            (list
                (car (leftTree expression))
                (car expression)
                (car (rightTree expression))
            )
            (cdr (rightTree expression))
        ))
    ))
    (t nil)
))

;-------------------------------------------------------------------------------
;Converts a list of prefix expressions into a list of infix expressions
;
;@param expressions list of infix expressions
(defun validExpression (expression) (
    cond
    ((eq (cdr (convertExpression expression)) nil) (car (convertExpression expression)))
    (t nil)
))

(print (mapcar 'validExpression (read)))
