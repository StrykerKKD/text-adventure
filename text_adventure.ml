type answer =
  | Yes
  | No
  | Quit

type state_name = string

type state = {
  name: state_name;
  question: string;
  choices: (answer * state_name) list;
  isEnd: bool
}

let state_register = [
  ("start",{ 
      name = "start"; 
      question = "Are you ready for the game?"; 
      choices = [(Yes,"end");(No,"start")]; 
      isEnd = false 
    });
  ("end", {
      name = "end";
      question = "This is the end! Do you want to try again?";
      choices = [(Yes,"start");(No,"end")];
      isEnd = true
    })
]

let get_state state_name = 
  List.assoc state_name state_register

let get_next_state answer state = 
  let next_state_name = List.assoc answer state.choices in
  get_state next_state_name

let parse = function
  | "yes" -> Ok Yes
  | "no" -> Ok No
  | "quit" -> Ok Quit
  | _ -> Error "Bad input!"

let read () = read_line ()

let eval answer state = get_next_state answer state

let print_question state =
  Printf.printf "Question> %s\nAnswer> " state.question

let print_error message = 
  Printf.printf "Error: %s\n" message

let print_answer = function
  | Yes -> Printf.printf "Yes\n"
  | No -> Printf.printf "No\n"
  | Quit -> Printf.printf "Quit\n"

let rec loop state =
  print_question state;
  let input = read () in
  let parsed_input = parse input in
  match parsed_input with
  | Ok Quit -> 
    print_answer Quit;
    state
  | Error message -> 
    print_error message; 
    loop state
  | Ok answer ->
    print_answer answer; 
    eval answer state |> loop

let _ = 
  get_state "start" |> loop