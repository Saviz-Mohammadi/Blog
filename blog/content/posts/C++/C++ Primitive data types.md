---
title: "C++ basics part 02 - Data types"
date: 2023-05-12T14:06:22-07:00
draft: true

weight: 2
---



<br>
<br>
<br>



### Introduction



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<p>
If I present a mathematical question, such as "What is 2 multiplied by 2?" on a piece of paper to a human being, they will likely respond with the correct answer, which is 4. Humans understand that numbers possess specific operations that can be performed on them. However, if I were to ask the question, "What is yellow multiplied by brown?" they would likely find it strange. This is because I am attempting to multiply two sets of colors, which is not a valid operation. We encounter these problems and find solutions in our daily lives without always realizing or caring about it.
</p>



<br>



<p>
The situation differs when it comes to computers. While computers can execute instructions rapidly, they lack the same level of capability and flexibility as humans. We have previously discussed variables and how they allow us to direct the computer to store and manipulate information. Yet, we have not explored how we specify the type of information a variable can hold. Equally important is determining the set of actions that the computer can perform on that information. In this discussion, we will first delve into the reasons for the existence of data types and then explore primitive data types in greater detail in the C++ programming language.
</p>



<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->










### Bytes & Bits



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<p>
While this section is often overlooked and not covered in most tutorials, it is essential to explain these concepts as they can improve our understanding of upcoming topics. Until now, we obtained that variables allow us to direct the computer to allocate memory space for manipulating data. However, gaining insight into how the computer stores, manages, and understands information will greatly aid our understanding of the reason behind having data types. 
</p>



<br>


<code><h3>SCENARIO:</h3></code>

<p>
Let's take a moment to envision a game scenario. In this game, two individuals are involved. The first person, referred to as person A, is locked in a room equipped with a switch. This room is completely isolated, making it impossible to hear any sounds from outside, and there are no windows for someone outside the room to observe person A. Person A holds a piece of paper displaying a specific color, let's say yellow, in this case. In addition, there are several LEDs located in the room each representing a unique color when switched on.
</p>



<br>



<p>
The second person, known as person B, is situated in another room with a light bulb, which can be controlled by the switches accessible to person A. Furthermore, person B has a set of switches at their disposal, which allows them to activate the LEDs located in person A's room. The objective of the game is for both individuals to establish a means of communication, enabling person B to determine the color displayed on the paper held by person A. What makes this interesting, is that the sole element capable of facilitating communication between the two participants is a light bulb, which can exist in only two states at any given time: on or off.
</p>



<br>


<code><h3>SOLUTION:</h3></code>

<p>
Now, how can we establish communication with the other person? Since a light bulb can only be in two states, either on or off, it can be quite challenging to devise a solution for communication. One possible approach is to associate each of these two states with a potential answer. For instance, we can determine that turning the light on signifies "yes," while switching it off indicates "no." This is a step in the right direction! With this technique, person B can toggle each individual LED on and off, and person A can confirm whether the LED that was toggled corresponds to the correct color by switching the light bulb on or off accordingly.
</p>



<br>



<p>
While the previous solution is effective, it poses challenges when dealing with a large number of LEDs, like 100, each representing a different color. It would become tedious to respond with a simple "yes" or "no" for each LED being turned on or off. In such a scenario, an alternative solution could involve implementing a deciphering system where consecutive toggles of the light bulb correspond to specific words or letters. For example, we could create a code where quickly turning the light bulb on and off six times indicates the letter "p." By using this method, we can generate codes for all letters and communicate the name of the color by applying the appropriate code. We can even have a combiniation of long and short flicks.
</p>



<br>



<p>
What we have effectively done at this stage is commonly refered to as Morse code. Morse code is a system of communication where each letter of the alphabet, as well as numbers and some special characters, is represented by a unique sequence of short and long signals. A short signal is called a "dot," and a long signal is called a "dash." The dots and dashes are combined to form the codes for different characters. By combining the characters achieved from Morse code we can create meaningful sentences. Of course you are not required to memorize any of this, but it will help understand the concept of how computers handle information.
</p>



<br>



<code><h3>COMPUTERS:</h3></code>

<p>
Now that we have a grasp of how to approach communication with an entity that has only two states, let's apply this understanding to understand how computer systems function. A computer comprises millions, if not billions, of components called transistors. Transistors, short for "transfer resistance," are used to regulate the flow of voltage within an electronic device. They are responsible for generating the binary 0s and 1s (bits) that computers utilize for communication and Boolean logic. In small quantities, transistors function as basic electronic switches. However, when employed in large numbers, they form microprocessors. 
</p>



<br>



<p>
The reason computers use a binary number system is due to the nature of these components, or transistors, that constitute the computer. A transistor can only possess two states at any given time: 0 for false and 1 for true. However, it is important to clarify a source of confusion within the industry. While we often say that 0 represents false and 1 represents true, it does not necessarily mean that 0 indicates the absence of voltage entirely. In reality, the value of 0 refers to a range of voltages significantly lower than the range for 1. For instance, if a voltage amount of +1.0v represents 1, then +0.5v could represent 0.
</p>



<br>



<code><h3>INFORMATION IN BINARY:</h3></code>

<p>
Computers operate using the binary language, it is the foundation of computer communication. The ultimate challenge is enabling computers to understand and comprehend a wide range of information. How do we convert a human-readable decimal number like 157 into binary format? How do we translate logical concepts, such as "do" or "do not", in binary? And what about encoding characters or even images into binary form? Let's delve into the process of representing various types of data within the binary number system.
</p>



<br>



<p>
To understand the binary number system, we should start by revisiting the commonly used decimal-based number system that we as humans employ. In the decimal system, we have a total of ten digits ranging from 0 to 9. If we only consider the number of elements, we can represent a maximum of nine elements. However, when we combine these digits in specific ways, we can easily represent larger quantities. For instance, combining the digits of 1 and 0 gives us the number 10, which represents ten elements. Similarly, combining 3 and 2 gives us 32, representing 32 individual elements.
</p>



<br>



<p>
In the decimal-based system, the position of a number determines its worth. In the previous example, 32 represents three sets of ten elements and two individual ones. This pattern is known as a weighted pattern, where each number's position carries a weighted value that determines its significance. For example, in the number 879, the digit 8 has a weight of 100, indicating that each number in this position is multiplied by 100. The worth of each position is deterimned by the total number of digits available, in this case 10, multiplied by itself each time the position increases.
</p>



<br>



<p>
This concept applies to almost every other number system known to humankind such as hexidecimal, octal, and binary system. In the binary system, the only difference is that we have fewer digits to work with. Instead of ten digits, we only have 0 and 1. Therefore, each position in the binary number system increases by multiples of 2, as opposed to 10 in the decimal system. Here's an example of how to convert decimal numbers to binary:
</p>



<br>



<p>
The individual 0s and 1s are more than enough to accomodate conditional values where we need to decide weather something is true and should happen or not and should not happen (boolean). And numbers in the decimal base format (97, 122, ...) can also be easilly converted to the binary system. However, what about other types of information like characters?
</p>



<br>



<p>
Similar to human language, where individual letters hold limited significance, binary becomes truly valuable when we combine multiple sets of 0s and 1s. 
</p>

<br>


<p>
Wonderful! until now we have obtained a way to represent logic, and numbers in binary. But, what about more complex things such as text or characters or images? How do we represnt them in the binary system? Let's ask a fundemental question, in the English alhpabet there are 26 characters. If we were to use the same strategy of assigning as many combiniations of bits to represent these characters, we would end up needing at least 5 bits since two to the power of 5 gives us 32 possibiliets. However, what about the uppercaes possibilties? Or even numbers (1, 2, 3, ..., 9), punctuation marks, control characters, and some special characters? We would need a lot more bits to accomodate all of them. The exact number of bits required is 8 which allows us to do a combination of 256 characters. This standard is commonly known as the ASCII table (American Standard Code for Information Interchange) where each character in the table is given a unique number that allows us to identify the character. This special number is associated and converted into binary  for the computer to understand and represent.
</p>


If everyhing from Text, to characters, images and numbers get evolved into binary number system, which is essentially a bunch of 0s and 1s, then how does the computer know about what it is dealing with? I mean... how does it deterimen the data type if it only sees numbers?
ChatGPT
Great question! In a computer system, data types are typically determined by the context in which the data is used and by the way the program or operating system interprets that data. While everything is ultimately represented as binary numbers in a computer's memory, the computer uses different conventions and algorithms to interpret and handle different types of data.

Here are a few ways computers determine the data type:

Data declarations: When a programmer writes a computer program, they define variables with specific data types. For example, they might declare a variable as an integer, a floating-point number, a string, or a Boolean value. These declarations provide information to the computer about how to interpret and handle the data.

File formats: Different file formats have specific structures and conventions for representing data. For example, an image file may use a particular format like JPEG or PNG, which includes header information indicating the image dimensions, color depth, and other relevant details. When a computer reads a file, it looks at this format-specific information to determine the data type and how to interpret it.

Metadata: In some cases, data is accompanied by metadata—additional information that describes the characteristics and structure of the data. For example, a database may have schema definitions that specify the data types of various fields. Similarly, multimedia files often contain metadata tags that provide information about the content, such as the artist, album, or duration of a song.

Parsing and interpretation: When a computer program processes data, it typically follows predefined algorithms or rules for parsing and interpreting the data. For example, if a program encounters a sequence of 0s and 1s, it might interpret that sequence as an ASCII-encoded character, a numerical value, or part of an instruction depending on the context.

By combining these techniques and relying on the program's logic, computers can determine the data type based on the information available to them. The interpretation of binary data is ultimately driven by the software and algorithms that process it, making use of contextual cues, predefined rules, and metadata when available.





User
You mentioned a set of rules that help with interpretation. How do these rules work? I mean... how can you apply a rule to a bunch of numbers if the rule itself is a number?
ChatGPT

2 / 2

The rules I mentioned are not just numbers themselves; they are algorithms or procedures that are implemented in software. These algorithms define a set of operations or steps that a computer program follows to interpret and manipulate data.

While computers ultimately work with binary numbers, the rules or algorithms are designed to operate on patterns of binary numbers that represent specific data types. The computer program applies these rules to the binary data based on the expected structure and conventions associated with that data type.

Let's take an example to illustrate this. Consider the ASCII encoding system, which represents characters using 7-bit binary numbers. In ASCII, each character is assigned a unique binary code. The computer program that deals with text might have an algorithm that interprets a sequence of 7-bit binary numbers as ASCII characters. It follows the steps specified in the algorithm to convert the binary representation into the corresponding character.

Similarly, for other data types like integers, floating-point numbers, or images, there are specific algorithms designed to interpret the binary patterns correctly. These algorithms take into account the expected structure, byte order, and conventions associated with each data type.

The rules or algorithms are implemented as part of the programming language, libraries, or operating system. Programmers can leverage these predefined rules to work with different data types without having to manually interpret raw binary data themselves.

In summary, the rules or algorithms used by computers to interpret binary data are implemented as software instructions. They define the steps and logic required to correctly interpret and manipulate the binary numbers based on the expected structure and conventions associated with each data type.





User
I get it that we can use some conventions such as the ASCII or number systems to interprate and use data. But, my main question is how does the computer even know in the first place if it is dealing with a scenario of characters instead of numbers if all that it sees is binary numbers?
ChatGPT
Apologies for any confusion caused. Allow me to clarify further.

In a computer system, the determination of whether data represents characters or numbers is primarily based on how the data is used and interpreted by the software. While the computer itself does not inherently "know" the specific data type, the software provides the necessary context and instructions for the interpretation.

When a program is written, the programmer specifies how the data should be treated, including its intended data type. For example, if the programmer wants to work with characters, they may declare a variable as a character type in the code. By providing this information, the programmer is essentially telling the computer how to handle and interpret the data.

During program execution, the computer follows the instructions provided by the programmer and applies the appropriate operations and algorithms based on the declared data types. For instance, if a particular instruction is meant for character manipulation, the computer will perform operations specifically designed for characters, such as comparing characters, concatenating strings, or printing textual output.

It's important to understand that the computer's ability to work with different data types is ultimately governed by the software and the algorithms implemented within it. The software provides the rules and instructions for the computer to process the binary data in a meaningful way according to the intended data types specified by the programmer.

In summary, the computer doesn't inherently "know" the data type, but it relies on the software and the instructions given by the programmer to interpret and handle the binary data appropriately. By providing explicit declarations and using algorithms designed for specific data types, the computer can differentiate between characters and numbers, enabling the execution of appropriate operations for each type.





User
But, I mean... all I write is data type in a code editor. But, how does the computer actually see a binary number and goes ... hmm that is a character?
ChatGPT
I apologize for any confusion caused. Let me provide a more detailed explanation.

At the lowest level, computers represent all data, including characters and numbers, as binary numbers—sequences of 0s and 1s. These binary numbers are stored in the computer's memory and processed by its circuits.

When you write code and specify a data type, such as a character or a number, you are essentially providing instructions to the compiler or interpreter, which is a program that translates your code into machine instructions that the computer can understand and execute.

During the compilation or interpretation process, the compiler or interpreter uses the provided data types to generate the appropriate machine code instructions. These instructions include information about how to interpret and handle the binary data stored in memory.

For example, when you declare a variable as a character type in your code, the compiler or interpreter generates machine code instructions that treat the corresponding memory location as a character. It may apply specific character encoding schemes like ASCII or Unicode to interpret the binary values stored in that memory location as characters.

When the program is executed, the computer's processor follows these machine code instructions and performs operations based on the data type information embedded in those instructions. It uses the provided rules and algorithms to manipulate the binary data in a manner appropriate for the specified data type.

So, while you don't see the computer explicitly identifying binary data as a character, the instructions generated during the compilation or interpretation process include the necessary information to interpret and handle the binary data correctly based on the specified data types.

In essence, the computer's ability to recognize the data type is a result of the compilation or interpretation process, where the provided data types are used to generate machine code instructions that guide the computer in interpreting and manipulating the binary data appropriately.





User
I mean... does every block of data in computer have another block attached to it in binary that represents it's data? I mean... let's say that I specify "char" data type, does that mean that beside the actual binary numbers that represent the data itself there is another bolck that says what  data it is in binary?
ChatGPT
No, there isn't an additional block attached to each block of binary data that explicitly states its data type. The data type information is not stored separately in binary form within the computer's memory.

The data type information is primarily used and understood by the software and the programming language/compiler/interpreter that processes the code. It is used during the compilation or interpretation phase to generate appropriate machine code instructions.

When you specify a data type like "char" in your code, it informs the compiler or interpreter how to treat and interpret the corresponding memory location where the character data is stored. The compiler or interpreter generates machine code instructions that manipulate the binary data in a manner consistent with the specified data type.

During the execution of the program, the computer's processor works with the binary data stored in memory according to the instructions generated by the compiler or interpreter. It doesn't require an explicit additional block to identify the data type because the instructions themselves indicate how to interpret the data.

To summarize, the data type information is used during the compilation or interpretation process to generate machine code instructions that handle the binary data appropriately. The data type itself is not stored separately as another block of binary data alongside the actual data in the computer's memory.





User
I mean... since everything is binary numbers, how does the computer even go about understanding what data type it is dealing with? I mean... what is there to stop it from thinking that a character is a number? What's more is how do instructions such as "char" or "int" get intrepreted? What do they interprent to?
ChatGPT
I apologize for any confusion caused. Let me explain in more detail how the computer understands and interprets data types.

At the hardware level, a computer processes data as binary numbers, and it doesn't inherently "know" the data type of a specific sequence of binary digits. The interpretation of data types is facilitated by the software layers, including the programming language and the underlying system libraries.

When you write code and specify a data type, such as "char" or "int," you are using a programming language that provides a set of rules and conventions for interpreting and manipulating different data types. These rules are predefined and implemented in the programming language and its associated libraries.

During the compilation or interpretation process, the compiler or interpreter recognizes the data type keywords you have used, such as "char" or "int." It maps these keywords to the corresponding data type definitions and associated operations defined in the language and libraries.

For example, when you declare a variable as a "char" type, the compiler or interpreter understands that you intend to work with character data. It allocates a specific amount of memory to store the character and associates the appropriate rules for manipulating characters based on the programming language specifications.

Similarly, when you declare a variable as an "int" type, the compiler or interpreter understands that you intend to work with integer numeric data. It allocates memory to store integers and associates the appropriate rules for arithmetic operations, comparisons, and other relevant operations related to integers.

The rules and conventions associated with each data type are built into the programming language and the underlying system libraries. They define how the computer should interpret and handle the binary data based on the specified data type. These rules provide the necessary context for the computer to distinguish between different data types during execution.

In summary, the computer's understanding of data types is facilitated by the programming language, its associated libraries, and the rules defined within them. The compiler or interpreter maps the data type keywords used in the code to the corresponding rules and operations defined for each data type. This allows the computer to correctly interpret and manipulate binary data according to the specified data type during program execution.





User
I mean... what is there to stop the computer from applying arithmetic to an incorrect type such as char if everything is seen and treated as binary numbers?
ChatGPT
That's a valid question. In many low-level programming languages, such as C or C++, the computer doesn't have built-in safeguards to prevent certain operations from being applied to incompatible data types. It is indeed possible to perform arithmetic operations on data types that may not be intended for arithmetic, such as performing arithmetic on a character.

In such cases, the behavior can be undefined or produce unexpected results. The reason for this is that these languages provide a high degree of flexibility and direct access to memory, allowing you to perform operations that may not be semantically correct.

However, higher-level programming languages and modern programming paradigms often incorporate type-checking mechanisms and runtime environments that help prevent or handle such issues. These languages include Java, Python, C#, and many others.

In these languages, the compiler or interpreter enforces stricter type-checking, ensuring that operations are only applied to compatible data types. If you try to perform arithmetic operations on a character type, for example, the compiler or interpreter would raise a type error or warning during the compilation or interpretation phase.

Additionally, modern programming languages often include type systems that provide static type checking, dynamic type checking, or a combination of both. These systems help catch type-related errors and ensure type safety during program execution.

So, while it is possible for the computer to perform operations on incompatible data types at a low level, modern programming languages and type systems aim to prevent such issues through various mechanisms, providing better type safety and reducing the likelihood of unintended operations being applied to incorrect data types.





User
So, are you saying that it is the code and libarries that others wrote that prevents this from happening? But, what about the compiler? I mean that thing must be really low-level so how does that understand the situation?
ChatGPT
Yes, you're correct. The prevention of applying operations to incompatible data types is primarily facilitated by the combination of the programming language, libraries, and the compiler.

The compiler plays a crucial role in understanding the code and enforcing type checking during the compilation process. It analyzes the code, including the type declarations and operations, and verifies their compatibility according to the language rules and standards.

During the compilation phase, the compiler performs static type checking. It checks that the operations you perform on variables and expressions are consistent with their declared types. If it detects any type mismatches or incompatible operations, it raises compilation errors or warnings.

The compiler utilizes the language's grammar, syntax rules, and type system to understand the code and ensure type safety. It interprets the type declarations, such as "char" or "int," and associates the appropriate rules and behaviors for each data type. This allows it to detect type-related issues and prevent operations that are not supported or expected for a particular data type.

The compiler is built to understand the language's semantics, including the rules for type compatibility and operation applicability. It leverages this understanding to generate machine code instructions that handle the data correctly and efficiently based on the specified data types.

Therefore, it is a combination of the programming language, libraries, and the compiler working together that prevents the application of incompatible operations to data types and helps ensure type safety in the compiled program.
<p>
At a fundemental level, this is how the computer manages to handle different types of information, by either directly converting their number system and converting it to binary or associating a certain numberr. At the end of the day, whatever piece of information you give to the computer, it will be able to convert it enidabley down to a number. So, here is the fundemantal question. If everything is a number, then how can we ensure that someth informtion needs to be treated and observed differently from others, meaning that they should have different sets of operations and different meaning to them? The answer is by using data types.
</p>
<br>
<br>
We can imagine the on state of a light as saying yes. and teh off state as no. THis way we have the ability to to answer a lot of questions such as am I on teh right track or not. But, the issue with this approach is that it is very tidious as we have to ask a lot of questions and break them down into yes or no qusetions. If we want to do anything slightly more complicated we probably need to come up with combinitions that can represent more complex answers. Me and my team mate can agree on a set of rules and contracts that we can use to create more complex answers and questions, such as turn on and off quickly 2 times to say "what does that mean". or one long on and off to say "let me see".



The binary language is limited in teh number of resources (digits) it can provide to us for representing different entities. You can use as many zeros and ones as you like the only qeustion is at what cost?


THis type of communication is actually refered to as Morse code and was used in the military for communication.

if you look at a character it is not exactly useful as it has no meannig, it is rather the combination of letters together that give the text some meaning.


How does this translate into the computer language? Computers are made of millions of chipsets called "transistors" that can have two different voltage values at a time. This can be either 0.5 or 1. each of these respond to the on and off state. A common source of confusion when it comes to this topic is that most peopel imagine that a computer has a voltage of 0 when it is off, but this is not true after all a computer needs a current and electrcity to function. Saying a voltage of zero means that the computer is literally off! If each of these states represent a yes and no, then the change of these states over time can represent a more complex message.

Another question that we get asskeedd all teh time is why binary? why not base 10 or something else? it is because of the fact that binary system and the two states on and off are very compatible with a chipset that can be only switched on and off as that is the nature of electronic devices. A voltage can only be flowing or not flowing in a wire.

The word binary actually means being composed of 2 things (like a switch)


One of the reasons as to why hexidecimal is so important when dealing with computers and why they are used to represent memory instead of binary is because they are much easier to work with in comparison to long and huge binary numbers.


Now let's talk about how to interact with information that is not a numebr such as text.


It is within the nature of a computer to use two states and therfore binary. Electricity can either be flowing or not flowing like a switch and guess what! a computer is made of components that use electrictity. We humans have 10 fingers it is within our nature to use decimal. Each position is increasing by a value wich is the power of your base that represents the number of posibilities 10 to the power of 0 and 1 and 2 and... 
</p>



<br>
<br>



```C++
main(int argc, char* argv[])
{
	signed   int number1 = -100;
	unsigned int number2 = 100;
	
	std::cout << "This is the signed number: "   << "number1 = " << number1 << "/n";
	std::cout << "This is the unsigned number: " << "number2 = " << number2 << std::endl;
	
	std::cin; // To insure that the command prompt does not close immediately in some IDEs.
	
	return (0);
}
```



<br>
<br>



<p>
Due to the way in which a signed number is saved in memory, the maximum number that we are able to store in a unsigned number increases, because we no longer need to accomodate negative numbers and therfore, we can use those bits to hold larger positive numbers.
</p>



<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Bytes & Bits</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->


### Why have data types?



<!-- ############################################# Separator - Top ############################################# -->

<div class="line-divider-top">
  <div class="left-div"></div>
  <span></span>
  <span class="middle"></span>
  <span></span>
  <div class="right-div"></div>
</div>

<!-- ############################################# Separator - Top ############################################# -->



<p>
In computer programming, a data type plays a crucial role as it defines and specifies the nature of information that a variable or expression can store and manipulate. However, one might question the reason of having numerous data types. Why not just have a single type called "data" that encompasses everything? At first glance, the idea of having a single data type appears appealing as it simplifies the programming task. Nevertheless, adopting a single type is impractical due to several reasons:
</p>



<br>
<br>
<br>



<ul class="justified-list">
<li><strong>Determine operations</strong></li>
</ul>



<p>
By defining a specific data type, we enable the compiler to identify and understand the range of operations that can be applied to that particular piece of information. For instance, if we designate our data as numeric, the compiler recognizes that arithmetic operations like addition, subtraction, division, and multiplication can be performed on it. This knowledge hepls the compiler in optimizing the execution of these operations as well as ensuring that the data is appropriately tailored for such computations.
</p>



<br>



<ul class="justified-list">
<li><strong>Type safety</strong></li>
</ul>



<p>
Employing a single data type for all values would introduce challenges in maintaining type safety within a program. Type safety is crucial as it safeguards against errors that may arise when data is utilized in unintended ways. Consider the scenario where our information is of type text. In this case, the acceptable set of operations differs from that of numerical data types. Attempting arithmetic operations, such as division, on text would be invalid and can be prevented by the compiler.
</p>



<br>



<ul class="justified-list">
<li><strong>Memory size</strong></li>
</ul>



<p>
Utilizing a single data type would result in excessive memory usage, leading to inefficiency. For instance, if the requirement is to store small number values, it is more efficient to employ a data type that occupies less memory compared to a generic type capable of storing any data. This optimized memory allocation ensures efficient utilization of resources and prevents unnecessary memory consumption. 
</p>



<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <div class="right-div"></div>
</div>

<!-- ############################################# Separator - Bottom ############################################# -->










### Primitive types



<!-- ############################################# Separator - Top ############################################# -->

<div class="line-divider-top">
  <div class="left-div"></div>
  <span></span>
  <span class="middle"></span>
  <span></span>
  <div class="right-div"></div>
</div>

<!-- ############################################# Separator - Top ############################################# -->



<p>
In programming languages, including C++, a primitive data type, also known as a built-in or fundamental type, represents a basic information type provided by the language itself. These types are commonly used to represent simple data values like numbers and characters. Primitive types are directly supported by the language implementation. They have fixed sizes and predefined behaviors, enabling efficient storage and optimized operations. Primitive types often have built-in operations for arithmetic, logical operations, and comparisons, and they are typically supported by the underlying hardware. In C++, some examples of primitive data types include the following:
</p>



<br>
<br>



| Type    | Description                                           |
|---------|-------------------------------------------------------|
| `int`   | Short for "integer". Used to represent whole numbers without decimal points. |
| `float`| Short for "floating-point". Used to represent decimal numbers with precision points.|
| `char`  | Short for "character". Used to represent a single character. |
| `bool`  | Short for "boolean". Used to represent a logical value that can be either `true` or `false` |



<br>
<br>



<p>
Each of these primitive data types provides a specific meaning to our data. They not only suggest their potential usage but also define their capacity in terms of the size of data they can store and the set of operations they can perform on that data. These characteristics enable the compiler to accurately determine the memory requirements for each type and apply optimization techniques to enhance the efficiency of logical operations associated with that data type. To demonstrate this concept, let's examine the following code snippet and see how the data type helps us to understand the purpose of the variable in completing the functionality:
</p>



<br>
<br>



```C++
main(int argc, char* argv[])
{
	bool isConnected = true;
	
	if(isConnected)
	{
		// ...
		// Perform task.
		// ...
	}
	
	return (0);
}
```



<br>
<br>



<p>
The provided code indicates that the variable "isConnected" is intended to hold a boolean value. This implies that the variable will be utilized as a condition to determine whether a specific code segment will be executed or not based on its stored value. As a boolean type only requires a minimal amount of memory, the compiler can allocate a small memory space to store the "true" or "false" value. In this particular case, since the boolean variable holds the value "true," it signifies that the associated code segment is permitted to execute given the specified conditions.
</p>



<br>
<br>



<code><h3>IMPORTANT NOTE:</h3></code>

<P>
There are specific reasons why types have shorter names like "int" instead of "integer." The adoption of the term "int" in C++ rather than its complete form "integer" can be attributed to historical factors. C++ originated from the C programming language, which was created in the early 1970s. C was developed with a primary emphasis on efficiency and performance. During that era of computing, memory and storage were scarce resources, and every byte counted. Therefore, the creators of C made deliberate design decisions to optimize for efficiency.
</p>



<br>



<p>
One of the design choices made in the C programming language was to introduce concise and hardware-compatible basic data types. These types were specifically implemented to closely align with the capabilities of the underlying hardware. The objective was to provide a minimal set of types that efficiently represented the most commonly used data in programs. By opting for abbreviated forms like "int" instead of the full word "integer," the intention was to save space and reduce the amount of typing required. This decision required striking a balance between brevity and expressiveness. As C++ evolved, it maintained compatibility with its predecessor, C, and inherited many of its design decisions.
</p>



<br>
<br>


| Type    | Description                                           |
|---------|-------------------------------------------------------|
| `int`   | Used to represent whole numbers without decimal points |
| `float`| Used to represent decimal numbers with precision points |
| `char`  | Used to represent a single character                   |
| `bool`  | Used to represent a boolean value, which can be either `true` or `false` |



<br>
<br>


<p>
In addition to primitive types, programming languages often offer composite types or user-defined types, which are constructed by combining multiple primitive or composite types. Composite types encompass a variety of constructs such as arrays, structures, classes, or objects. They enable developers to create intricate data structures and represent entities with multiple properties or behaviors. While these concepts are currently quite complex, they will be explored in detail in subsequent sections.
</p>

<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <div class="right-div"></div>
</div>

<!-- ############################################# Separator - Bottom ############################################# -->





















### Signed and unsigned



<!-- ############################################# Separator - Top ############################################# -->

<div class="line-divider-top">
  <div class="left-div"></div>
  <span></span>
  <span class="middle"></span>
  <span></span>
  <div class="right-div"></div>
</div>

<!-- ############################################# Separator - Top ############################################# -->



<p>
Most of the fundamental numerical primitive types have the ability to store and manipulate both positive and negative numbers. In contrast to other programming languages, where the programmer may have limited or no control over whether a primitive numerical type can accommodate negative and positive numbers or only positive numbers, C++ offers a different approach. C++ provides the programmer with the ability to decide whether to store both negative and positive numbers, referred to as <strong>signed</strong> data types, or solely positive numbers, known as <strong>unsigned</strong> data types. Here's an example of how this can be achieved in C++:
</p>



<br>
<br>



```C++
main(int argc, char* argv[])
{
	signed   int number1 = -100;
	unsigned int number2 = 100;
	
	std::cout << "This is the signed number: "   << "number1 = " << number1 << "/n";
	std::cout << "This is the unsigned number: " << "number2 = " << number2 << std::endl;
	
	std::cin; // To insure that the command prompt does not close immediately in some IDEs.
	
	return (0);
}
```



<br>
<br>



<p>
Due to the way in which a signed number is saved in memory, the maximum number that we are able to store in a unsigned number increases, because we no longer need to accomodate negative numbers and therfore, we can use those bits to hold larger positive numbers.
</p>



<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <div class="right-div"></div>
</div>

<!-- ############################################# Separator - Bottom ############################################# -->










### Primitive sizes are not consistent!



<!-- ############################################# Separator - Top ############################################# -->

<div class="line-divider-top">
  <div class="left-div"></div>
  <span></span>
  <span class="middle"></span>
  <span></span>
  <div class="right-div"></div>
</div>

<!-- ############################################# Separator - Top ############################################# -->



<p> There is a difference between saying something is predefined with saying something is consisitent. predefined means that something is known and set from before hand. Consisitent means that there are no changes when switching among different conditions and variations.
&emsp;&emsp;&emsp;&emsp;While working in other languages such as Java, C#, Python, etc. you never have to worry about the size of your primitive types changing. If an int is considered to be 4 bytes, then it will stay consistent throughout other environments. However, in C/C++ world this is a different story. Languages such as C and C++ were made to be used with as many types of hardware as possible. Different types of hardware and CPUs have different types of architectures. Therefore, it is very challenging to accomodate the needs of them all. For this reason, at the time were these languages were envented and used no strict rules were enforced upon sizes and global best practices. If an int is 4 bytes in one system and environment, then it could be 6 or 8 bytes in others. The size of each primitive type dependends upon the standards that the chipset of each hardware and the operating system of that device enforces. Different operating systems and hardwares have different standards and opinions as what is the correct allocation to be made is. For these reasons the primitive types sizes can change. This can cause a lot of confusion and unindentended behaviour to occur. A program that you made for one device may not function as well or even at all for other devices.
</p>

You need to talk about the different primitive types in the primitive type section and provide code segments with examples.



<div>
Historically, a computer processor can process integer arithmetic quicker than 
it can floating-point arithmetic. Thus, while a processor can add 1 million integer numbers in a given amount of time, the same processor may be able to 
perform only 200,000 floating-point calculations during the same period. (Not 
surprisingly, I couldn’t even get around to reading the first value.) 
Calculation speed is becoming less of a problem as microprocessors increase 
their capabilities. Most modern processors contain special calculation circuitry for performing floating-point calculations almost as fast as integer 
calculations.
</div>

<br>

<div align="justify">
&emsp;&emsp;&emsp;&emsp;The amount of space in memory that the compiler needs to allocated to each data type is another important aspect of these primitive data types. As an example, while a `int` primitive type is meant to store whole numbers, but the smallest and largest numbers that it can hold are limited to the size it holds. A regular int in most environments (programming languages, operating systems, etc.) can usually have a size of 4 bytse or 32 bits. This allows the int to have a minimum of "-2147483648" and a maximum of "2147483647". But, what if we need store bigger values? What if we don't want to use as much space and only store smaller ranged values? The answer to these questions are the other similar data types that were created for these purposes. Each one of these major primitive data types have other sibling primitive data types that only vary in thier size capability. As an example, the int has other counter parts such as: `short` and `long`. The short has the ability to store a smaller range of numbers and uses less memeory. The long has the ability to store massive numbers at the cost of more memory usage. A similar situation exists for most other primitive data types. For a complete list of all availabl primitive data types and their sizes one must refer to the official documentation of that language and the underlying system. However, here is a list of most common types:
</div>



(also talk about signed and unsigned and explain how bits can be used to determine the size of a variable as well as sizeof method)



<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <div class="right-div"></div>
</div>

<!-- ############################################# Separator - Bottom ############################################# -->