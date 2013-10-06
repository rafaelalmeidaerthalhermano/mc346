(*
 * ML SPECS
 *)

(* Strings and chars *)
"..."           -> string
#"C"            -> char
explode(string) -> [char]

(* Numeric types *)
~3              -> negative int
real(int)       -> real
floor(real)     -> int
ceil(real)      -> int
truncate(real)  -> int

(* Function *)
fun <name> <argument> = <exp>;

(* Lambda *)
fn <argument> => <exp>;

(* Pattern *)
fun  fact 0 = 1
    |fact n = n * fact(n-1)

fn   0 => 1
    |n => 0

(* Let *)

local fun iter (this:int, prev:int, count:int, n:int) =
    if count = n then this
    else iter (this+prev, this, count+1, 0)
in
    fun  fiblinear (0) = 0
        |fiblinear (n) = iter(1,0,1,n)

fun  fiblinear2 0 = 0
    |fiblinear2 n =
        let fun iter (this:int, prev:int, count:int) =
            if count = n then this
            else iter (this+prev, this, count+1)
        in iter (1,0,1) end;

(* Tuple *)
(<values>)
#N([values]) -> access N position in the tuple

fun recontruct (x,(y,z)) = ((x,y),z)
fn: 'a * ('a * 'a) => ('a * 'a) * 'a

fun first (x, _ ) = x;

fun foo (p as (x,y)) = (x,p)

(* List *)
[<values>]

1 :: list -> cons
hd list -> car
tl list -> cdr
null -> checks if is nil



fun mklist (m,n) =
    if m > n then []
    else m :: mklist(m+1,n);

fun append (a,b) =
    if null(a) then b
    else hd(a) :: append(tl a, b);

fun snoc (el, list) =
    if null(list) then [el]
    else hd(list) :: snoc(el, tl list);

fun snoc (el, []) = [el]
  | snoc (el, h::t) = h::snoc(x,t)

fun zip ([], []) = []
  | zip (h1::t1, h2::t2) = (h1::h2)::zip(t1, t2);

fun flatten [] = []
  | flatten ([]::t) = flatten(t)
  | flatten ((h::t)::tr) = h::(flatten(t2::t))


(* files, extenions .sml *)
fun <name> <parameter> = <expression>
(* ... *)
use "~/file.sml"






















































