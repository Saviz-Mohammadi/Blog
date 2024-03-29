---
title: "C++ Data structures & STL part 01 - Basic concepts"
date: 2023-05-12T14:06:22-07:00
draft: true

weight: 3
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
A program consists of a sequential set of instructions that are executed one after the other, with each instruction operating on a distinct piece of data. As our programs grow in size and complexity, it becomes increasingly challenging to effectively monitor and manage these datasets solely using conventional variables, objects, and structs. Opting to utilize such solutions can quickly lead to unmanageable situations. This is because these storages are not engineered to handle extensive data loads; their design centers around managing and representing singular units of information or one entity at the very best. Let's demonstrate this concept with a simple example. Imagine you have a classroom full of students and intend to store information about every student, including their name, age, and SIN number. If you decide to employ distinct variables for each student, the code will be similar to the following:
</p>



<br>
<br>
<br>



```C++
///////////////////////////////////////////////////////////////////////////////
//
// Description:
// 
// This program demonstrates the creation of student entities through the
// composition of three individual variables for each student. Each variable
// corresponds to a specific student attribute, with a numerical postfix
// indicating the reference to the respective student. This showcases the
// structuring of student information in a programmatic manner.
//
///////////////////////////////////////////////////////////////////////////////

#include <iostream>
#include <string>
#include <cstdlib>
#include <cstddef>

int main(void)
{
	// Student 01 Information.
	std::string student_01_name = "William jackson";
	std::size_t student_01_age = 18;
	std::size_t student_01_sin = 11328467;


	// Student 02 Information.
	std::string student_02_name = "Thomas Robinson";
	std::size_t student_02_age = 27;
	std::size_t student_02_sin = 03998451;
	
	
	// Student 03 Information.
	std::string student_03_name = "Michael Jackson";
	std::size_t student_03_age = 23;
	std::size_t student_03_sin = 03448391;
	
	
	return(EXIT_SUCCESS);
}
```



<br>
<br>
<br>


<p>
As we can witness, the only connection between these separate variables is a name assigned by the programmer, which is vulnerable to being altered, potentially breaking the relationship and hindering proper maintenance. For more experienced programmers, it can be beneficial to combine these distinct variables into a meaningful and complex data type, such as a struct (e.g., Student). This approach allows each Student to be treated as a discrete entity with the attributes mentioned before. Organizing the individual data elements this way makes the task more straightforward. While classes and objects can also be used, our current focus is solely on data, making a plain data wrapper like structs the most logical choice. However, a class can be employed if preferred. Below is an example of what our code would look like when using structs to create entities instead of individual variables:
</p>



<br>
<br>
<br>



```C++
///////////////////////////////////////////////////////////////////////////////
//
// Description:
// 
// This program demonstrates the creation of student entities through the
// composition of three individual variables that are tied together in a
// struct for each student. Each struct instance corresponds to a specific
// student, showcasing the use of structs to enhance the organization of
// student entities.
//
///////////////////////////////////////////////////////////////////////////////

#include <iostream>
#include <string>
#include <cstdlib>
#include <cstddef>

struct Student
{
    std::string name;
    std::size_t age;
    std::size_t sin;

	// Constructor for the struct.
    Student(const std::string& _name, std::size_t _age, std::size_t _sin)
        : name(_name), age(_age), sin(_sin)
    {
        std::cout << "Student name: " << name << "\n";
        std::cout << "Student age:  " << age  << "\n";
        std::cout << "Student sin:  " << sin  << "\n" << std::endl;
    }
};


int main(void)
{
    Student student_1("William jackson", 18, 11328467);
    Student student_2("Thomas Robinson", 19, 73998451);
    Student student_3("Michael jackson", 23, 63448391);


    return(EXIT_SUCCESS);
}
```



<br>
<br>
<br>


<p>
This method is indeed more manageable; however, challenges still exist. Whether we opt for the initial approach of utilizing individual variables or the alternative approach involving more advanced constructs like structs or objects, a fundamental question arises: "How do we efficiently handle a significant volume of data?". Many of you already possess some level of programming knowledge and are familiar with essential containers that aid in storing and retrieving individual elements within a dataset, such as arrays. Nevertheless, let's briefly imagine a scenario where you only have access to structs, objects, and variables. How would you approach complicated problems such as finding the student with the highest age, the student with a specific SIN number, changing the age of a particular student, etc?
</p>



<br>
<br>



<p>
In the absence of any prior knowledge or access to data structures and containers, including basic arrays, the only viable solution for the programmer is to manually search for the desired element using variable names, relying solely on visual inspection and then trying to manipulate the fields individually one by one. This process can prove challenging. Consider a scenario where an organization must update information for a student named "Alice" within a pool of 2,500 students (Assuming there are no duplicates). One would have to linearly scan through the student variables or structures to pinpoint the specific student structure corresponding to this information, which can be quite time-consuming. This is just one straightforward task within a relatively small set of data.
</p>



<br>
<br>

<p>
Another crucial dimension involves the algorithms our data structures employ to carry out these operations. How we address a problem can significantly affect the efficiency or potential of our functionalities, preventing them from taking merely a few seconds to hours or even more time to accomplish their task. Consider the scenario where we aim to find the student with the highest age among a pool of 2500 students. What if the chosen method for this task is extremely efficient, causing it to take an excessively long time? This highlights the importance of the methods we employ and the approaches we take to solve problems. These factors can drastically influence the computer's time and effort in problem-solving. This underscores another reason why learning and understanding these principles is crucial.

</p>


<br>
<br>


<p>
The complexity of dealing with large datasets becomes apparent quite quickly. As programmers, it is often our goal to link pieces of data so that they have some relationship. Additionally, we aim to incorporate specific and essential shared functionalities into entities that manage large data sets to enable us to perform the most common and crucial tasks expected of any reasonable container. The ability to analyze and manipulate large amounts of data is a vitally important skill in today's C++ programming environment. Therefore, we will examine data structures and the various algorithms they employ to manage large amounts of data efficiently. If this sounds like something you might be interested in learning more about, then this series of articles is what you are looking for.
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










### Basic terminology



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<p>
Your enthusiasm to dive headfirst into learning the various types of data structures and containers and their capabilities is admirable. However, every industry has a specific collection of terms, phrases, and standards that enable effective communication between different developers and creators. The realm of data structures and algorithms is no exception to this principle. Before discussing the various properties and capabilities of data structures and their respective functionalities, we must establish a common ground in understanding the fundamental terminology employed in this field. This foundational step ensures that all developers involved are aligned in their understanding of the concept, thus setting the stage for effective collaboration and comprehension as we navigate through the complexities of this domain.
</p>



<br>
<br>
<br>



<code><h3>Algorithms:</h3></code>

<p>
Interestingly, we've been employing an algorithm all along, up to this point in our careers as programmers. <span class="special">An algorithm is a collection of precise steps and instructions designed to guide a computer in solving a particular problem</span>. In computer programming, a single problem often spawns multiple solutions crafted by different programmers. The challenge lies in determining which algorithm will demonstrate superior performance and, most importantly, produce correct results, all while utilizing fewer resources. <span class="special">Analyzing algorithms is a process that involves identifying the most efficient algorithm that accomplishes the same task as its competitors in the shortest time and with the least memory usage</span>. As a demonstration, Let's imagine that we are tasked with creating an algorithm that can calculate the factorial of a given number by the user. We can approach this problem in two different ways: <span class="special">Recursively</span> and <span class="special">Iteratively</span>:
</p>



<br>
<br>
<br>



```C++
///////////////////////////////////////////////////////////////////////////////
//
// Description:
// 
// This program showcases an iterative method for computing the factorial
// of a user-provided number. It achieves this by employing a for-loop to
// sequentially multiply the current number by the next one in line.
//
///////////////////////////////////////////////////////////////////////////////

#include <iostream>
#include <string>
#include <cstdlib>

int calculate_factorial_iterative(int number);

int main(void)
{
	int number = 0;
	int output = 0;
    
	// Obtaining input.
	std::cout << "Please enter a positive integer: ";
    std::cin  >> number;
	
	// Calculating.
	output = calculate_factorial_iterative(number);
	
	// Printing output.
    std::cout << "Factorial with iterative approach: " << output << std::endl;
    
	return(EXIT_SUCCESS);
}


int calculate_factorial_iterative(int number)
{
    int result = 1;
	
	// As long as "current_number" has not reached "number".
    for(int current_number = 1; current_number <= number; ++current_number)
	{
        result *= current_number;
    }
	
    return(result);
}
```



<br>
<br>
<br>



<p>
Different algorithms can solve the same problem in many different ways using different solutions, and their efficiency can vary significantly. By understanding and comparing their performance characteristics, developers can choose algorithms better suited for specific tasks. This leads to faster and more responsive software applications. Different algorithms require varying amounts of computational resources, such as memory and processing power. <span class="special">It is essential to understand that there is no ideal algorithm; some algorithms are better suited for some situations than others</span>. Therefore, whenever an interviewer asks you the question, "Which data structure or algorithm do you think is best suited for this problem?" your answer should always be, "It depends! We need to analyze our solutions". Let's take a look at the second method, which uses recursive function calls to accomplish the same goal of finding the factorial of a number:
</p>



<br>
<br>
<br>



```C++
///////////////////////////////////////////////////////////////////////////////
//
// Description:
// 
// This program showcases a recursive method for computing the factorial
// of a user-provided number. It achieves this by employing a function that
// calls itself continuously until a certain condition is met.
//
///////////////////////////////////////////////////////////////////////////////

#include <iostream>
#include <string>
#include <cstdlib>

int calculate_factorial_recursive(int number);

int main(void)
{
	int number = 0;
	int output = 0;
    
	// Obtaining input.
	std::cout << "Please enter a positive integer: ";
    std::cin  >> number;
	
	// Calculating.
	output = calculate_factorial_recursive(number);
	
	// Printing output.
    std::cout << "Factorial with recursive approach: " << output << std::endl;
    
	return(EXIT_SUCCESS);
}


int calculate_factorial_recursive(int number)
{
    if(number <= 1)
	{
		return (1);
	}
    
	// Getting the number before the current one.
	int former_number = number - 1;
	
	return(number * calculate_factorial_recursive(former_number));
}
```



<br>
<br>
<br>








<p>
Some programmers may not be familiar with the concept of recursion. Since recursion is extensively utilized in the field of data structures and algorithms, we must understand its definition and functionality. <span class="special">Recursion is a programming concept in which a function calls itself in its definition</span>. Recursive functions consist of two main components: the base case and the recursive case. The base case signifies the condition under which the recursion stops, <span class="special">preventing an endless cycle</span> that could lead to a stack overflow (similar to preventing an infinite loop). On the other hand, the recursive case involves the function calling itself with modified arguments, <span class="special">aiming to bring the problem closer to the base case</span> (simplifying the problem) with each recursive call.
</p>

<br>
<br>

<p>
As programmers, we should be aware that when a function is called, a block of memory known as a "stack frame" is allocated on the call stack. This frame contains information about the function call, such as local variables and the return address. In the context of recursive functions, multiple stack frames are created as each recursive call is initiated. When a function is called, a stack frame is generated, and space is reserved for local variables. Successive recursive calls add new stack frames on top of the previous ones, collectively forming a "stack" of frames, commonly referred to as the call stack. Interestingly, it is called the "stack frame" because it behaves very similarly to a stack data structure, which will be discussed in more detail later in this series.
</p>

<br>
<br>

<p>
 The challenge arises when each function keeps invoking additional sub-functions within itself. Since each function persists until it completes its operation, it results in a stack of functions remaining idle for some time, occupying memory. As each function call reaches the base case and completes its operation, its stack frame is removed from the call stack, releasing the associated memory and returning results to the previous function call. Recursive functions can be resource-intensive and can create a lot of overhead, because they take time to allocate memory and set up. They can also sometimes be impossible to process due to the sheer amount of memory that they require.
</p>

<br>
<br>

<p>
You may have noticed that the above two algorithms accomplish the same task in completely different strategies and ways. Using an iterative loop is the first method, which takes far fewer resources than its recursive counterpart. Nevertheless, recursive methods are critical because they are more accessible to implement and understand, especially for the more complicated problems we will face later, making the iterative loop approaches almost impossible to implement. These are the reasons we have comparisons to see the advantages and disadvantages of each algorithm to determine which is more appropriate for the situation and resources available. Another example would be a program that can display the set of Fibonacci numbers:
</p>


<br>
<br>
<br>



```C++
///////////////////////////////////////////////////////////////////////////////
//
// Description:
// 
// This program showcases a recursive method for computing the set of Fibonacci
// numbers until a user-provided number. It achieves this by employing a
// function that calls itself continuously until a certain condition is met.
//
///////////////////////////////////////////////////////////////////////////////

#include <iostream>
#include <string>
#include <cstdlib>

int Fibonacci_recursive(int number);

int main(void)
{
    // Print the first 10 Fibonacci numbers.
    
    for(std::size_t index = 0; index < 10; ++index)
    {
        std::cout << Fibonacci_recursive(index) << " ";
    }
    
    std::cout << std::flush;
    
    return(EXIT_SUCCESS);
}


int Fibonacci_recursive(int number)
{
    if(number <=1)
    {
        return(number);
    }
    
    return Fibonacci_recursive(number -1) + Fibonacci_recursive(number -2);
}
```



<br>
<br>
<br>


<p>
Of course, in such scenarios, knowing which algorithm is better and more perforable is quite simple. However, sometimes our problems can become so complex and challenging to achieve that we prefer to come up with a method of approaching the problem that is not necessarily the most performant approach but is performant enough and, most importantly, helps us to understand and solve the problem in the most understandable way possible. For these reasons, we will prefer the recursive approach for solving problems much later in our discussions once we encounter complex data structures and problems so complex that they become virtually impossible to accomplish using regular loops. The following is the iterative approach, which is more performant but can be slightly challenging to write or think about:
</p>


<br>
<br>
<br>



```C++
///////////////////////////////////////////////////////////////////////////////
//
// Description:
// 
// This program showcases an iterative approach for computing the set of
// Fibonacci numbers until a user-provided number. It achieves this by
// employing a function that calls itself continuously until a certain
// condition is met.
//
///////////////////////////////////////////////////////////////////////////////

#include <iostream>
#include <string>
#include <cstdlib>

void fibonacci_iterative(int number);

int main(void)
{
    fibonacci_iterative(10);

    return(EXIT_SUCCESS);
}


void fibonacci_iterative(int number)
{
    int memory_1 = 0;
    int memory_2 = 1;
    int memory_3 = 0;

    for (std::size_t index = 0; index < number; ++index)
    {
        std::cout << memory_1 << " ";

        memory_3 = memory_1 + memory_2;
        memory_1 = memory_2;
        memory_2 = memory_3;
    }

    std::cout << std::flush;
}
```



<br>
<br>
<br>




<br>
<br>
<br>
<br>
<br>
<br>


<code><h3>Data structures:</h3></code>

<p>
Data structures are considered <span class="special">entities capable of grouping a tremendous amount of data based on similarity in type and behavior, enabling efficient manipulation of datasets and providing some standard functionality for better data manipulation</span>. These structures are commonly referred to as <span class="special">collections</span>, <span class="special">containers</span>, and the like. Data structures are fascinating because they uphold one of the most essential concepts in the programming bible, the principle of abstraction. Data structures shield us from unnecessary details and the complexities of manipulating and managing extensive datasets. They offer only the essential interfaces needed to work with them for programmers. Elements within a data structure have something in common, even if that thing is as simple as being of the same data type. So, which data structure is the best?
</p>



<br>
<br>



<p>
It is essential to understand the strengths and limitations of various data structures since there is no universal data structure appropriate for all tasks. Several factors must be considered to choose the proper data structure. Certain factors, including <span class="special">performance</span> and <span class="special">functionality</span>, are superior and generally taken into consideration first before anything else. The programmer will generally use a certain data structure more frequently if it is <span class="special">faster and more performant</span>. However, performance is not the only factor. To save us from having to come up with a solution to perform such a task, we may wish for our data structure <span class="special">to provide us with more functionality and capabilities that can benefit us by enabling us to perform some complex task</span> rather than being more performant. The following set of operations are the most common functionalities that are expected from every data structure:
</p>



<br>
<br>
<br>



<table>

  <colgroup>
    <col style="width: 20%;">
    <col style="width: auto;">
  </colgroup>
  
  <thead>
    <tr>
      <th style="text-align: left; padding: 10px 0px 10px 20px;">Operation</th>
      <th style="text-align: left; padding: 10px 0px 10px 20px;">Description</th>
    </tr>
  </thead>
  
  <!-- Insert -->
  <tbody>
    <tr>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Insert</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">The ability to add an element to the collection</td>
    </tr>
  </tbody>
  
  <!-- Remove -->
  <tbody>
    <tr>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Remove</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">The ability to delete an element from the collection</td>
    </tr>
  </tbody>
  
  <!-- Access -->
  <tbody>
    <tr>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Access</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">The ability to access an element in the collection</td>
    </tr>
  </tbody>
  
  <!-- Search -->
  <tbody>
    <tr>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Search</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">The ability to find an element in the collection if possible</td>
    </tr>
  </tbody>
  
  <!-- Traverse -->
  <tbody>
    <tr>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Traverse</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">The ability to go through each element, usually for the purpose of printing the entire collection</td>
    </tr>
  </tbody>
  
</table>



<br>
<br>
<br>



<p>
Like all other computer components, data structures follow specific sets of instructions to achieve their objectives. The performance of different data structures is determined by the algorithms and methods they employ to fulfill their tasks. Therefore, we introduce the concept of analyzing algorithms and seeking to compare their efficiency. Data structures and algorithms have been a massive part of computer science since the dawn of computers, as managing large amounts of data is trickier than it looks and can significantly impact our programs' performance. In the upcoming sections, we will focus on determining the efficiency of different algorithms by using special tools and mathematical notations that have been set as the standard and accepted among the programming world as the main tools to be used for this task. But, before that, we need to understand what performance is.
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








### Performance



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<p>
Before we can start measuring a data structure's performance, we need to answer a fundamental question: Why should we be concerned with the efficiency and resource demands of the algorithm employed by a data structure? The answer is: Because it makes a difference! While computers are becoming exceedingly faster and more powerful, the scale and complexity of the challenges have increasingly escalated along with the advancements. What adds further intrigue is that the performance of today's computers is primarily thanks to the endeavors of programmers who took the time to create new and improved methods and algorithms for solving these problems! We must develop and refine algorithms as they can significantly impact how well our machines perform their tasks in real-time.
</p>


<br>
<br>


<p>
A primary consideration when evaluating a data structure's effectiveness in completing its tasks is undoubtedly its performance. This leads us to a fundamental question: What is the meaning of performance in data structures and algorithms, and how can we measure it? The solution to this question involves categorizing performance into two key dimensions: Time complexity and Space complexity. Time signifies how quickly tasks can be executed and accomplished, measured in seconds, minutes, hours, days, weeks, or even longer and bigger scales such as months and even years if the problem is complicated. On the other hand, Space represents the resources needed to accomplish that task, such as the total amount of memory that needs to be consumed during execution.
</p>


<br>
<br>


<p>
Understanding these two categories is important because they typically involve a trade-off. When aiming to improve program execution speed, there is likely to be a corresponding increase in space and resource utilization. On the other hand, if the goal is to minimize space and resource consumption, it might lead to longer execution times. For instance, resource and space efficiency might be of minimal concern when using a powerful Google computer, whereas execution speed takes precedence. In contrast, with a personal desktop computer at home, space limitations will be more important to consider, and execution speed will be less of a concern, but it is still important nonetheless. Therefore, determining which factor is more critical relies entirely on the situation, objectives, and requirements. Sometimes, the best situation is to balance the time and space complexities.
</p>



<br>
<br>
<br>
<br>
<br>
<br>



##### Time complexity

<code><h3>Time complexity</h3></code>

<p>
Running time is a natural measure of goodness since time is a precious resource—computer solutions should run as fast as possible. Time complexity refers to the measurement and approximation of the amount of time an algorithm takes to accomplish its task and is commonly used as a term when dealing with an algorithm's running time. The central question is: How can we measure or predict the Time complexity of an algorithm? At first glance, most programmers will assume that the solution lies in timing the algorithm as it executes its operations, awaiting completion. Of course, this is an entirely natural assumption, even though it may contain hidden problems that we are unaware of.
</p>

<br>
<br>

<p>
We can study the running time of an algorithm or any program for a matter effect by executing it on a machine and recording the time spent in each execution. Fortunately, such measurements can be taken accurately using system calls built into and provided by the operating system. Using the native timing frameworks of each operating system and platform can, however, be challenging. Luckily, C++ has taken the initiative to create a library that allows us to use the default APIs of the native platform for measuring the amount of time it takes to use the clock system of each. The Chrono library is such that it is made available to us. For example, Let's try and create a piece of code that will enable us to measure the time that takes for a function to sum up the number 1 over a 1,000,000 times:
</p>

<br>
<br>
<br>



```C++
///////////////////////////////////////////////////////////////////////////////
//
// Description:
// 
// This program showcases how to measure the execution time of a function
// using the Chrono library available within C++ for interacting with the
// clock system of the underlying operating system.
//
///////////////////////////////////////////////////////////////////////////////

#include <iostream>
#include <string>
#include <cstdlib>
#include <cstddef>
#include <chrono>

std::size_t my_function(std::size_t total_iterations)
{
	std::size_t sum = std::size_t(0);
	
	for(std::size_t iteration = std::size_t(0); iteration < total_iterations; ++iteration)
	{
		sum += 1;
	}
	
	return(sum);
}


int main(void)
{
	// Creating time_stamps to record and hold the times.
	std::chrono::time_point<std::chrono::steady_clock> begin_time_stamp;
	std::chrono::time_point<std::chrono::steady_clock> end_time_stamp;
	
	
	// Recording the time before function starts.
	begin_time_stamp = std::chrono::steady_clock::now();
	
	my_function(1'000'000);
	
	// Recording the time after function finishes.
	end_time_stamp = std::chrono::steady_clock::now();
	
	
	// Calculating duration.
	std::chrono::duration<float, std::milli> duration = (end_time_stamp - begin_time_stamp);
	std::cout << "Duration was: " << duration.count() << "ms" << std::endl;
	
	
	return(EXIT_SUCCESS);
}
```



<br>
<br>
<br>


<p>
Chrono is a library for working with time and clocks. Within Chrono, three types of clocks are available: system_clock, steady_clock, and high_resolution_clock. The system_clock type is typically employed for scheduling dates in a calendar format, while steady_clock and high_resolution_clock are more suitable for precise timing mechanisms, making them ideal for measuring durations. To calculate the time a function or piece of code takes to execute, we create two time stamps: one before the function begins (e.g., begin_time_stamp) and one after it completes (e.g., end_time_stamp). These time points record the precise time before and after the statements are executed.
</p>

<br>
<br>

<p>
We determine the total duration by calculating the difference between these two time stamps. To accomplish this, we simply subtract the end point from the start point (e.g., begin_time_stamp - end_time_stamp) and we store it in a chrono::duration type and specify the format to be float and miliseconds. Once we are ready to print the duration we call the count() function to count the number of elapsed ticks. The Chrono library is quite sophisticated, and covering its entirety in one explanation is not feasible. Nevertheless, the knowledge provided here should be sufficient for us to create a primary timer and evaluate the performance of our functions.
</p>

<br>
<br>

<p>
The C++ language is comprised of two key components: "C" and "++," with the "++" part representing the concept of classes and objects within the object-oriented programming (OOP) world. For this reason, many methods in C++ can be implemented in two distinct manners: The C way and the ++ way. We just covered how to use the more modern ++ way by utilizing the Chrono library, but there is also a C way to approach this problem. We approach this problem now in the C way, which is essentially the same. We create two time stamps, each representing a time recording before and after the function executes. We give our two time stamps the same names as before.
</p>

<br>
<br>

<p>
We record these times using a function called "timespec_get" by passing in a reference that modifies their content. A timespec struct has two members one is called tv_sec that contains the whole seconds passed and the other is called tv_nsec which contains the number of nano seconds passed which is more accurate. In order to get a correct number we need to make sure that we subtract both of these fields and add them together. If we omit the nano seconds part chances are that we will always get 0 because some operations are so fast that they do not even reach seconds! We must also not forget to convert nano seconds to seconds before attempting to add them togther. This concept is demonstrated with the below code segment in detail:
</p>


<br>
<br>
<br>



```C++
///////////////////////////////////////////////////////////////////////////////
//
// Description:
// 
// This program showcases how to measure the execution time of a function
// using the C library of "ctime" available within C++ for interacting
// with the clock system of the underlying operating system.
//
///////////////////////////////////////////////////////////////////////////////

#include <iostream>
#include <string>
#include <cstdlib>
#include <cstddef>
#include <ctime>

std::size_t my_function(std::size_t total_iterations)
{
	std::size_t sum = std::size_t(0);
	
	for(std::size_t iteration = std::size_t(0); iteration < total_iterations; ++iteration)
	{
		sum += 1;
	}
	
	return(sum);
}


int main(void)
{
	// Creating time_stamps to record and hold the times.
	struct timespec begin_time_stamp;
	struct timespec end_time_stamp;
	
	
	// Using the function to record the time before function starts.
	timespec_get(&begin_time_stamp, TIME_UTC);
	
	my_function(1'000'000);
	
	// Using the function to record the time after function finishes.
	timespec_get(&end_time_stamp, TIME_UTC);
	
	
	// Calculating whole seconds.
	double whole_seconds = (end_time_stamp.tv_sec - begin_time_stamp.tv_sec);
	
	// Calculating floating point seconds through nano seconds.
	double float_seconds = (end_time_stamp.tv_nsec - begin_time_stamp.tv_nsec) / 1'000'000'000.0;
	
	// Calculating final seconds.
	double duration = whole_seconds + float_seconds;
	
	
	std::cout << "Duration was: " << duration << "ms" << std::endl;
	
	
	return(EXIT_SUCCESS);
}
```

<br>
<br>
<br>


<p>
Suppose you execute the code that sums the elements and try to measure the time the program takes using either the method with the Chrono library or the C way with the CTime library to calculate the duration on your machine. In that case, it's exciting that it runs in less than ten seconds, one second, five milliseconds, or even one nano-second, depending on your hardware! However, understanding the significance of these time measurements is crucial. Is running in less than ten seconds considered good? How about 2 seconds – is that fast or slow? Moreover, can we expect our code to maintain the same speed when performing a billion operations?
</p>

<br>
<br>

<p>
Often, there is a false belief that a single-time measurement under random settings and environmental conditions can efficiently reflect the performance of our algorithm in terms of time complexity. Estimating performance in the manner we just discussed can be unsafe because the time required for an algorithm to complete its task is influenced by the hardware it operates on and the execution environment. Even if the underlying algorithmic efficiency remains consistent, the same algorithm may execute more rapidly on a high-end machine than on a low-end one. You will likely observe varying time measurements when attempting to run this code on devices with diverse hardware capabilities.
</p>

<br>
<br>

<p>
The problem is not the act of measuring time itself but instead attempting to compare the time measurements across different devices under different settings and capabilities, which can often be misleading. Instead, we must calculate the time differences and growth for a particular machine's performance across multiple instances of input requests under the same settings and environment. Conditions are subject to change, and therefore, it is often more prudent to observe how performance evolves with increasing problem sizes through graphs and calculations. Analyzing a set of numbers collectively provides a more insightful understanding.
</p>

<br>
<br>

<p>
The challenge in this endeavor lies in conducting sophisticated measurements, a task that requires ample resources and time. Unfortunately, many programmers lack the luxury of such extensive resources. While time-based approaches are convenient and suitable for comparing execution times with previous attempts, other means of estimating performance exist. Consequently, there is a need for a method that establishes an acceptable approximation of algorithmic performance that remains unaffected by environmental variables. Indeed, such a method exists and is used widely among programers for estimating Time complexity and we will discuss this in the next part.
</p>



<br>
<br>
<br>
<br>
<br>
<br>



<code><h3>Space complexity</h3></code>


<p>
Measuring the memory usage of our algorithms and programs in general should be easy. Since we allocate memory using either variables whose sizes can be easily predicted or different calls to memory, such as malloc and calloc, inherited from the C language or the new keyword, which is more commonly used in C++, it should seem easy to measure, but the reality is quite different. The problem is how memory is laid out and allocated to each process. Again, I recommend reading a book on this topic if you want a complete and in-depth explanation. But, for this series, all you need to know is that memory is generally allocated in chunks, commonly referred to as pages, for better performance and maintenance reasons.
</p>

<br>
<br>

<p>
Depending on your machiens architecuter and various other factors the size of each page can vary in size. Upon execution of our programs, the operating system will allocated a certain amount of these pages to our program. We may endup using these pages or just a portion of them. So, this makes it difficult to access specific and single byte sized elements such as variables or heap memory allocation calls. For example, let's say I make a call to malloc or new keyword that allows me to request additional 8 bytes of memory from my machine. If the operating system has given me 3 pages, with each page worth 4 bytes from before hand. That means that I have 2 pages that are already empty and can accomodate the request. Therfore, my memory usage stays the same at 12 bytes (3 times each page which is >> 4.3 = 12)
</p>

<br>
<br>

<p>
Another scenario would be if our program needs an andditional 2 bytes of memory, but all pages are currently full, we would have to allocate an entire new page worth of 4 bytes for example, even tough we may not neccessarilly need the 2 extra bytes. THis makes our memory consumepiton go up higher than it actually is. This hopefully introduces the complextiies of having to deal with memory usage measermente. As we can see it is not quite simple to figure out how much memory our algorthims are really taking up accurately. But, fear not! there is always a way to at least get a rough estimate of what we are having to consume.
</p>

<br>
<br>

<p>
Montoring the space and memory usage of an algorithtm or program under Unix-based operating systems is quite easy. One can use tools such as Top or Valgrind in the terminal to get suphisicated memsurments of memory usage. On a Windows based platform the best approach would be to probably use the Visual Studio analysis tools. If you do not want to use any external tools then the only solution would be to use default native APIs of Windows and Unix based operating systems. There’s a system call for Windows: GetProcessMemoryInfo for Windows, "getrusage" for most Unix based sytmes. If you would like to know more about them I highly recommend checking the documentations for these APIs.
</p>



<br>
<br>
<br>
<br>
<br>
<br>



<code><h3>Conclusion</h3></code>

While experimental studies of running times and measureing the memory usage using tools such as visual Studio and others are useful, they have three major
limitations:
• Experiments can be done only on a limited set of test inputs; hence, they
leave out the running times of inputs not included in the experiment (and
these inputs may be important).
• We have difficulty comparing the experimental running times of two algorithms unless the experiments were performed in the same hardware and
software environments.
• We have to fully implement and execute an algorithm in order to study its
running time experimentally. For these reasons we will see some other tool in the next part that will help us in determining thsee complexties in a much more better and suitable way

<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->








### Asymptotic analysis



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<p>
Time-based assessments of algorithms, especially those conducted by programmers or companies with a lot of resources, are a viable approach. However, only some have the ability, time, and resources to perform such sophisticated measurements. Most programmers seek a quick and approximate evaluation of their algorithm's performance in terms of time and space complexity. This is where asymptotic analysis comes into play. Asymptotic analysis involves using mathematical tools to study an algorithm's performance. More specifically, asymptotic notation is the principle where we try to understand how our functions behave and look as they reach an infinitely large number on a graph. Rather than fixating solely on hardware measurements, which can be heavily influenced by the factors discussed earlier, we can instead focus on observing how computational time and resources increase concerning the volume of requests and input changes.
</p>



<br>
<br>

Asymptotic notations are helpful because they can tell us how the function will eventually behave. Sometimes, we may see our functions perform very well for some small input, but once we see how they act as input reaches an infinitely large scale, only then can we assume what will happen. Another benefit of Asymptotic notations is that they allow us to get a rough estimate of our performance before our code is even fully ready or implemented, which is something that the physical measurements do not allow us to perform. We can analyze our functions regarding asymptotic notation from three different forms: lower bound (Big-Omega (Ω)), upper abound (Big-O (O)), and average bound (Big-Theta (Θ)). Let's discuss each of these concepts in more depth.





<br>
<br>
<br>
<br>
<br>
<br>



<code><h3>Big-Omega (Ω)</h3></code>

<p>
Omega notation, often denoted as Ω (pronounced "big omega"), is a mathematical notation used in computer science and mathematics to describe the lower bound of the time complexity of an algorithm or the growth rate of a function. In the context of time complexity, it characterizes the best-case scenario, representing the minimum time required for an algorithm to execute a specified number of instructions. Omega notation is frequently called the "ideal" scenario, though it is important to note that such ideal conditions are rarely encountered in practice. For this reason, even though it is a very important factor, it will commonly not be prioritized by programmers and developers.
</p>



<br>



<code><h3>Big-Theta (Θ)</h3></code>

<p>
Theta notation, often denoted as Θ (pronounced "Big Theta"), is a mathematical notation used in computer science and mathematics to describe the lower and upper bound of the time complexity of an algorithm or the growth rate of a function. In the context of time complexity, it characterizes the average-case scenario, representing the average amount of time required for an algorithm to execute a specified number of instructions. Theta notation is frequently referred to as the "comman" scenario. Theta notation is much more common to be discussed in comparison to Omega notation. For this reason, even though it is a significant factor, it will commonly not be prioritized by programmers and developers.
</p>



<br>



<code><h3>Big-O (O)</h3></code>

<p>
Big-O notation, often denoted as Θ (often referred to as just "Big O"), is a mathematical notation used in computer science and mathematics to describe the upper bound of the time complexity of an algorithm or the growth rate of a function. In the context of time complexity, it characterizes the worst-case scenario, representing the maximum amount of time required for an algorithm to execute a specified number of instructions. Big-O notation is more commonly used among programmers as it desribes the worst possible case their algoritm can run. For this reason, Big-O will typically be prioritized by programmers and developers.
</p>



<br>
<br>
<br>
<br>
<br>
<br>



<code><h3>Conclusion</h3></code>

<p>
Big-O stands out as the most frequently employed notation for characterizing algorithm performance among the trio of asymptotic notations. When programmers mention terms like "My algorithm's performance is linear" or say, "This algorithm operates in constant time," they are likely referring to Big-O notation. But why is this the case? Big-O notation emphasizes an algorithm's worst-case time complexity. In other words, understanding how an algorithm behaves under worst-case conditions is often critical because performance bottlenecks are most likely to manifest in these scenarios. Also, knowing the worst-case scenario acts as a guarantee. We cannot always say if our algorithm will perform well, but knowing how it will do in the direst situations is more understandable.
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








### Determine time complexity with Big-O notation



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->




<p>
We need to establish a set of rules to use asymptotic notations to determine an algorithm's performance from both time and space complexity aspects. Performance in asymptotic notations is calculated by seeing how the total number of operations change as the input size grows, but what operations do we use as a counting measure? And how do we determine the input size that influences the number of operations? In asymptotic notations, we use the number of primitive operations as a measurement tool. A primitive operation corresponds to a low-level instruction with an execution time close to constant. We use the word "close" as we cannot guarantee that these operations will be consistent all the time as many factors, such as the programming language itself, can contribute to this factor. But, for simplicity, we will think of primitive operations as constants with a very low cost.
</p>

<br>
<br>

<p>
A few examples of what can be considered primitive operations are assignment statements, function calls, arithmetic operations, comparison operations, array indexing, following an object reference, and Returning data from a function. Even though each of these operations is slightly different from the other, instead of trying to determine the specific execution time of each of them, we simply disregard the individual and meaningless little differences in time. This way, all simple operations are the same and considered equal, and the piece of code that has the most effect on our program's performance will be the piece that performs the heaviest number of primitive operations. In other words, the most crucial piece acts as a multiplier where it increases the number of primitive operations that we perform by some number.
</p>


<br>
<br>

<p>
The only question at this point is what can be considered the growth of input size and what part of our codes are most affected by them? As mentioned before, the most essential parts of our algorithms and programs, in general, are the pieces that perform the most primitive operations, and they multiply the number of operations by some number; that number is precisely what we are looking for. Complex code structures that can have a more significant influence include loops, functions, classes, etc. These control structures and the amount of work they perform are generally influenced by some data type, such as integers that determine the number of times they execute and, therefore, are counted as the growth number for the input size. For example, if a loop iterates 20, 50, or 100 times, the number of primitive operations will be 20, 50, or 100 times more. Let's try and analyze the following codes performance using this method:
</p>


<br>
<br>

```C++
#include <iostream>
#include <iomanip>
#include <random>


int main(int argc, char* argv[])
{
	std::random_device random;
	std::uniform_int_distribution<int> distribution(1, 30);
	
	
	std::cout << "Winning Numbers are:" << "\n\n";
	
	// Generating 10 random numbers and print them.
    for (int iteration = 0; iteration < 10; ++iteration)
	{
        std::cout << std::setw(2) << std::setfill('0') << distribution(random) << "\n";
    }

    std::cout << "\n" << "Congratulations to the winners!" << std::endl;
    
	
	return (0);
}
```


<br>
<br>

<p>
Now that we know how to look at a piece of code and determine the number of operations let's look at the most common scenarios we encounter for algorithms and their performance in the real world. While no comprehensive reference list provides exact quantitative measurements for the performance of algorithms, there is encouraging news. Many programmers and scientists have conducted extensive research and experiments, resulting in well-established common scenarios related to Big-O notation and performance. These insights provide general guidelines and categorizations that programmers can use to understand the relative performance of their algorithms. When attempting to evaluate the time complexity of an algorithm using Big-O Notation, we can refer to the list below to gain a broad understanding of the algorithm's current performance status:
</p>

<br>
<br>

<table>

  <colgroup>
    <col style="width: 20%;">
    <col style="width: 20%;">
    <col style="width: auto;">
  </colgroup>
  
  <thead>
    <tr>
      <th style="text-align: left; padding: 10px 0px 10px 20px;">Name</th>
      <th style="text-align: left; padding: 10px 0px 10px 20px;">Symbol</th>
      <th style="text-align: left; padding: 10px 0px 10px 20px;">Performance description</th>
    </tr>
  </thead>
  
  <!-- Constant -->
  <tbody>
    <tr>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Constant</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 2</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 3</td>
    </tr>
  </tbody>
  
  <!-- Logarithmic -->
  <tbody>
    <tr>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Logarithmic</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 2</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 3</td>
    </tr>
  </tbody>
  
  <!-- Linear -->
  <tbody>
    <tr>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Linear</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 2</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 3</td>
    </tr>
  </tbody>
  
  <!-- Linearithmic -->
  <tbody>
    <tr>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Linearithmic</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 2</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 3</td>
    </tr>
  </tbody>
  
  <!-- Quadratic -->
  <tbody>
    <tr>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Quadratic</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 2</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 3</td>
    </tr>
  </tbody>
  
  <!-- Exponential -->
  <tbody>
    <tr>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Exponential</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 2</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 3</td>
    </tr>
  </tbody>
  
  <!-- Factorial -->
  <tbody>
    <tr>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Factorial</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 2</td>
      <td style="text-align: left; padding: 10px 0px 10px 20px;">Content 3</td>
    </tr>
  </tbody>
  
</table>



<br>
<br>
<br>
<br>
<br>
<br>



<code><h3>Constant</h3></code>



<p>
The optimal performance that an algorithm can achieve in terms of Big-O notation is constant time, denoted as O(1). A Big-O of 1 signifies that the algorithm consistently completes its task in the same amount of time, regardless of the input data size. Achieving a genuinely constant algorithm is exceedingly challenging. While we can come very close to it, achieving a full, constant performance is usually only possible if the algorithm's task is very simple. Examples of operations of constant performance include basic arithmetic operations, such as addition, subtraction, multiplication, and division involving fixed-size integers or floating-point numbers. Furthermore, straightforward variable declaration and assignment statements also fall under the constant performance category.
</p>



<br>
<br>


<p>
It is important to note that there is a common misconception among programmers regarding the distinction between being constant and being fast. When we talk about a constant algorithm, we mean it maintains a consistent runtime with every execution. However, this does not imply that the algorithm is necessarily fast. For example, it might take 1 minute and 37 seconds to accomplish the algorithm's task, even for a small input size. The advantage lies in that regardless of whether it is processing a single data point or a million data points, it will consistently take the same 1 minute and 37 seconds. The true power of this characteristic becomes apparent as the volume of data increases. Let's take a look at an example:
</p>


<br>
<br>



```C++
#include <iostream>
#include <iomanip>
#include <random>


int main(void)
{
	std::random_device random;
	std::uniform_int_distribution<int> distribution(1, 30);
	
	
	std::cout << "Winning Numbers are:" << "\n\n";
	
	// Generating 10 random numbers and print them.
    for (int iteration = 0; iteration < 10; ++iteration)
	{
        std::cout << std::setw(2) << std::setfill('0') << distribution(random) << "\n";
    }

    std::cout << "\n" << "Congratulations to the winners!" << std::endl;
    
	
	return (0);
}
```



<br>
<br>



<p>
The code above uses "std::random_device" to produce random numbers constrainted to the range of 1 to 30 via a "std::uniform_int_distribution". The time complexity associated with declaring, creating, and utilizing these two objects, along with the assignment and print operations, can all be regarded as constant. However, our primary focus lies on the for-loop structure. Despite the fact that the for-loop attempts to iterate 10 times, generating and printing a random number on each iteration, it consistently repeats this process 10 times whenever the program is executed. In other words, the number of iterations that the for-loop does have no relationship with any kind of input data. The for-loop's time complexity remains constant.
</p>


<br>
<br>


<p>
A real-world example of something constant could be the traditional example of a jar of beans. If you are asked to find out how many beans are in a jar, you could take the approach of taking out the beans one by one and counting them. The task may require a significant amount of time to complete. However, if the jars are labeled with the amount, one can instantly determine the number of beans inside each jar regardless of their scale or size. It will take a person the same amount of time each run to determine how many beans are in each jar, irrespective of the size of the jar and the amount of beans in it.
</p>


<br>
<br>
<br>
<br>
<br>
<br>



<code><h3>Logarithmic</h3></code>

<p>
A logarithmic algorithm is one whose time complexity increases as the input size grows, but this increase occurs significantly slower than expected. They are often represented as O(log n), where "n" signifies the size of the input data. These algorithms typically involve dividing the input into smaller chunks and processing one segment at a time. This approach allows the algorithm to substantially reduce the problem size with each step, often halving it compared to the original size. Logarithmic algorithms are exceptionally efficient for handling large datasets because their time complexity grows much slower than others in the table set. They are frequently employed for tasks with a divide-and-conquer strategy, progressively eliminating half of the remaining possibilities at each step. Logarithmic algorithms represent the closest approximation to constant time complexity in performance.
</p>



<br>
<br>


<p>
Detecting whether an algorithm shows logarithmic behavior can be challenging, mainly when dealing with complex algorithms. One reason for this challenge in understanding logarithmic behavior is that it diverges from our everyday experiences. For instance, in our daily lives, we typically handle situations sequentially, serving customers one by one in a linear fashion at a restaurant rather than attempting to divide them into halves and employing a divide-and-conquer approach. This tendency to approach tasks linearly is mirrored in other aspects of life, like serving customers at a bank or parking cars in a parking lot. Due to these linear processes, programmers often need help identifying a logarithmic algorithm. Let's look at one example and try to see why it evaluates to a logarithmic time complexity:
</p>



<br>
<br>


<p>
Let's discuss a real-world example. Imagine you have purchased a new book about romance and are eager to find a paragraph within a particular chapter. You have two choices for finding the paragraph: Start from the very first page and keep turning pages until you eventually find the chapter you desire. This method involves checking each page individually, which could be time-consuming, especially in a long book. Alternatively, you can use a more efficient process. Begin by examining the table of contents, organized alphabetically by chapters. This step allows you to pinpoint the chapter you want to read immediately. By doing so, you've effectively reduced your search by nearly half of the book's content, as many chapters have been skipped. Within the selected chapter, you might find subcategories or subsections. You can continue to apply the approach. Divide the content into two, focus on one half based on the alphabetical order or any other criterion, and repeat until you locate the specific sentence you seek.
</p>



<br>
<br>



<p>
The key idea here is that you are halving the search space at each step, which leads to a logarithmic reduction in the number of possibilities you need to examine. This method demonstrates logarithmic time complexity because the time it takes to find your desired paragraph grows slowly, proportional to the logarithm of the number of possibilities (in this case, the number of pages or chapters in the book). This is much faster than a linear search, especially for large datasets. Another example of logarithmic time complexity is a standard algorithm known as the "Binary search," which will be explained in later sections. It is generally challenging to explain logarithmic algorithms as they are scarce since they introduce incredible performance. However, rest assured that we will cover many of them throughout this entire series.
</p>


# Linear search checks each element in the array one by one, making it O(n).
Linearithmic Time (O(n log n)):

Description: Linearithmic time complexity grows slower than quadratic but faster than linear. It's often seen in efficient sorting algorithms.

Example:

python
Copy code
def merge_sort(arr):
    if len(arr) <= 1:
        return arr
    mid = len(arr) // 2
    left_half = merge_sort(arr[:mid])
    right_half = merge_sort(arr[mid:])
    return merge(left_half, right_half)

def merge(left, right):
    result = []
    i = j = 0
    while i < len(left) and j < len(right):
        if left[i] < right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1
    result.extend(left[i:])
    result.extend(right[j:])
    return result

# Merge sort divides the input in half recursively and then merges the halves.
# Its time complexity is O(n log n).
Quadratic Time (O(n^2)):

Description: Quadratic time complexity means that the algorithm's running time grows with the square of the input size. It's often seen in algorithms with nested loops.

Example:

python
Copy code
def bubble_sort(arr):
    n = len(arr)
    for i in range(n):
        for j in range(0, n-i-1):
            if arr[j] > arr[j+1]:
                arr[j], arr[j+1] = arr[j+1], arr[j]

# Bubble sort compares and swaps elements, leading to O(n^2) time complexity.
Exponential Time (O(2^n) or O(k^n)):

Description: Exponential time complexity means that the running time grows exponentially with the input size, making it highly inefficient.

Example:

python
Copy code
def fibonacci_recursive(n):
    if n <= 1:
        return n
    else:
        return fibonacci_recursive(n-1) + fibonacci_recursive(n-2)

# The Fibonacci recursive function has exponential time complexity O(2^n).
Factorial Time (O(n!)):

Description: Factorial time complexity means that the running time grows at a rate of n factorial. It's extremely inefficient and is often impractical for large inputs.

Example:

python
Copy code
def permutation_recursive(arr):
    if len(arr) == 1:
        return [arr]
    permutations = []
    for i in range(len(arr)):
        first_elem = arr[i]
        remaining_elems = arr[:i] + arr[i+1:]
        for perm in permutation_recursive(remaining_elems):
            permutations.append([first_elem] + perm)
    return permutations

# This recursive function generates all permutations of an array.
# It has factorial time complexity O(n!).
These examples should provide you with a better understanding of time complexities and how they relate to the efficiency of algorithms. Remember that choosing the right algorithm for a specific problem often involves considering both time and space complexities, as well as other practical factors.



Certainly! An algorithm that is considered to be linear typically refers to its time complexity. In computer science and mathematics, the term "linear" is often used to describe an algorithm's behavior in relation to the size of its input data. Specifically, a linear algorithm has a time complexity that grows linearly with the size of the input. This means that as the input data increases, the time it takes for the algorithm to complete also increases at a constant rate.

Let's delve deeper into the meaning and behavior of a linear algorithm:

1. Time Complexity:

In Big O notation, a linear algorithm is denoted as O(n), where "n" represents the size of the input data. This notation provides an upper bound on the growth rate of the algorithm's running time concerning the input size.
2. Behavior:

Linear algorithms have a direct and proportional relationship between the input size and the number of operations or steps required to solve the problem.
For each additional data element in the input, a linear algorithm typically performs a fixed number of operations. This means that if you double the input size, the algorithm will roughly take twice as long to execute.
3. Examples:

Linear search: When searching for an element in an unsorted list, you may need to examine each element one by one. This is a linear operation because the time it takes is directly proportional to the size of the list.
Calculating the sum of elements in an array: To find the sum of all elements in an array, you need to iterate through each element once. The time taken is linear in relation to the number of elements in the array.
4. Characteristics:

Linear algorithms are generally straightforward and easy to implement.
They are well-suited for problems where you need to process each element of the input data exactly once.
Linear algorithms tend to have good performance for small to moderately sized datasets but may become inefficient for very large datasets because the time required grows proportionally with the data size.
5. Visual Representation:

If you were to plot the time taken by a linear algorithm on a graph, you would typically see a straight line, which reflects the linear growth in time as the input size increases.
6. Complexity Analysis:

When analyzing the complexity of a linear algorithm, you can often count the number of iterations or operations in a loop that processes the input data. The number of iterations will be directly proportional to the size of the input.
In summary, a linear algorithm has a time complexity of O(n), meaning its running time grows linearly with the size of the input. This behavior is characterized by a constant relationship between the input size and the number of operations performed, making linear algorithms suitable for many practical tasks, especially when dealing with reasonably sized datasets.



In terms of space complexity, the code doesn't use any data structures that grow with the input, so it can be considered O(1) in terms of space.




Final notes:

I often view C++ as the combination of "C" and "++". I know this may sound wierd, but the reasno for this is because usually for every solution that uses a "C" based approach, there is usually a corresponding modern "++" way of doing it. For this reason in the next part and the parts to come after that when we talk about STL containers I will try and show both ways of doing the "C" way and the "++" way, so you can choose which way to do it. But, wait a minute! What is STL?... Look at udemy C++ video and write about here briefly.

C++ is a powerful and flexible programming language, which was designed to
build upon the constructs of the C programming language. Thus, with minor exceptions, C++ is a superset of the C programming language. C++ shares C’s ability
to deal efficiently with hardware at the level of bits, bytes, words, addresses, etc.
In addition, C++ adds several enhancements over C (which motivates the name
“C++”), with the principal enhancement being the object-oriented concept of a
class







You may notice that as we create the functionality and algorthims in this walktrough, we will try to create them as separate functions to the data types and calsses and containers that they handle as much as possible. This is since we generally want our functions to be able to be portable and work with any data type without being specifically tide or implemented into a specific container type. Furthermoer, many containers are either baked into the language or weer defined previously which restricts us from being able to modify them in the first place.













When trying to explain each of the functionalities mentioned above (insert, search, access, traverse, deletion, etc...) we will not nccessarilly do them in a predefined order as explaining some of them may influnece and have a big impact of understanding alot of other operations. Therefore, I will explain each one as I see fit first that may have the biggest impact in understanding others.



One more important note of the basic operational expectations for each data structure is that each of them may created multiple sub set of operations aswell. Meaning that each operation can have 2, 3, or even more variations as to hawe they approch the functionality. For example, we could have 3 different methods of inserting an element into a data structure depending on the needs and characteristics of the operations.






Examples of finding the Big-O notation:



2n^2+ 7n + 65

n(n+4) + 40
nlogn + 10logn^2











Example for constant O(1):

Imagine you have a sorted array of numbers from lowest to highest. Finding the lowest or highest number is constant because their positions are always at the front and back respectively.




We use asypmtotic notations and Big-O not because we love math, but rathre we would like to use these tools to quickly and effeciently find a rough estimate of how our program will perform without having to setup complex testing environmest nor having to implement our algorithm completely and finalizing it.














Algorithms can either be very performant or be very elegant. elegnat means that either very readabel and understandable.


Time complexity: The amount of work that an algorithm performs as the number of input requests increas over time. Every algorithm can be represented using a mathematical function called "Growth Rate Function" which enables us to establish a relationship between how the increase in the number of input requests can influence the outcome or performance of our algorithm. Big-O notation studies the upper bound limitation of the growth rate function. Meaning how much time the algorithm will take at the maximum without crossing a praticular boundary.





Recursive functions are commonly used in a methodology called "Divide and Conquor"






// Maybe it would be better to have one ADT called "Container" that has general purpose funcitons for all container types. You could start by just making simple classes and at the end talk about how to turn all of them [array, vector, list, etc.] into one common interface.


Traversing data structures can also be useful if you want to figure out the size of that data structure because you may not neccessarilly want to keep track of the size individiually for whatever reason. Maybe you want to search for an element and you need go through each element, maybe you want to find the correct place for inserting an element or to find an element that needs to be deleted. Traversing is very important because it influences other operations heavilly.


When creating your array, vector, linked list, etc... custom classes you could specify at the very top using comments what the Big-O() of each of them shoud be and whta they do...


use  return EXIT SUCCESS;  where possible



Add a section or an entire new part that talks about templates in depth as well.

<p>

A few words of caution about evaluating Big-O. First,
note that the use of the big-Oh and related notations can be somewhat misleading
should the constant factors they “hide” be very large. For example, while it is
true that the function 10100n is O(n), if this is the running time of an algorithm
being compared to one whose running time is 10nlog n, we prefer the O(nlogn)
time algorithm, even though the linear-time algorithm is asymptotically faster. This
preference is because the constant factor, 10100, which is called “one googol,” is
believed by many astronomers to be an upper bound on the number of atoms in
the observable universe. So we are unlikely to ever have a real-world problem that
has this number as its input size. Thus, even when using the big-Oh notation, we
should at least be somewhat mindful of the constant factors and lower order terms
we are “hiding.”



To illustrate a constant-time algorithm, consider the following C++ function, which
returns the size of an STL vector, that is, the current number of cells in the array:
int multiply(const int& number, number_2) {
return number * number_2;
}
This is a very simple algorithm, because the size of a vector is stored as a
member variable in the vector object, so it takes only a constant-time lookup to
return this value. Thus, the capacity function runs in O(1) time; that is, the running
time of this function is independent of the value of n, the size of the array.
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