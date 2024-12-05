-module(lesson2_task09).
-export([pack/1]).

pack(List) -> pack(List, [], []).

% Базовий випадок: порожній список, повертаємо результат.
pack([], CurrentGroup, Result) -> 
    lists:reverse([CurrentGroup | Result]);

% Якщо поточний елемент дорівнює голові поточної групи, продовжуємо групувати.
pack([H | T], [H | _] = CurrentGroup, Result) -> 
    pack(T, [H | CurrentGroup], Result);

% Якщо поточний елемент не дорівнює голові поточної групи, додаємо групу до результату та починаємо нову групу.
pack([H | T], CurrentGroup, Result) -> 
    case CurrentGroup of
        [] -> pack(T, [H], Result); % Якщо поточна група порожня, не додаємо її до результату
        _ -> pack(T, [H], [CurrentGroup | Result]) % Якщо поточна група не порожня, додаємо її до результату
    end.
