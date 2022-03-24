let json = Yojson.Basic.from_file "inmates.json"

type info = {
  name : string;
  last_statement : string;
  date : string;
}

let select_sub_fields file ~first_field ~second_field =
  let open Yojson.Basic.Util in
  let field_list = file |> member first_field |> to_list in

  List.map (fun el -> member second_field el |> to_string) field_list

let select_random_el lst =
  Random.self_init ();
  let n = Random.int (List.length lst) in

  List.nth lst n

let rec to_info (nl, sl, dl) acc =
  match (nl, sl, dl) with
  | [], [], [] -> acc
  | name_h :: name_t, st_h :: st_t, date_h :: date_t ->
    let profile = { name = name_h; last_statement = st_h; date = date_h } in

    to_info (name_t, st_t, date_t) (profile :: acc)
  | _ -> failwith "Invalid Json"
