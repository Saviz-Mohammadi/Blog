---
title: "C++ basics part 01 - Variables"
date: 2023-05-12T14:06:22-07:00
draft: true

weight: 1
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
One of the most crucial capabilities of a computer lies in its potential to manipulate and process information, also known as data. Data plays a vital role in all computer operations and processes. However, in order for a computer to work with data, it requires a designated location to store that information. While disks can store large amounts of data, they suffer from sluggish read and write speeds, leading to significant delays. To fully utilize the potential of data, computers depend on a storage location called RAM, short for Random Access Memory.
</p>



<br>



<p>
RAM is a volatile form of memory that loses its contents when the computer shuts down or restarts. Data cannot persist on RAM, but it can be transferred and manipulated faster than other types of storage units. This unique capability is what makes RAM so important, as programs often need to process enormous amounts of data quickly. RAM is organized as a contiguous block consisting of multiple memory cells, each capable of storing and referencing a piece of data, sometimes also refered to as a word. To allow other processes and programs to access and manipulate these cells of data, each cell is assigned a unique address that can be used for referencing. These addresses typically appear in a format called "hexidecimal" similar to the following:
</p>



<br>



```C++ {linenos=false}
Address: 0x7fff5fbff6c8
```



<br>



<p>
If a programmer needs to modify the contents of a specific cell in RAM, referring to the address can indeed be challenging, especially when dealing with a large magnitude of data. It would be troublesome for the programmer to memorize a significant number of complex addresses in order to reference each piece of data individually. The human brain is not naturally designed for remembering and managing such detailed information. To address this challenge, more convenient ways have been developed for accessing and manipulating data.
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










### Variables



<!-- ##################### Separator - Top ##################### -->

<div class="line-divider-top">
  <div class="left-div"></div>
  <span></span>
  <span class="middle"></span>
  <span></span>
  <div class="right-div"></div>
</div>

<!-- ##################### Separator - Top ##################### -->



<p>
A variable serves as a mechanism for programmers to store, manipulate, and reference data from memory. Variables play a crucial role as they enable us to interact with data in a convenient and straightforward manner. They accomplish this by assigning meaningful names and labels to the memory locations where the data is stored. Instead of directly dealing with memory addresses, which can be complex and cumbersome, variables provide a more intuitive and human-readable way of interacting with memory.
</p>



<br>



<p>
Variables possess a unique quality: they are very flexibil; their content can be modified and changed, hence the adoption of the term "variable" from the realm of mathematics. An illustrative example of utilizing variables for storing and referencing data is the representation of a player character in a game. In this scenario, a player typically has X, Y, and Z coordinates, which indicate their position within the game world. Let's consider an example showcasing how these values can be stored and accessed using the C++ programming language:
</p>



<br>



```C++
main(int argc, char* argv[])
{
	// Creating variables.
	int coordinate_x = 100;
	int coordinate_y = 0;
	int coordinate_z = 50;
	
	
	// Printing coordinates.
	std::cout << "The content of x variable is: " << coordinate_x << "\n";
	std::cout << "The address of x variable is: " << &coordinate_x << "\n\n";
	
	std::cout << "The content of y variable is: " << coordinate_y << "\n";
	std::cout << "The address of y variable is: " << &coordinate_y << "\n\n";
	
	std::cout << "The content of z variable is: " << coordinate_z << "\n";
	std::cout << "The address of z variable is: " << &coordinate_z << std::endl;
	
	
	return (0);
}
```



<br>



```C++ {linenos=false}
The content of x variable is: 100
The address of x variable is: 0x7fff5fbff6cc

The content of y variable is: 0
The address of y variable is: 0x7fff5fbff6c8

The content of z variable is: 50
The address of z variable is: 0x7fff5fbff6c4
```



<br>



<p>
When examining the addresses of variables, you might wonder if there is a noticeable pattern that can be utilized to predict their storage locations. However, in general, it is not feasible to accurately predict the precise address where a variable will be stored by the compiler. The compiler's allocation process for addresses is influenced by multiple factors, such as the target platform, compiler optimizations, memory alignment requirements, and other considerations. 
</p>



<br>



<p>
The specific memory layout and address assignments are implementation details that are typically not exposed or predictable solely from the source code. The primary objective of the compiler is to generate efficient and correct machine code, granting it the flexibility to determine how to allocate and organize variables in memory. Attempting to predict the address of a variable is generally unnecessary and contradicts the principles of creating portable and maintainable code.
</p>



<br>



<p>
Fortunately, even if we cannot predict the address of a variable, in C++, we can still obtain it by using the ampersand (&) symbol. The address-of operator allows us to retrieve the memory location where a variable is stored. This ability to acquire the address of a variable is valuable for purposes such as debugging and memory analysis. By inspecting memory addresses, programmers can track the location and value of variables during program execution.
</p>



<!-- ##################### Separator - Bottom ##################### -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Variables</span>
  <span>|</span>
  <div class="right-div"></div>
</div>



<!-- ##################### Separator - Bottom ##################### -->










### Variable life stages



<!-- ##################### Separator - Top ##################### -->

<div class="line-divider-top">
  <div class="left-div"></div>
  <span></span>
  <span class="middle"></span>
  <span></span>
  <div class="right-div"></div>
</div>

<!-- ##################### Separator - Top ##################### -->

<p>
In programming, a variable undergoes various stages throughout its lifespan. The first stage is the creation phase, where we inform the computer that we want to allocate and work with a specific piece of data. The second stage is utilization, during which we manipulate and utilize the variable's information to perform processing actions and generate output.
</p>



<br>



<p>
Eventually, every variable ultimately reaches the end of its lifespan. At this point, the variable is terminated by the operating system, and the memory allocated to that variable is freed for alternative uses. This usually happens when our programs complete their execution. A variable's life can also come to an end when it goes out of scope or when the program execution concludes. Once a variable goes out of scope, it becomes inaccessible, and the programming language may release its memory. We will explore scopes and their importance in later sections.
</p>



<br>



<p>
In the upcoming sections, we will explore the different stages associated with the creation phase of variables and dive deeper into how we can effectively work with them. The process of creating and utilizing a variable can be divided into two general steps of <strong>Declaration</strong> and <strong>Initialization</strong>. In programming, it is important to understand that declaration and initialization are two distinct concepts with different meanings and purposes. While these terms are sometimes used interchangeably, it is essential to recognize and comprehend their differences to ensure accurate communication and understanding within the programming community.
</p>

<!-- ##################### Separator - Bottom ##################### -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Variables</span>
  <span>|</span>
  <div class="right-div"></div>
</div>



<!-- ##################### Separator - Bottom ##################### -->










### Declaration



<!-- ##################### Separator - Top ##################### -->

<div class="line-divider-top">
  <div class="left-div"></div>
  <span></span>
  <span class="middle"></span>
  <span></span>
  <div class="right-div"></div>
</div>

<!-- ##################### Separator - Top ##################### -->



<p>
Declaration is a fundamental process in programming whereby we, as programmers, inform the compiler about the existence and characteristics of a variable. When we declare a variable, we are essentially instructing the compiler to allocate a portion of memory for storing a specific piece of information or data that we intend to manipulate. The name we provide acts as a unique identifier for accessing and manipulating the variable throughout the program. Essentially, declaration is the only requirement for creating and interacting with variables. In C++, the syntax for declaring variables follows a general pattern:
</p>

You need to talk about the ability of declaring and initing multiple vars in a single line like this: int hello, good, same;


<br>



```C++ {linenos=false}
access_modifier data_type name;
```



<br>



```C++
main(int argc, char* argv[])
{
	int number;
	
	return (0);
}
```



<br>



<p>
In the provided example, we can observe the declaration of a variable without the use of any access modifiers, which will be explained in later discussions. During variable declaration, we begin by specifying the data type, which informs the compiler about the type of information that will be stored in the variable. In this example, the specified data type is "int," indicating that the variable will store whole numbers. It is important to note that different data types can hold different kinds of information in them, and we will explore this further in later discussions.
</p>



<br>



<p>
In addition to the data type, we assign a label or name to the variable. In this case, the identifier "number" is used to uniquely identify and refer to the variable. It is crucial to choose a meaningful name that reflects the purpose or content of the variable. Lastly, it is essential to conclude the declaration statement with a semicolon (;). The semicolon acts as a statement terminator, signifying the end of the line of code. It is a vital syntax element in C++ as well as many other programming languages.
</p>



<!-- ##################### Separator - Bottom ##################### -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Variables</span>
  <span>|</span>
  <div class="right-div"></div>
</div>



<!-- ##################### Separator - Bottom ##################### -->










### Initialization



<!-- ##################### Separator - Top ##################### -->

<div class="line-divider-top">
  <div class="left-div"></div>
  <span></span>
  <span class="middle"></span>
  <span></span>
  <div class="right-div"></div>
</div>

<!-- ##################### Separator - Top ##################### -->



<p>
At this stage, you might find yourself wondering, "What exactly is Initialization?" Additionally, if declaration alone is adequate for creating and working with variables, why is it crucial to comprehend Initialization? To address these inquiries, let us commence by gaining an understanding of what Initialization encompasses. Initialization refers to the act of assigning an initial value to a variable at the time of its declaration or creation. Hence, it is called "Initialization" because it sets the variable's starting value.
</p>



<br>



<p>
In programming, Initialization is typically accomplished by utilizing the equal sign (=) followed by an expression or value. For instance, when we declare a variable named "number" and assign the value 57 to it, we are engaging in Initialization. This process of allocating a value to a variable in programming using the equal sign is commonly referred to as an assignment statement. In C++, Initialization can also be done on two separate lines if desired.
</p>



<br>



```C++
main(int argc, char* argv[])
{
	int number = 57;	// Declaration and initializating happen at the same time.
	
	return (0);
}
```



<br>



<p>
The equal sign in programming often leads to confusion, especially for beginners, and is a common source of misunderstanding. This confusion arises from the fact that in mathematics, the equal sign (=) signifies equality, while in programming, it represents the assignment of a value to a variable. This presents a significant challenge for those transitioning from a math background to programming.
</p>



<br>



<p>
While not of utmost importance, initializing a variable in its declaration offers an additional advantage by eliminating the need for programmers to retype the variable's name when assigning a value to it using an assignment statement. This minor benefit can help streamline code and reduce the risk of typographical errors by preventing the chance of human-error when retyping.
</p>



<br>



```C++
main(int argc, char* argv[])
{
	int number;			// Declaration.
	
	number = 100;		// Initializating
	
	return (0);
}
```



<br>



<p>
Initialization is crucial as it guarantees that variables possess a known value when they are initially utilized in the program. Certain programming languages, including C++, do not impose the requirement for variables to be initialized before usage. This can occasionally cause programmers to obtain undesirable habits. The drawbacks of neglecting to initialize variables in C++ can be substantial, potentially resulting in unexpected behavior or even security vulnerabilities within the program.
</p>



<!-- ##################### Separator - Bottom ##################### -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Variables</span>
  <span>|</span>
  <div class="right-div"></div>
</div>



<!-- ##################### Separator - Bottom ##################### -->










### Problems with uninitialized variables




<!-- ##################### Separator - Top ##################### -->

<div class="line-divider-top">
  <div class="left-div"></div>
  <span></span>
  <span class="middle"></span>
  <span></span>
  <div class="right-div"></div>
</div>

<!-- ##################### Separator - Top ##################### -->



<p>
Let's consider the scenario of attempting to print the contents of an uninitialized variable. In C++, if you try to print a variable that has been declared but not initialized, the behavior is undefined. This means that the result cannot be predicted and may vary depending on factors such as the compiler, optimization settings, and other variables. Let's explore a few potential scenarios that may arise:
</p>



<br>
<br>
<br>



<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Garbage value</strong></li>

</ul>



<p>
When a variable is not initialized, it will hold whatever value is present in the memory location where it resides. In certain cases, the uninitialized variable may contain a random value from that memory location. This value could be a remnant from a previous operation or simply an arbitrary value. This is commonly known as a garbage value. The presence of garbage values can give rise to logic errors, crashes, or other unforeseen behaviors.
</p>



<br>



<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Compiler Warnings</strong></li>

</ul>



<p>
In modern compilers, it is common for a warning to be generated when you try to utilize an uninitialized variable. This warning serves as a reminder that you are accessing a variable that may not hold a meaningful value. Despite this warning, the code will still compile and execute. However, it is crucial to note that using an uninitialized variable can result in program crashes or undefined behavior. The variable in question may trigger memory access violations, segmentation faults, or other runtime errors.
</p>



<br>



<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Initialization by chance</strong></li>

</ul>



<p>
In exceptional circumstances, an uninitialized variable may coincidentally possess a value that appears to be meaningful. This can occur on occasion since certain coding environments, compilers, and other factors have settings that facilitate automatic initialization. However, it is crucial to note that relying on this behavior is strongly discouraged. It is always best practice to explicitly initialize variables to ensure clarity for others reading yoru code and to avoid potential issues.
</p>



<br>



<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Program Crash</strong></li>

</ul>



<p>
In other cases, attempting to use an uninitialized variable can lead to program crashes or undefined behavior. The variable may cause memory access violations, segmentation faults, or other runtime errors that can terminate the program abruptly.
</p>



<br>



```C++
#include <iostream>

int main(int argc, char* argv[])
{
    int input = 0;
	
	// Notify the user that they need to input a number.
    std::cout << "Please enter a number: ";
	
	// Obtain input from user.
    std::cin >> input;
    
	// Depending on the input do something.
    if (input > 0)
    {
        // Perform some code.
    }
	
    else
    {
        // Perform some other code.
    }
    
    return (0);
}

```

<br>

<p>
In the example above, we declare an integer variable called "input", but we do not initialize it with a value. Then, we prompt the user to enter a number using std::cin. Depending on whether the number is positive or negative, we perform different operations. The problem is that since the input variable is not initialized, its value is undefined, which can lead to unpredictable behavior. For example, if the user enters a non-integer value or a value that cannot be read by std::cin, the value of input will remain undefined, and the conditional statement will behave unpredictably. What is even worse is that if some other segment of our code later on decides to use the content of this variable, then it will not only not work, but it may also cause problems on the next run of the program, because the value from the previous operation will remain in this memory location.
</p>



<!-- ##################### Separator - Bottom ##################### -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Variables</span>
  <span>|</span>
  <div class="right-div"></div>
</div>



<!-- ##################### Separator - Bottom ##################### -->










### Identifiers and naming conventions



<!-- ##################### Separator - Top ##################### -->

<div class="line-divider-top">
  <div class="left-div"></div>
  <span></span>
  <span class="middle"></span>
  <span></span>
  <div class="right-div"></div>
</div>

<!-- ##################### Separator - Top ##################### -->



<p>
The names that we associate to our variables are commonly refered to as <b>identifiers</b>. This is because they ironically, identify what we are trynig to refer to. It almost acts like an identification (ID) that can be used to search and find and use a specific piece of information. When you create an identifier, you should try to make the name both meaningful and easy to remember. To make a name meaningful, you should use as many characters as you need, There are many different methods/patterns in computing science to name your identifiers. camel case, pascal case, snake case. While languages do not enforce any of these patterns it is a good idea to choose one and stick to it.

C++ in particular is case-sensitive, you need to be careful when you create and use identifiers. If, for example, you define an identifier named subtotal, you can’t refer to it later as Subtotal. That’s a common coding error
</p>



<!-- ##################### Separator - Bottom ##################### -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Variables</span>
  <span>|</span>
  <div class="right-div"></div>
</div>



<!-- ##################### Separator - Bottom ##################### -->










### Assigning new values



<!-- ##################### Separator - Top ##################### -->

<div class="line-divider-top">
  <div class="left-div"></div>
  <span></span>
  <span class="middle"></span>
  <span></span>
  <div class="right-div"></div>
</div>

<!-- ##################### Separator - Top ##################### -->



<p>
Initialization is not the only scenario in which we want to assign a value to a variable. Throughout the life time of a program it is very common to change the content of an existing variable multiple times. This is known as an <b>assignment statement</b>, in which the programmer attempts to tell the compiler to change the contents of a variable. This can be done in the following way:
</p>



<br>



```C++
#include <iostream>

int main(int argc, char* argv[])
{
    int number = 0;
	
	// Assigning a new value to "number".
	number = 20;
	
	// Display content of "number" variable.
    std::cout << "The \"number\" variable contains: " << number;
    
    return (0);
}
```



<br>



<p>
It is important to remember that in a assignment statement (except for when Initializating) we do not specify the data type of the variable again (as it would mean that we want to declare a variable with the same name again, which is not allowed). Instead we only use the identifier of the variable followed by a equal sign (=) and the value that we want it to contain.
</p>



<br>



```C++
[name of variable] = [value];
```

You should research and see what naming conventions are used for variables.
You need to talk about lvalues and rvalues.

<!-- ##################### Separator - Bottom ##################### -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Variables</span>
  <span>|</span>
  <div class="right-div"></div>
</div>



<!-- ##################### Separator - Bottom ##################### -->