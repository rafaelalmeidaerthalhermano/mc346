(*
 * Sudoku
 *
 * Rafael Almeida Erthal Hermano - 121286
 * MC346 - Paradigmas de Programação
 * Lab 2 de ML
 *)

exception NotFound;

fun read_sudoku([]) = []
| read_sudoku(h::t) = let
    fun option_to_string(NONE) = ""
    | option_to_string(SOME input) = input

    fun remove_espace([]) = []
    | remove_espace(h::t: char list) =
        if #" " = h orelse #"\n" = h then
            remove_espace(t)
        else
            h::remove_espace(t)

    fun char_to_int_list([]) = []
    | char_to_int_list(h::t) = (ord(h)-48)::char_to_int_list(t)
in
    char_to_int_list(remove_espace(explode(option_to_string(h))))::read_sudoku(t)
end

fun print_sudoku ([]) = []
| print_sudoku (h::t) = let

    fun print_sudoku_line([]) = []
    | print_sudoku_line(h::t) = let
        val dummy = print(Int.toString(h) ^ " ");
        val dummy = print_sudoku_line(t)
    in
        []
    end

    val dummy = print_sudoku_line(h);
    val dummy = print("\n");
    val dummy = print_sudoku(t);
in
    []
end

fun solve (su, ~1, _) = su
| solve (su, i, ~1) = solve(su, i - 1, 8)
| solve (su, i, j)  = let
    fun t ([]) = []
    | t ([]::_) = []
    | t r = (map hd r) :: (t (map tl r));

    fun into ([],_) = false
    | into (h::t, e) = (h = e) orelse into(t, e)

    fun cut ([], _) = []
    | cut (l, e) = List.nth(l, e)::List.nth(l, e + 1)::List.nth(l, e + 2)::[]

    fun flat ([]) = []
    | flat (h::t) = h @ flat(t)

    fun try (_, _, _, 10) = []
    | try (l, c, b, e) =
        if not (into(l, e)) andalso not (into(c, e)) andalso not (into(b, e)) then
            e::try (l, c, b, e+1)
        else
            try(l, c, b, e+1)

    fun add(e) = List.take(su, i) @ [List.take(List.nth(su, i), j) @ [e] @ List.drop(List.nth(su, i), j + 1)] @ List.drop(su, i + 1)

    fun iterate (su, []) = []
    |   iterate (su, h::t) = let
        val res = solve(add(h), i, j - 1);
    in
        if res <> [] then res else iterate(su, t)
    end
in
    if List.nth(List.nth(su, i), j) = 0 then
        iterate(su, try(List.nth(su, i), List.nth(t(su), j), flat(cut(t(cut(su, (i div 3) * 3)), (j div 3) * 3)), 1))
    else
        solve(su, i, j - 1)
end

structure sudoku =
struct
    fun main(prog_name , args ) = let
        val input = List.tabulate(9,(fn n => TextIO.inputLine TextIO.stdIn));
        val res = solve(read_sudoku(input), 8, 8);
        val out = print_sudoku(res);
    in
        0
    end;
end
