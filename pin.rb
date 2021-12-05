=begin 
Alright, detective, one of our colleagues successfully observed our target person, Robby the robber. 
We followed him to a secret warehouse, where we assume to find all the stolen stuff. The door to this warehouse is secured by an electronic combination 
lock. Unfortunately our spy isn't sure about the PIN he saw, when Robby entered it.
The keypad has the following layout:
┌───┬───┬───┐
│ 1 │ 2 │ 3 │
├───┼───┼───┤
│ 4 │ 5 │ 6 │
├───┼───┼───┤
│ 7 │ 8 │ 9 │
└───┼───┼───┘
    │ 0 │
    └───┘
He noted the PIN 1357, but he also said, it is possible that each of the digits he saw could actually be another adjacent digit (horizontally or 
vertically, but not diagonally). E.g. instead of the 1 it could also be the 2 or 4. And instead of the 5 it could also be the 2, 4, 6 or 8.
He also mentioned, he knows this kind of locks. You can enter an unlimited amount of wrong PINs, they never finally lock the system or sound the alarm. 
That's why we can try out all possible (*) variations.
    * possible in sense of: the observed PIN itself and all variations considering the adjacent digits
Can you help us to find all those variations? It would be nice to have a function, that returns an array (or a list in Java/Kotlin and C#) 
of all variations for an observed PIN with a length of 1 to 8 digits. We could name the function getPINs (get_pins in python, GetPINs in C#). 
But please note that all PINs, the observed one and also the results, must be strings, because of potentially leading '0's. 
We already prepared some test cases for you.
Detective, we are counting on you!
=end

def get_pins(observed)
    i = 0
    template = ''
    observed.length.times do
        case observed[i]
        when "0"
            template << '[08]'
        when "1"
            template << '[124]'
        when "2"
            template << '[1235]'
        when "3"
            template << '[236]'
        when "4"
            template << '[1457]'
        when "5"
            template << '[24568]'
        when "6"
            template << '[3569]'
        when "7"
            template << '[478]'
        when "8"
            template << '[57890]'
        when "9"
            template << '[689]'
        end
        i += 1
    end
    out = []
    for i in (0..10**observed.length - 1)
        no = i.to_s.rjust(observed.length, '0')
        if no =~ /#{template}/
            out << no
        end
    end
    return out
end
get_pins('11')
