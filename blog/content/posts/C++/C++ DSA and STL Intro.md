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
A program consists of a sequential set of instructions that are executed one after the other, with each instruction operating on a distinct piece of data. As our programs grow in size and complexity, it becomes increasingly challenging to effectively monitor and manage these datasets solely using conventional variables, objects, and structs. Opting to utilize such solutions can quickly lead to unmanageable situations. This is because these storages are not engineered to handle extensive data loads; their design centers around managing and representing singular units of information or entities. Let's demonstrate this concept with a simple example. Imagine you have a classroom full of students, and you intend to store information about every student, including their name, age, and SIN number. If you decide to employ distinct variables for each student, the code will be similar to the following:
</p>



<br>
<br>
<br>



```C++
#include <iostream>
#include <string>


int main(int argc, char* argv[])
{
	std::string student_01_name = "William jackson";
	int student_01_age = 18;
	int student_01_sin = 11328467;

	
	std::string student_02_name = "Thomas Robinson";
	int student_02_age = 27;
	int student_02_sin = 03998451;
	
	
	std::string student_03_name = "Michael Jackson";
	int student_03_age = 23;
	int student_03_sin = 03448391;
	
	
	// This continues...
	
	return (0);
}
```



<br>
<br>
<br>


<p>
For a more experienced programmer, it may be benefetial to combine these distinct data elements into one meaningful complex data type, such as a <span class="special">struct named "Student"</span>. As a result of this approach, each student can be treated as a distinct entity, complete with attributes such as "name", "age", and "sin". Because this organization combines the individual data elements, the task is simplified. It is also possible for programmers to use classes and objects, but since we are concerned with only the data so far, a straightforward data container structure seems to make the most sense. <span class="special">Nevertheless, a class can be used if desired</span>. In my opinion, structs are better suited for entities whose sole purpose is to contain data, as they align better with my understanding of the concept. The following is an example of what our code would look like if we used structs and created "Student" entities instead of using individual variables:
</p>



<br>
<br>
<br>



```C++
#include <iostream>
#include <string>


struct Student
{
    std::string name;
    int age;
    int sin;

    Student(const std::string& _name, int _age, int _sin)
        : name(_name), age(_age), sin(_sin)
    {
        std::cout << "Student name: " << name << "\n";
        std::cout << "Student age:  " << age  << "\n";
        std::cout << "Student sin:  " << sin  << "\n" << std::endl;
    }
};


int main(int argc, char* argv[])
{
    // This feels much cleaner already...

    Student student_1("William jackson", 18, 11328467);
    Student student_2("Thomas Robinson", 19, 73998451);
    Student student_3("Michael jackson", 23, 63448391);

    // This continues...

    return (0);
}
```



<br>
<br>
<br>



<p>
No matter whether we choose to utilize the initial approach with individual variables or to employ more complex entities such as structs or objects, we are still faced with a fundamental challenge: <span class="special">"How do we effectively manage a substantial volume of data?"</span>. It becomes even more challenging when we seek to integrate specific and critical functionalities that can also be applied to the set of data. Let us consider the scenario in which your organization needs to update a student named "Alice" among a pool of 2500 students. To locate the student structure that matches the description, you will need to manually search through the student variables or structures which can take quite the effort and time to accomplish. This is just one, straightforward task contained within a relatively small dataset. What if we are asked to complete other operations, such as identifying students with specific Social Security numbers, identifying students with the youngest ages, and other tasks among a much larger set of data, such as 100,000 students?
</p>



<br>
<br>



<p>
The complexity of dealing with large datasets becomes apparent quite quickly. It is often our goal, as programmers, to link pieces of data so that they have some kind of relationship, <span class="special">even if their only connection is their data type</span>. Additionally, <span class="special">we aim to incorporate specific and essential shared functionalities into entities that manage large data sets</span>. The ability to analyze and manipulate large amounts of data is a vitally important skill to have in today's C++ programming environment. Therefore, we will examine data structures and the various algorithms they employ in order to efficiently manage large amounts of data. If this sounds like something you might be interested in learning more about, then this series of articles is what you are looking for.
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
Your enthusiasm to dive headfirst into learning is admirable. However, in every industry, there exists a specific collection of terms, phrases, and standards that enable effective communication between different developers and creators. The realm of data structures and algorithms is no exception to this principle. Prior to discussing the different properties and capabilities of data structures and their respective functionalities, it is important to first establish a common ground in our understanding of the fundamental terminology employed in this field. This foundational step ensures that all developers involved are aligned in their understanding of the concept, thus setting the stage for effective collaboration and comprehension as we navigate through the complexities of this domain.
</p>



<br>
<br>
<br>



<code><h3>Algorithms:</h3></code>

<p>
Interestingly, we've essentially been employing an algorithm all along, up to this point. <span class="special">An algorithm is a collection of percise steps and instructions designed to guide a computer in solving a particular problem.</span> In the realm of computer programming, a single problem often spawns multiple solutions crafted by different programmers and researchers. The challenge lies in determining which algorithm will demonstrate <span class="special">superior performance</span> and most importantly <span class="special">produce correct results</span> all <span class="special">while utilizing fewer resources</span>. Analyzing algorithms is a process that involves identifying the most efficient algorithm that accomplishes the same task as its competitors in the shortest time and with the least memory usage. As a demonstraition, Let's imagine that we are given the task of creating an algorithm that can calculate the factorial of a given number by the user. We can approach this problem in two different ways: <span class="special">Recursively</span>, <span class="special">Iteratively</span>. Let's visualize the iterative approach first:
</p>



<br>
<br>
<br>



```C++
#include <iostream>
#include <string>


int calculate_factorial_iterative(int number);


int main(int argc, char* argv[])
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
    
	return (0);
}


int calculate_factorial_iterative(int number)
{
    int result = 1;
	
	// As long as "current_number" has not reached max of "number".
    for (int current_number = 1; current_number <= number; ++current_number)
	{
        result *= current_number;
    }
	
    return (result);
}
```



<br>
<br>
<br>



<p>
Different algorithms can solve the same problem in many different ways using different types of solutions, and their efficiency can vary significantly. By understanding and comparing their performance characteristics, developers can choose algorithms that are better suited for specific tasks. This leads to faster and more responsive software applications. Different algorithms might require varying amounts of computational resources, such as memory and processing power. <span class="special">It is important to understand that there is no ideal and best algorithm, some algorithms are better suited for some situations than others.</span> Therfore, whenever an interviewer asks you the question of <span class="special">"Which data structure or algorithm do you think is best suited for this problem?"</span>, then your answer should always be <span class="special">"It depends! We need to analyze our solutions"</span>. By analyzing and understanding how to compare these resource requirements, developers can ensure that their software runs smoothly on different hardware configurations. Let's take a look at the second method which uses recursive function calls to accomplish the exact same functionality:
</p>



<br>
<br>
<br>



```C++
#include <iostream>
#include <string>


int calculate_factorial_recursive(int number);


int main(int argc, char* argv[])
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
    
	return (0);
}


int calculate_factorial_recursive(int number)
{
    if(number <= 1)
	{
		return (1);
	}
    
	// Getting the number before the current one.
	int former_number = number - 1;
	
	return (number * calculate_factorial_recursive(former_number));
}
```



<br>
<br>
<br>



<p>
You may have noticed that the above two algorithms accomplish the same task in a completely different ways. Using a loop is the first method, which takes far fewer resources than its recursive counterpart. As discussed in the function blog post, recursive calls take more space per function call in order to accommodate the memory needs of the function as well as additional time to set up the entire process of allocating everything appropriately. Nevertheless, recursive methods are much more straightforward to understand and manage than iterative loops. These are the reasons why we have comparisons in order to see what the advantages and disadvantages of each algorithm are in order to determine which is more appropriate for the situation and resources available. Another example would be a program that can display the set of Fibonnaci numbers:
</p>


<br>
<br>
<br>



```C++
#include <iostream>


int Fibonacci_recursive(int number);


int main(int argc, char* argv[])
{
    // Print the first 10 Fibonacci numbers.
    
    for(std::size_t index = 0; index < 10; ++index)
    {
        std::cout << Fibonacci_recursive(index) << " ";
    }
    
    std::cout << std::flush;
    
    return (0);
}


int Fibonacci_recursive(int number)
{
    if(number <=1)
    {
        return (number);
    }
    
    return Fibonacci_recursive(number -1) + Fibonacci_recursive(number -2);
}
```



<br>
<br>
<br>



<br>
<br>
<br>



```C++
#include <iostream>


void fibonacci_iterative(int number);


int main(int argc, char* argv[])
{
    fibonacci_iterative(10);

    return (0);
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
Data structures are considered <span class="special">entities with the capability of grouping data together based on similarity in type and behavior, enabling efficient manipulation of datasets along with providing some common functionality for better manipulation of data</span>. These structures are commonly referred to as <span class="special">collections</span>, <span class="special">containers</span>, and the like. Data structures are fascinating because they uphold to one of the most important concepts in the programming bible, which is the principle of <span class="special">abstraction</span>. Data structures shield us from unnecessary details and the complexities associated with manipulating and managing extensive datasets. They offer only the essential interfaces needed to work with them for programmers. Elements within a data structure have something in common even if that thing is as simple as being of the same data type. So, which data structure is the best?
</p>



<br>
<br>



<p>
It is important to understand the strengths and limitations of various data structures since there is not a universal data structure that is appropriate for all tasks. In order to choose the appropriate data structure, there are a number of factors that must be considered. Choosing the best data structure for each scenario involves many factors. There are, however, certain factors we can consider in order to determine which data structure is best suited to be used, including performance and functionality. In general, the programmer will use a certain data structure more frequently if it is faster and more performant. However, performance is not the only factor. In order to save us from having to come up with a solution to perform such a task, we may sometimes wish for our data structure to provide us with more functionality and capabilities rather than being more performant. It is, however, important to note that the following functions should be expected of every data structure:
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
The performance of different data structures are determined by the algorithms and methods they employ to fulfill their tasks. Similar to all other components within a computer, data structures follow specific sets of instructions to achieve their objectives. For this very reason, we introduce the concept of analyzing algorithms and seeking to compare their efficiency. Data structures and algorithms have been a huge part of computer science since the dawn of computers as managing large amounts of data is trickier than it looks and can have siginifcant impact on the perforamnce of our programs. In the upcoming sections, we will focus on how to determine the effecniecy of differnet algorthims by using special tools and mathematical notations that have been set as the standard and accepted among the programming world as the main tools to be used for this task. But, before that we need to understand what performance is.
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
Before we can get started on measuring the performance of a data structure, we need to answer a fundamental question: "Why should we be concerned with the efficiency and resource demands of the algorithm employed by a data structure?" The answer is: "Because it makes a difference!". While the argument can be made that computers are becoming exceedingly faster and more powerful, the scale and complexity of the challenges have increasingly escalated along with the advancements. What adds further intrigue is the fact that the perforamnce of today's computers is largely thanks to the endeavours of programmers who took the time to create new and improved methods and alogrithms for solving these problems! We must care to develop and refine alogrithms as they can have a significant impact on how well our machines perform their tasks in real time.
</p>



<br>



<p>
One of the primary considerations when evaluating the effectiveness of a data structure in completing its tasks is undoubtedly its performance. This leads to a fundamental question: "In the world of data structures and alogrithms what is the meaning of performance, and how can we measure it?" The solution to this question involves categorizing performance into two key dimensions: <strong>Time complexity</strong> and <strong>Space complexity</strong>. Time signifies how quickly tasks can be executed and accomplished, measured in seconds, minutes, hours, days, weeks, or even longer and bigger scales such as months and even years if the problem is really complicated. On the other hand, Space represents the resources needed to accomplisth that task, such as the total amount of memory that needs to be consumed during execution. Let's take a look at how we can measure each of these concepts more accurately.
</p>



<br>


<p>
Understanding these two categories is important because they typically involve a trade-off. When aiming to improve program execution speed, chances are there is going to be a corresponding increase in space and resource utilization. On the other hand, if the goal is to minimize space and resource consumption, it might lead to longer execution times. For instance, when uisng a powerful Google computer, resource and space efficiency might be of minimal concern, whereas execution speed takes precedence. In contrast, with a personal desktop computer at home, space limitations will be more important to consider, and execution speed being of less concern, but still important non the less. Therefore, determining which factor is more important relies entirely on the situation, objectives, and requirements. Sometimes, the best situation is to create a balance between the time and space complexities.
</p>



<br>
<br>
<br>
<br>
<br>
<br>



<code><h3>Time complexity</h3></code>

<p>
The central question at hand is: "How can we measure or predict the time required by an algorithm to solve a problem?". At first glance, most programmers will assume that the solution lies in timing the algorithm as it executes its operations, awaiting its completion. While this assumption is completely natural; After all, if one wishes to measure how much faster one car is compared to another, they would probably have them being timed based on a race track they complete. However, delving deeper reveals a few complications associated with this approach. For example, Let's try and create a piece of code that will enable us to measure the time that takes for a function to sum up numbers from 1 to 10000 and then print the solution:
</p>



<br>
<br>
<br>



```C++
#include <iostream>
#include <chrono>


void my_function(std::size_t total_iterations)
{
	for(std::size_t iteration = 0; iteration < total_iterations; ++iteration)
	{
		continue;
	}
}


int main(int argc, char* argv[])
{
	// Creating time_points to record times.
	std::chrono::time_point<std::chrono::steady_clock> start_point;
	std::chrono::time_point<std::chrono::steady_clock> break_point;
	
	
	
	start_point = std::chrono::steady_clock::now(); // Recording the time before function starts.
	my_function(1'000'000);
	break_point = std::chrono::steady_clock::now(); // Recording the time after function finishes.
	
	
	
	// Calculating duration. (with floating-point accuracy and milisecond format)
	std::chrono::duration<float, std::milli> duration = break_point - start_point;
	
	// Printing the duration.
	std::cout << "Duration was: " << duration.count() << "ms" << std::endl;
	
	
	return (0);
}
```



<br>
<br>
<br>


<p>
Chrono is a library for working with time and clocks. Within Chrono, there are three types of clocks available: "system_clock," "steady_clock," and "high_resolution_clock." The "system_clock" type is typically employed for handling dates in a calendar format, while "steady_clock" and "high_resolution_clock" are more suitable for precise timing mechanisms, making them ideal choices for measuring durations. To calculate the total time it takes for a function or piece of code to execute, we create two time points: one before the function begins and one after it completes. These time points record the precise time when the statements are executed. We determine the total duration by calculating the difference between these two time points. The Chrono library is quite sophisticated, and covering its entirety in one explanation is not feasible. Nevertheless, the knowledge provided here should be sufficient for us to create a basic timer and evaluate the performance of our functions.
</p>



<br>



```C++
#include <iostream>
#include <chrono>


void my_function(std::size_t total_iterations)
{
	for(std::size_t iteration = 0; iteration < total_iterations; ++iteration)
	{
		continue;
	}
}


int main(int argc, char* argv[])
{
	// Creating time_points to record times.
	std::chrono::time_point<std::chrono::steady_clock> start_point;
	std::chrono::time_point<std::chrono::steady_clock> break_point;
	
	
	
	start_point = std::chrono::steady_clock::now(); // Recording the time before function starts.
	my_function(1'000'000);
	break_point = std::chrono::steady_clock::now(); // Recording the time after function finishes.
	
	
	
	// Calculating duration. (with floating-point accuracy and milisecond format)
	std::chrono::duration<float, std::milli> duration = break_point - start_point;
	
	// Printing the duration.
	std::cout << "Duration was: " << duration.count() << "ms" << std::endl;
	
	
	return (0);
}
```

<br>


<p>
The time it takes an alogrithm to complete its task can be affected by the hardware it is running on and the environment it is executed in. The same algorithm might execute faster on a high-end machine compared to a low-end one, even if the underlying algorithmic efficiency remains the same. If you attempt to run this code on different devices with different hardaware capabiliets you will soon realize that you will obtain back different types of numbers each time. The issue does not lie in the act of measuring time itself, but rather in the misconceptions surrounding time-based comparisons. Typically, we tend to measure the time differences among distinct machines, rather than evaluating a particular machine's performance across multiple instances. Let's take a look at some examples that are obtained from runing this code on differetn manchenes:
</p>



<br>



<p>
if we execute a piece of software on a high-performance computer and it completes in 0.00001 milliseconds, can we assume that the algorithm will run fast anywhere? This assumption is misguided as it is like saying that a Ferrari supercar is quicker than a compact economy car - an evident truth. The main question is: "Have the improvements in the algorithm actually influenced the execution speed compared to the previous runs on the same machine?". Altough time based approchase are nice and they can be certainly used to compare the execution times from previous attempts, but ulitmately they are not perferred way of estimating teh performance as many things such as size of the input, hardaware-capability, compiler optimizations, and many more things can influence the number that we obtain from it.
</p>



<br>



<p>

</p>



<br>
<br>
<br>



<code><h3>Space complexity</h3></code>

<p>
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








### Asymptotic analysis



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<p>
Clearly, time-based assessments of algorithms, especially those conducted by larger companies with a lot of resources, are a viable approach. However, not all programmers have the ability, time, nor the resources to conduct such sufficticated measurements. Most programmers seek a quick and approximate evaluation of their algorithm's performance in terms of time complexity. This is where asymptotic analysis comes into play. Asymptotic analysis involves the use of mathematical tools to study an algorithm's performance as the input size approaches infinity. Rather than fixating solely on time measurements, which can be heavily influenced by the factors discussed earlier, we can instead focus on observing how computational operations and steps increase in relation to the volume of requests and input changes.
</p>



<br>



<p>
These notations operate at a high level of abstraction, aiming to enable a rough evaluation of an algorithm in terms of performance while concealing the precise details. They treat fundamental and trivial operations, such as assignment statements, additions, and subtractions, as atomic and constant operations that consistently consume the same amount of time, even though, in reality, the execution time of these operations may vary. This is since they are relatively insignificant compared to more complex code structures that can have a greater influence, such as loops, functions, and classes. allowing us to focus on grasping the bigger picture rather than dwelling on elementary operations that have a negligible impact. Asymptotic notations will remind us of 3 important states that every programmer must take into considertaionn when they attempt to see how well their alogirthm is doing. This includes Big-O, Big-Theta, and Big-Omega. Let's take a look and analyze each of them in more depth.
</p>



<br>
<br>
<br>
<br>
<br>
<br>



<code><h3>Big-Omega (Ω)</h3></code>

<p>
Omega notation, often denoted as Ω (pronounced "big omega"), is a mathematical notation used in computer science and mathematics to describe the lower bound of the time complexity of an algorithm or the growth rate of a function. In the context of time complexity, it characterizes the best-case scenario, representing the minimum amount of time required for an algorithm to execute a specified number of instructions. Omega notation is frequently referred to as the "ideal" scenario, though it is important to note that such ideal conditions are rarely encountered in practice.
</p>



<br>



<code><h3>Big-Theta (Θ)</h3></code>

<p>
Theta notation, often denoted as Θ (pronounced "Big Theta"), is a mathematical notation used in computer science and mathematics to describe the lower and upper bound of the time complexity of an algorithm or the growth rate of a function. In the context of time complexity, it characterizes the average-case scenario, representing the average amount of time required for an algorithm to execute a specified number of instructions. Theta notation is frequently referred to as the "comman" scenario. Theta notation is much more common to be discussed in comparison to Omega notation.
</p>



<br>



<code><h3>Big-O (O)</h3></code>

<p>
Big-O notation, often denoted as Θ (often referred to as just "Big O"), is a mathematical notation used in computer science and mathematics to describe the upper bound of the time complexity of an algorithm or the growth rate of a function. In the context of time complexity, it characterizes the worst-case scenario, representing the maximum amount of time required for an algorithm to execute a specified number of instructions. Big-O notation is more commonly used among programmers as it desribes the worst possible case their algoritm can run.
</p>



<br>
<br>
<br>
<br>
<br>
<br>



<code><h3>Standard conventions</h3></code>

<p>
Among the trio of asymptotic notations, Big-O stands out as the most frequently employed notation for characterizing algorithm performance. Whenever programmers mention terms like "My algorithm's performance is linear" or say that "This algorithm operates in constant time," they are likely refering to Big-O notation. But why is this the case? Big-O notation places emphasis on an algorithm's worst-case time complexity. In other words, understanding how an algorithm behaves under worst-case conditions is often critical because these scenarios are where performance bottlenecks are most likely to manifest. This notation enables you to concentrate on the most significant factors influencing the runtime of your algorithm. If you can make the worst-case of an alogritm be better, then chances are that other notations and conditions such as average-case and best-case will benefit twice as much.
</p>



<br>



<p>
While Big-O notation is the predominant method for articulating algorithmic complexity, it's worth noting that other notations, such as Big-Theta (Θ) and Big-Omega (Ω), serve specific purposes as well. In most cases it is the combination of all these notations together at the end that can make a difference. However, for the sake of simplicity, we will describe the performance of algorithms in all upcoming tutorials in terms of Big-O. In the forthcoming and concluding section of this page, we will see into common patterns, best practices, and provide code examples for identifying Big-O in various scenarios.
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
While there is no comprehensive reference list that provides exact quantitative measurements for the performance of algorithms, there is encouraging news. Many programmers and scientists have conducted extensive research and experiments in the past, resulting in well-established common scenarios related to Big-O notation and performance. These insights provide general guidelines and categorizations that programmers can use to understand the relative performance of their alogrithms. When attempting to evaluate the time complexity of an algorithm using Big-O Notation, we can refer to the list below to gain a broad understanding of the algorithm's current performance status:
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
The optimal performance that an algorithm can achieve in terms of Big-O notation is constant time, denoted as O(1). This signifies that the algorithm consistently completes its task in the same amount of time, regardless of the size of the input data. Achieving a truly constant algorithm is exceedingly challenging. While we can come very close to it, most of the time, achieving a full constant performance is not possible unless the algorithm's task is exceptionally basic. Examples of operations that can be of constant performance include basic arithmetic operations, such as addition, subtraction, multiplication, and division involving fixed-size integers or floating-point numbers. Furthermore, straightforward variable declaration and assignment statements also go under the category of constant performance. 
</p>



<br>



<p>
It is important to note that there is a common misconception among programmers regarding the distinction between being constant and being fast. When we talk about a constant algorithm, we mean that it maintains a consistent runtime with every execution. However, this does not imply that the algorithm is necessarily fast. For example, it might take the alogrithm 1 minute and 37 seconds to accomplish its task. The advantage lies in the fact that regardless of whether it is processing a single data point or a million data points, it will consistently take the same 1 minute and 37 seconds. The true power of this characteristic becomes apparent as the volume of data increases. Let's take a look at an example:
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
The code above uses "std::random_device" to produce random numbers constrainted to the range of 1 to 30 via a "std::uniform_int_distribution". The time complexity associated with declaring, creating, and utilizing these two objects, along with the assignment and print operations, can all be regarded as constant. However, our primary focus lies on the for-loop structure. Despite the fact that the for-loop attempts to iterate 10 times, generating and printing a random number on each iteration, it consistently repeats this process 10 times whenever the program is executed. In other words, the number of iterations that the for-loop does have no relationship with any kind of input data. The for-loop's time complexity remains constant.
</p>



<br>
<br>
<br>
<br>
<br>
<br>



<code><h3>Logarithmic</h3></code>

<p>
A logarithmic algorithm is one whose time complexity increases as the input size grows, but this increase occurs at a significantly slower rate than expected. They are often represented as O(log n), where "n" signifies the size of the input data. These algorithms typically involve dividing the input into smaller chunks and processing one segment at a time. This approach allows the algorithm to substantially reduce the problem size with each step, often halving it compared to the original size. Logarithmic algorithms are exceptionally efficient for handling large datasets because their time complexity grows much slower than others in the table set. They are frequently employed for tasks that entail a divide-and-conquer strategy, progressively eliminating half of the remaining possibilities at each step. Logarithmic algorithms represent the closest approximation to constant time complexity in terms of performance.
</p>



<br>



<p>
Detecting whether an algorithm shows logarithmic behavior can be quite challenging, particularly when dealing with complex algorithms. One reason for this challenge in understanding logarithmic behavior is that it diverges from our everyday experiences. For instance, in our daily lives, we typically handle situations sequentially, serving customers one by one in a linear fashion at a restaurant, rather than attempting to divide them into halves and employing a divide-and-conquer approach. This tendency to approach tasks linearly is mirrored in other aspects of life, like serving customers at a bank or parking cars in a parking lot. Due to these linear processes, programmers often struggle to identify a logarithmic algorithm. Let's look at one example and try to see why it evaluates to an logarithmic time complexity:
</p>



<br>



<p>
Imagine you have purchased a new book about romance and are eager to find a specific paragraph within a certain chapter. You have two choices for finding the paragrpah: Start from the very first page and keep turning pages until you eventually find the chapter you desire. This method involves checking each page one by one, which could be time-consuming, especially in a long book. Alternatively, you can use a more efficient method. Begin by examining the table of contents, which is organized alphabetically by chapters. This step allows you to immediately pinpoint the chapter you want to read. By doing so, you've effectively reduced your search by nearly half of the book's content, as many chapters have been skipped. Within the selected chapter, you might find subcategories or subsections. You can continue to apply the approach. Divide the content into two, focus on one half based on the alphabetical order or any other criterion, and repeat until you locate the specific sentence you are seeking.
</p>



<br>



<p>
The key idea here is that at each step, you are halving the search space, which leads to a logarithmic reduction in the number of possibilities you need to examine. This method demonstrates logarithmic time complexity because the time it takes to find your desired paragraph grows slowly, proportional to the logarithm of the number of possibilities (in this case, the number of pages or chapters in the book). This is much faster than a linear search, especially for large datasets. Another example of logarithmic time complexity is a common algorthim known as the "Binary search" which will be explained later on in the "Array" section. In general, it is very difficult to explain logarthimic algorithms as they are very rare since they introduce increadible performance. However, rest ashored as we will cover many of them throughout this entire tutorial.
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


<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->