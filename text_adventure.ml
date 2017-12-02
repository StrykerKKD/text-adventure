type answer =
  | Yes
  | No

type state_name = string

type state = {
  name: state_name;
  question: string;
  choices: (answer * state_name) list;
  isEnd: bool
}

module StringMap = Map.Make(String)

let state_register = StringMap.empty
                     |> StringMap.add "start" { 
                       name = "start"; 
                       question = "Are you ready for the game?"; 
                       choices = [(Yes,"end");(No,"start")]; 
                       isEnd = false 
                     }
                     |> StringMap.add "end" {
                       name = "end";
                       question = "This is the end! Do you want to try again?";
                       choices = [(Yes,"start");(No,"end")];
                       isEnd = true
                     }

let parse = function
  | "yes" -> Ok Yes
  | "no" -> Ok No
  | _ -> Error "Bad input!"