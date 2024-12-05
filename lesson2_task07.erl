-module(lesson2_task07).
-export([flatten/1]).

flatten(List) -> 
    lists:reverse(flatten(List, [])).

% Базовий випадок: якщо список порожній, повертаємо акумулятор.
flatten([], Acc) -> Acc;

% Якщо голова списку є списком, обробляємо її, а потім хвіст.
flatten([Head | Tail], Acc) when is_list(Head) -> 
    flatten(Tail, flatten(Head, Acc));

% Якщо голова не є списком, додаємо її до акумулятора.
flatten([Head | Tail], Acc) -> 
    flatten(Tail, [Head | Acc]).
