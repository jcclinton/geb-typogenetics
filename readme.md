This is an Erlang implementation of the genetic typographic system from Godel, Escher, Bach.

This is a formal system whose input is some string of characters. The characters can be any genetic base (acgt). The goal is to replicate the input so that if you input some string [aattccgg] you get that two of that exact string as the output [aattccgg, aattccgg]. Since it is a formal system, the rules are precise. However, ultimately this is a system designed to explore the incompleteness theorem, so the rules can get hazy regarding edge cases. Can you just add more rules regarding edge cases? Yes, ad infinitum and it will still will never be able to accurately model a real genetic system.

purpose: this may seem like a strange system to program in Erlang. It doesn't involve routing, networking, etc and it is not a soft real time application. However it turned out to be a very natural fit because you could spawn off a process for each input string that you want to check. The gen\_server was a very natural fit for doing the actual rules processing as well since you could write each rule as an async request, which makes the structure simple and gives you a built-in abstraction.

(note: I will try to describe the rules of the system, but I will be distilling down about 4 pages from the book into one paragraph so it may not make sense if you have not read the book. In addition I do not have any of the helpful pictures from the book to show the concepts. If you haven't read the book...you are a programmer right?)
system description: initial input is some string of arbitrary length made up of the letters (acgt). The input string is broken up into tuples. Each tuple corresponds to an operation, since there are 4 letters, there are 15 operations plus nop. Additionally, each operation has a direction associated with it. If you start by pointing right, then sequentially move through each direction, you come to your final direction. The final direction can be right, left, up, down and each of these relates to one of the four input letters. The final direction is the bind point and determines where the operations will begin working on the string. The final data structure you have is [operations, bind\_point, initial\_string]. At this point, the operations are run in turn on the initial string and an output string is generated. The output string is compared against the input string to see if it satisfies the goal of replicating the input string.

structure: The application uses OTP design principles. It is a supervisor tree and the worker processes use generic servers.

Once the application is started, running genetic\_generator:start\_generator() begins creating all the permutations of [acgt] where the string length is less than 5. It then processes the string to produce the operations and the input string. It spawns a genetic\_operator worker for each string it produces.

genetic\_operator is a generic server that stores the input strand as state data and it fires async requests to itself for each operation that was produced by the input string.

genetic\_strand is the library containing all the rules processing for the 16 operations.

typo\_lib is a library containing all the input string processing to generate the operations and bind points.

tests: there are tests for every operation in tests\\genetic\_strand\_tests.erl. I do not believe this is the most efficient way to test this since I had to do a lot of hardcoding and there is a lot of redundant code. I will be working on improving this as I work more with Erlang.


note: This code is not very clean nor are the library modules well structured; but it works. I just wrote this for fun so I did not put any work into making it clean or production ready.
