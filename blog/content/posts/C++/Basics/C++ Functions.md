---
title: "C++ Functions"
date: 2023-05-26T10:31:00-07:00
draft: true
---

<style>

  .line-divider-top {
	
	display: flex;
	align-items: center;
	text-align: center;
	
	margin: 0px 0px 2.5rem 0px;
  }

  .line-divider-top .left-div {
  
	flex-grow: 1;
	background: currentColor;
	height: 1px;
  }
  
  .line-divider-top .right-div {
  
	flex-grow: 1;
	background: currentColor;
	height: 1px;
  }

  .line-divider-top .middle {
  
	margin: 0px 0px;
  }
  
  
  
  
  .line-divider-bottom:not(:last-child) {
	
    display: flex;
    align-items: center;
    text-align: center;
	
	margin: 2.5rem 0 20rem 0;
  }
  
  .line-divider-bottom:last-child {
	
    display: flex;
    align-items: center;
    text-align: center;
	
	margin: 2.5rem 0 0 0;
  }

  .line-divider-bottom .left-div {
  
	flex-grow: 1;
	background: currentColor;
    height: 1px;
  }
  
  .line-divider-bottom .right-div {
  
	flex-grow: 1;
	background: currentColor;
    height: 1px;
  }

  .line-divider-bottom .middle {
  
	margin: 0px 20px;
  }
  
  
  p {
  
	text-indent: 3rem;
	text-align: justify;
  }
  
  ins {
  
	font-weight: 500;text-underline-offset: 5px;
  }
  
  strong {
	
	font-weight: 700;
  }
  
  
  
  .justified-list {
    list-style-type: disc;
  }

  .justified-list li {
    text-align: justify;
  }
  
  
  .justified-ordered-list {
    list-style-type: decimal;
  }

  .justified-ordered-list li {
    text-align: justify;
  }

</style>

<br>
<br>

### Intro

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
I firmly believe that in order to understand the purpose of something, we must consider the consequences of its absence. Therfore, let's examine a typical scenario that illustrates the implications of not utilizing functions in our code. We begin by analyzing an example that illustrates the impact on program flexibility when functions are not used.
</p>

<br>
<br>
<br>
<br>

<p>
In game development, it is occasionally necessary to print out the information of a player character or any other object for clarification and debugging purposes. This allows us to confirm whether the actual position of that entity, as perceived from a matrix perspective, aligns with its representation in the code. This method is employed to verify if the logic and code of a game engine responsible for visually rendering entities are functioning correctly. Although we won't delve deeply into the inner workings of how engines calculate and perform their tasks, since this is ultimately a simple blog explaining the purpose of functions, we will still attempt to replicate the portion related to printing information. The following is an example showcasing a code snippet aimed at printing information about the position of an imaginary player character in a game engine:
</p>

<br>

```C++
#include <iostream>

int main(int argc, char* argv[])
{
	// ...
	// ...
	// ...
	// Engine is setup and providing data.
	
	float position_x = 0.0;
    float position_y = 1.0;
    float position_z = 0.0;
	
	std::cout << "\n\n" << "System has completed setup: " << "\n\n";


    std::cout << "The x coordinate is: " << position_x << "\n";
	std::cout << "The y coordinate is: " << position_y << "\n";
	std::cout << "The z coordinate is: " << position_z << "\n";
	
	// ...
	// ...
	// ...
	// The player is moved using input system.
	
	std::cout << "\n\n" << "Player was moved with input system: " << "\n\n";
	
	
	std::cout << "The x coordinate is: " << position_x << "\n";
	std::cout << "The y coordinate is: " << position_y << "\n";
	std::cout << "The z coordinate is: " << position_z << "\n";
	
	// ...
	// ...
	// ...
	// The player is being impacted by physical objects and is being pushed.
	
	std::cout << "\n\n" << "The player was impcated by physics: " << "\n\n";
	
	
	std::cout << "The x coordinate is: " << position_x << "\n";
	std::cout << "The y coordinate is: " << position_y << "\n";
	std::cout << "The z coordinate is: " << position_z << "\n";

    return (0);
}

```

<br>

<p>
Please keep in mind that the following explanation is a simplified version of the actual process, as we currently lack the necessary knowledge to write hundreds of lines of code with the precise logic. Although the current code may appear relatively easy to comprehend, it harbors several hidden issues that need to be addressed. Let's analyze each of these problems in detail and discuss potential solutions:
</p>

<br>
<br>
<br>
<br>

<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Difficulty of adapting to changes</strong></li>

</ul>

<p>
Suppose we decided to modify any aspect of the code, such as changing the output format. In that case, we must ensure that all instances are updated accordingly, which can be a tedious and error-prone process. This challenge becomes even more significant if we have numerous sections and hundreds of changes to apply.
</p>

<br>
<br>

<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Code readability</strong></li>

</ul>

<p>
While we may currently be able to make sense of the functionality, what about one week, two weeks, or three weeks later? Will we still remember the purpose of each part and be able to navigate through all the duplicates? Will it be easy to try and understand the hundreds if not tousands of lines of code that look very similar to each other?
</p>

<br>
<br>

<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Difficulty in handling bugs and issues</strong></li>

</ul>

<p>
What happens if we attempt to fix an issue that we encountered in our code? Identifying the specific section causing the problem becomes challenging, and fixing it becomes a taxing task as we need to address the issue in every instance.
</p>

<br>
<br>

<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Bad abstraction hinders logic</strong></li>

</ul>

<p>
The program's overall reasoning becomes difficult due to the overwhelming number of code lines in front of us. This distracts us from focusing on the program's logic and abstraction, hindering our ability to effectively understand and reason about the code.
</p>

<br>
<br>
<br>
<br>

<p>
All of the aforementioned reasons contribute to the potential failure and cumbersome nature of large programs that do not take advantage of functions in their code base. Furthermore, these issues serve as the primary motivation behind the existence of functions.
</p>

<!-- ##################### Separator - Bottom ##################### -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Intro</span>
  <span>|</span>
  <div class="right-div"></div>
</div>

<!-- ##################### Separator - Bottom ##################### -->

### Function definition & syntax

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
A function is a named segment of code that carries out a specific task or a series of related tasks. It serves as a fundamental concept in most programming languages, aiding in code organization and modularization. Functions offer a comprehensive overview by concealing the technical complexity and providing a descriptive name that indicates the purpose of that segment of code.
</p>

<br>
<br>
<br>
<br>
<br>

<p>
Although the syntax of a function may vary depending on the situation, the overall structure typically includes a return type, a name, a parameter list enclosed in parentheses, and last but not least followed by a set of curly brackets. The following demonstrate the typical structure and appearance of a function:
</p>

<br>

```C++ {linenos=false}
return_type function_name(parameter_list)
{
	// The logic of the function
}
```

<br>
<br>
<br>
<br>
<br>

<p>
Functions enable programmers to concentrate on the overall logic being executed, rather than becoming overwhelmed by an excessive number of lines and convoluted details that may distract them from their original objectives. This situation is more common than programmers might realize, where they often find themselves diverted from understanding the program's actual flow to unraveling the technical specifics of why certain implementations are chosen. To illustrate this, let's look at the following code:
</p>

<br>

```C++
#include <iostream>

int main(int argc, char* argv[])
{	
    int digit = 5;
    int power = 7;
	
    int result = 1;

    for (int index = 1; index <= power; index++)
	{
        result *= digit;
    }

    std::cout << "The result is: " << result << std::endl;

    return (0);
}

```

<br>

<p>
Upon initial inspection, it may require several minutes to decipher the purpose of this code. The provided code aims to compute the exponentiation of a given number. While this example may not be exceedingly difficult, consider the scenario where it is. Envision yourself joining a company and being assigned to a project. On your very first day, you are confronted with an extensive codebase comprising hundreds, if not thousands, of lines of code. How would you decipher the functionality of each component?
</p>

<br>

<p>
If you were presented with the following code base instead of the previously mentioned one, how efficiently would you be able to deduce the functionality of the following code? Although this is a straightforward and arbitrary example, it should hopefully illustrate how functions can contribute to code flexibility and comprehensibility.
</p>

<br>

```C++
#include <iostream>

int main(int argc, char* argv[])
{	
    int digit = 5;
    int power = 7;
	
    int result = calculate_power(digit, power); // Function is defined somewhere else in the code.

    std::cout << "The result is: " << result << std::endl;

    return (0);
}

```

<br>
<br>
<br>
<br>
<br>

<p>
This was just a brief definition of funcions and their overall syntax. We have barely touched the surface of functions. In the subsequent sections, we will delve further into the definition of each component of the function syntax and enrich our comprehension of them.
</p>

<!-- ##################### Separator - Bottom ##################### -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Function definition & syntax</span>
  <span>|</span>
  <div class="right-div"></div>
</div>

<!-- ##################### Separator - Bottom ##################### -->

### Function Header & Body

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
A function can be divided into two main components of <strong>Header</strong> and <strong>Body</strong>. While in many other languages, it may not be essential to understand the exact differentiation between these parts, in C++, having a clear understanding of their distinction is crucial. Let's delve deeper into what each of these components entails.
</p>

<br>
<br>
<br>
<br>
<br>

<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Header</strong></li>

</ul>

<p>
The header of a function is meant to specify the most improtant characteristics of a function. This entails the function's name (identifier), return type, and parameters. It acts as a blueprint for the function, providing essential details on how the function should be called (invoked). The header is alternatively referred to as the function <strong>prototype</strong> or <strong>signature</strong>. Typically, it is the initial line used when creating functions, informing the compiler that we intend to define a block of code that accomplishes some task.
</p>

<br>

```C++
#include <iostream>

int calculate_power(int digit, int power) // Function header
{

}

int main(int argc, char* argv[])
{	
    int digit = 5;
    int power = 7;
	
    // Function must be called here. 

    std::cout << "The result is: " << std::endl;

    return (0);
}

```

<br>

<p>
In the given example, line 15 showcases the header of a function named "calculate_power" as a demonstration. The header is comprised of three essential elements: the return type (in this case, "int"), the name or identifier (in this case, "calculate_power"), and the parameters (named "digit" and "power" in this instance). Now, let's analyze each of these components for a more comprehensive understanding.
</p>

<br>
<br>
<br>
<br>
<br>

<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Return type</strong></li>

</ul>

<p>
The return type determines the type of data that the function will return upon completion of its execution or what is expected to be returned. It can be any valid data type in C++, including integers, doubles, void, or even a user-defined type. The void type holds a distinct significance in C++. It implies that the function is not obligated to provide a return value once its computation is finished. Another frequently utilized type is "bool," which indicates whether the function has successfully executed its operation or not. In the following section, we will delve into a detailed explanation of how one can specify the return value from a function.
</p>

<br>
<br>

<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Name</strong></li>

</ul>

<p>
When attempting to call a function to execute its task, we use the function's name, also known as the identifier. It is crucial to uphold to specific naming conventions and guidelines while selecting an identifier for a function. The function name should be descriptive and meaningful, accurately representing the purpose or action performed by the function. Moreover, the function name must be unique within the scope where the function is declared. This ensures that there is no ambiguity when referencing or calling the function in the program. If two functions within the same scope share the same name, it will result in a compilation error.
</p>

<br>
<br>

<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Parameter List</strong></li>

</ul>

<p>
Parameters serve as a collection of variables that the function anticipates receiving to execute its task correctly or even to function at all. These parameters are enclosed within parentheses (), and if there are multiple parameters, they are separated by commas. Each parameter defines the type and identifier of the data that can be supplied to the function when it is called. The specific values passed during the invocation or calling of the function are referred to as "arguments."Parameters are essentially a list of variables that the function expcets to recieve in order to perform its task correctly (or at all even). The parameters are enclosed within parentheses (), separated by commas if there are multiple of them. Each parameter specifies the type and identifier of the data that can be passed into the function when it is called. The actual value that is passed during the invokation (calling) of the function is called "Arguments".
</p>

<br>
<br>
<br>
<br>
<br>

<p>
Function headers also play a crucial role in type checking. By explicitly defining the return type and parameter types in the header, the compiler can verify if the function is used in a correct way. It can check for type mismatches or missing arguments, ensuring that the function is used appropriately. The following example illustrates how type checking can be utilized to validate the proper usage of a function:
</p>

<br>

```C++
#include <iostream>

void print_number(int number)
{
    std::cout << "The number is: " << number << std::endl;
}

int main(int argc, char* argv[])
{
    print_number(42);
	
    print_number(3.14159);  // Incorrect argument type

    return (0);
}
```

<br>

<p>
The code snippet provided features a function called "print_number" which takes an integer parameter and is responsible for displaying the given number on the console. In C++, due to its strong typing nature, the compiler identifies a type mismatch on line 12, where we are trying to pass a double value. Consequently, the compiler generates a compile-time error indicating that there is no corresponding function for "print_number(double)". This error message serves as a reminder to verify that the argument types align with the expected types when calling functions. By doing so, potential bugs can be caught early, and type safety within the code is ensured.
</p>

<br>
<br>
<br>
<br>
<br>

<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Body</strong></li>

</ul>

<p>
In programming, the body of a function refers to the code block that outlines the actions or operations to be executed by the function. It is the segment of the function where you specify the desired behavior and define the tasks to be performed when the function is called. The function body serves as a regular container capable of holding various types of statements we have encountered thus far. This consists of a broad spectrum of statements, including variables, assignments, and any other valid C++ code. Here's a general syntax of a function with a body in C++:
</p>

<br>

```C++
int calculate_power(int digit, int power)
{
	// Start of the body...
	
	int result = 0;
	
	// Calculate the "result"...
	
	return (result);
	
	// End of the body...
}
```

<br>

<p>
The body encapsulates a block of code enclosed within a set of curly braces "{ }". The statements within the body are executed sequentially, allowing you to perform calculations, manipulate data, or perform specific actions based on the desired logic. Function bodies in C++ provide a powerful mechanism for organizing code, promoting reusability, and implementing complex algorithms and operations within a program. The function body may or may not conclude with a return statement.
</p>

<br>
<br>
<br>
<br>
<br>

<p>
Let's pause for a moment to explore the return statement in C++ more extensively. In C++, the return keyword is used to create a return statement and it has has two primary purposes. The first purpose is to explicitly specify a value that will be returned to the invoker of the function. It is crucial to understand that when a function is declared to return a value (i.e., it does not have a void return type), every possible execution path within the function must include a return statement that returns a value of the declared type. Failure to do so will lead to a compilation error in the code.
</p>

<br>

```C++
int calculate_power(int base, int exponent)
{	
	int result = 0;
	
	if (base < 0)
	{
		// -1 indicates that an error has occurred!
		// The invoker must handle the situation.
		return (-1);
    }
	
	else if (exponent == 0)
	{
        return (1);
    }
	
	// Calculate the "result"...
	
	return (result);
}
```

<br>

<p>
In the given example, we begin by checking if the base is less than zero, which is ambiguous and requires proper clarification through error handling. Next, we establish a condition to verify if the exponent is zero, resulting in a value of one. If none of these situations apply, we proceed with the calculation and return the result. Each condition introduces a new exit point, necessitating the inclusion of a return value with the proper declared type to be returned from it.
</p>

<br>

<p>
The second purpose is acting as a termination operator for the functiont to end prematurely. When a return statement is encountered in a function, it immediately exits the function's execution and returns control to the caller. This means that any code after the return statement within the function will not be executed. The return statement can be used at any point within a function, even in conditional statements or loops, to terminate the function's execution early. The return statement can also be used to terminate a function without returning a value. In this case, you would use the void return type when declaring the function, indicating that it doesn't return any value.
</p>

<br>

```C++
#include <iostream>

void validate_input(int number)
{
    if (number > 10)
	{
        std::cout << "The number is greater than 10." << "\n";
        
		return;  // Terminate the function early if the condition is met.
    }
    
	// Otherwise, continue ...
}
```

<br>

<p>
In the given example, the function initially verifies whether the number exceeds 10, as this can potentially create problems for the operation. If this condition is satisfied, the function promptly returns, leading to its termination. Otherwise, it proceeds with the execution. If you're interested in learning more about such condition checking techniques, I recommend exploring the guard-clause method discussed in the conditional part of this tutorial.
</p>

<br>
<br>
<br>
<br>
<br>

<p>
Wow! that was a lot to take in. But, if you think it is doen then think again! We will continue to discuss more things as we go along. Lets delve into the next topics.
</p>

<!-- ##################### Separator - Bottom ##################### -->

<div class="line-divider-bottom">
  <div class="left-div"></div>
  <span>|</span>
  <span class="middle">Function Header & Body</span>
  <span>|</span>
  <div class="right-div"></div>
</div>

<!-- ##################### Separator - Bottom ##################### -->

### Function Declaration & Definition

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
The format of a typical function in C++ shares a similarity with variables, although there are notable differences. The process of creating a function can be divided into two essential steps of <strong>Declaration</strong> and <strong>Definition</strong>. The source of confusion for many programmers is that other resources often present these steps as a single simultaneous operation, making it challenging to perceive them as distinct actions. While these terms are frequently used interchangeably, it is important to understand their distinctions.
</p>

<br>
<br>
<br>
<br>
<br>

<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Declaration</strong></li>

</ul>

<p>
One of the primary justifications for the existence of functions, as I mentioned earlier, lies in their ability to be reused. However, if you cannot even communicate their existence to others, how can you expect functions to be effectively reused? This is where function declaration comes into play. In C++, a function declaration serves the purpose of informing the compiler about a function's existence prior to its definition or usage.
</p>

<br>

<p>
If you have been following along, you might have observed a recurring pattern in the code snippets provided so far. In almost every case, the functions created are positioned before the point where they are intended to be called or invoked. This is not a coincidence. The reason behind this approach is that C++ compiles source code in a top-down fashion, processing it line by line. When the compiler encounters a function call, it requires prior knowledge of the function's signature, including its return type, name, and parameter types, to ensure the correctness of the function call.
</p>

<br>

<p>
If a function is called before it is declared or defined, the compiler will generate an error because it doesn't have the required information to verify the call. Placing the function definition before its usage ensures that the compiler has the necessary details to correctly compile the code. this brings us to yet another important ability of headers. As we discussed earlier, headers contain the essential information that a compiler needs in order to compare the correctness of our calls. Since headers contain all the neccessary information for this correct checking, they are the only thing that the complire requires in order to actually make a call statemnt work temporarily (beside from the actual functionality of the function of course). This brings us to prototypes.
</p>

<br>

<p>
Declarations work hand in hand with function headers, in this case also called <strong>prototypes</strong>. It holds significant importance as it provides the compiler with a concise and descriptive summary of the function's functionality, including the arguments it accepts and the output it produces. Consequently, it enables others to comprehend the function's purpose without delving into the complex details of its implementation.
</p>

<br>

```C++
#include <iostream>

void print_number(int number); // Function prototype is declared before usage.


int main(int argc, char* argv[])
{
    print_number(42);

    return (0);
}


void print_number(int number)
{
    std::cout << "The number is: " << number << std::endl;
}
```

<br>

<p>
In the example provided above, we employ a function header, also known as a prototype, to indicate the existence of a function called "print_number." Prototypes offer the advantage of declaring and referencing functions in any order, promoting modular programming and minimizing interdependencies among code modules. Prototypes typically conclude with a semicolon (;) since their sole purpose is to inform the compiler about the presence of a function. However, when used in conjunction with a function body, they do not require a semicolon at the end. This distinction ensures proper syntax and avoids any confusion in the code.
</p>

<br>

<p>
Function headers, or prototypes, are often referred to as signatures due to a parallel with signing an agreement. Similar to how a signature ensures commitment to fulfilling certain obligations, a function's prototype specifies what it expects to receive and return. Function declarations become necessary when you intend to use a function before its definition. They inform the compiler about the function's signature, encompassing the return type and parameters. This enables the compiler to perform accurate type checking and compilation. It is considered good practice to provide declarations for all functions, even if they are defined prior to their usage. Doing so enhances code readability and maintainability, allowing other programmers to understand the function's signature without having to search for its definition.
</p>

<br>
<br>
<br>
<br>
<br>

<ul class="justified-list">

<!-- ##################### List element ##################### -->
<li><strong>Definition</strong></li>

</ul>

<p>
The function body serves as the container for the specific instructions and statements that are executed when the function is called. This block of code defines the actual behavior of the function and is commonly referred to as the function definition. In essence, the function definition outlines how the function operates and what actions it performs. This process is also known as the function implementation, as it involves the concrete realization of the function's intended behavior.
</p>










### Function life cycle



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<p>
When you invoke a function in your code, the compiler or interpreter matches the function call with the corresponding function signature to ensure that the function is used correctly. The compiler then generates code that handles the function call, including any necessary parameter passing and memory management.

However, the process is more complex than simply "pasting" the function code at the call site. Instead, the compiler typically generates machine code or intermediate representations, which represent the function's logic in a more optimized and efficient manner. These representations may include optimizations, such as inlining, where the compiler decides to replace a function call with the actual function body at the call site.

Inlining is an optimization technique where the compiler replaces a function call with the corresponding function's code at the call site itself. This eliminates the overhead of the function call, such as parameter passing and stack frame setup. In some cases, the compiler may decide to inline small or frequently used functions automatically to improve performance. However, not all function calls are inlined, and the decision is usually made based on various factors, including code size, performance considerations, and the compiler's optimization settings.

It's important to note that inlining is just one of many optimization techniques used by compilers, and its application depends on the specific compiler, language, and compiler settings. The actual behavior and optimizations may vary across programming languages and different compiler implementations.
</p>



<br>



<p>
 Each time a function
is called, an activation record containing function parameters, local variables,
and the return address is pushed onto the stack;
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










### Entry point function



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<p>
Certainly! In a C++ (or any programming language) program, the "entry point" refers to the specific point in the code where the program's execution begins. It's the first function that gets called when the program is run. In C++ programs, the entry point is traditionally named "main". The "main" function is where the program starts its execution and from where it usually branches out to perform various tasks. The entry point is crucial because it's the starting point of program execution, and from here, the program can call other functions, create objects, allocate memory, and perform any other necessary tasks. Without a defined entry point, the program wouldn't know where to start its execution and would have no way of performing any actions.
</p>



<br>



<p>
Yes, in some build systems and environments, you can specify a different function to be the entry point of your program instead of the default "main" function. This can be useful in certain scenarios, such as when working with specialized environments or when integrating code from different sources. However, keep in mind that deviating from the conventional "main" entry point might make your code less portable and harder to understand for other developers who are accustomed to the standard practices. It's generally a good idea to use such customizations only when necessary and to document them clearly to aid collaboration and maintainability.
</p>

<p>
The name "main" for the entry function in C++ programs is a convention that has been inherited from the C programming language. There are historical and practical reasons behind this choice:

C Compatibility: C++ is designed to be compatible with the C programming language, and one of the goals was to make it possible for C code to be easily integrated into C++ programs. In C, the entry point of a program is traditionally called "main". By keeping the same naming convention, C++ ensured that C code could be seamlessly integrated into C++ programs without requiring changes to the entry function's name.

Ease of Understanding: Using a standard name like "main" for the entry function makes the code more readable and understandable for programmers who are familiar with the conventions of the C/C++ languages. It provides a clear indication of where the program's execution begins.

Consistency: Naming conventions contribute to the overall consistency of the language. When multiple programmers use the same conventions, it becomes easier to collaborate on projects and understand each other's code. Consistency in naming also helps when sharing code, looking up examples, and learning from existing codebases.

Toolchain Expectations: The compilers and development tools for C and C++ expect the entry function to be named "main" by default. The tools are designed to search for the "main" function as the starting point for execution. While some compilers allow you to specify a different name for the entry function, "main" is the default and most commonly used.

Convention Over Configuration: The "main" function naming convention follows the principle of "convention over configuration." This principle simplifies development by providing sensible defaults and reducing the need for manual configuration or specification. When you follow established conventions, you can focus more on writing code rather than configuring settings.

It's worth noting that while "main" is the conventional name for the entry function, C++ standards do not mandate this name. Some compilers may allow you to use different names for the entry function, but doing so might make your code less portable and harder to understand for others who are familiar with the conventions.
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