open Deathrow.Generate

let names =
  select_sub_fields json ~first_field:"executed_inmates" ~second_field:"name"

let last_statements =
  select_sub_fields json ~first_field:"executed_inmates"
    ~second_field:"last_statement"

let dates =
  select_sub_fields json ~first_field:"executed_inmates" ~second_field:"date"

let () =
  let inmates_list = to_info (names, last_statements, dates) [] in
  let random_inmate = select_random_el inmates_list in

  Printf.printf "Name: %s\n" random_inmate.name;
  Printf.printf "Last Statement: %s\n" random_inmate.last_statement;
  Printf.printf "Date of Execution: %s\n" random_inmate.date
