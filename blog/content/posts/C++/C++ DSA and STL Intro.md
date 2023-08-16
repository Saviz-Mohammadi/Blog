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
I am confident that programmers possess a solid understanding of what a program is and what it does. A program essentially consists of a sequential execution of instructions, with each instruction operating on distinct piece of data. As our programs grow in size and complexity, it becomes increasingly challenging to effectively monitor and manage these datasets solely using conventional variables. Opting for an exclusive use of variables in such scenarios can rapidly lead to an unmanageable situation. This is because variables aren't engineered to handle extensive data loads; their design centers around managing singular units of information.
</p>



<br>



<p>
Let's take an instance where the utilization of numerous individual variables can result in a complex situation when it comes to managing large volumes of data. Imagine you have a classroom full of students, and you intend to store information about every student, including their name, age, and GPA. If you opt to employ distinct variables for each student, the code could resemble the following:
</p>



<br>
<br>



```C++
int main(int argc, char* argv[])
{	
	// First student.
	std::string student_01_name = "William Harris";
	
	int student_01_age = 18;
	int student_01_gpa = 2;

	
	// Second student.
	std::string student_02_name = "Thomas Robinson";
	
	int student_02_age = 19;
	int student_02_gpa = 3;
	
	
	return (0);
}
```



<br>
<br>



<p>
This is just the start – currently, we're dealing with only two student entities in total, treating these fields as combined attributes. But what if we aim to tweak and handle hundreds, or even thousands, of students? The code could quickly turn into a headache to manage. We'd have to create many unique fields and variables, each requiring individual attention. And let's not forget about the potential scenario where we're tasked with frequently modifying each of these fields.
</p>



<br>



<p>
As program designers, we often strive to connect pieces of data in a way that they have some form of relationship, even if the only commonality is their data type. In today's era of C++ programming, understanding how to deal with signifacnt amounts of data and how to manipulate them effectively is vitally important. For these reasons, we will explore data structures and the various algorithms they employ to efficiently manage large volumes of data. So, without any hesitation, let's begin.
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
In every industry, there exists a specific collection of terms, phrases, and standards that enable effective communication between different developers and creators. The field of data structures is no different in this regard. Before we proceed with delving into the specifics of various data structures, it's essential to establish a shared understanding of the fundamental terminology used in this domain to ensure that all developers are on the same page.
</p>



<br>
<br>
<br>



<code><h3>Algorithms:</h3></code>

<p>
An algorithm is a collection of precise steps and instructions designed to guide a computer in solving a particular problem. Within computer programming, a single problem often spawns multiple solutions crafted by different programmers and researchers. The challenge lies in determining how to predict which approach will exhibit superior performance while utilizing fewer resources. Analysis of Algorithms is the process of finding the best algorithm that runs the fastest and takes less memory to perform the same task in comparison to other competitors.
</p>



<br>



<p>
As a demonstraition, the following two algorithms both attempt to write a set of instructions that allow the computer to calculate the factorial of a give number by the user. The first alogrithm attempts to solve this problem using an iterative approach with loops while the scond one attempts to do this with a recurisve function call.
</p>



<br>
<br>



```C++
#include <iostream>


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


<p>
Algorithms can solve the same problem in different ways, and their efficiency can vary significantly. By understanding and comparing their performance characteristics, developers can choose algorithms that are better suited for specific tasks. This leads to faster and more responsive software applications. Different algorithms might require varying amounts of computational resources, such as memory and processing power. By analyzing and comparing these resource requirements, developers can ensure that their software runs smoothly on different hardware configurations. Let's take a look at the second method which uses recursive functions:
</p>



<br>
<br>



```C++
#include <iostream>


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



<p>
As you may have witnessed, the above two mentioned algorithms complete the same taks in totolaly different ways. The first way attempts to use a loop, which in comparison takes way less resources compareded to it's recursive counter part. This is due to the fact that recursive calls take more space per function call to accomodate the needs of the  function regarding memory as well as more time to setup the whole process of allocating everything appropriately as discussed in the function chapter of this blog post. It is due to these reason why we have comparisons to see which alogrithms are better.
</p>



<br>
<br>
<br>


<code><h3>Data structures:</h3></code>

<p>
Data structures are considered entities with the capability of grouping data based on similarity of type and behaviour together, enabling efficient manipulation of datasets. These structures are commonly referred to as collections, containers, and the like. Data structures are fascinating because they uphold to one of the most important concepts in the programming bible, which is the principle of abstraction. Data structures shield us from the unnecessary details and complexities associated with manipulating extensive datasets, offering only the essential interfaces needed to work with them to programmers.
</p>



<br>



<p>
 There is not a universal data structure suitable for all tasks; therefore, understanding the strengths and limitations of various structures is essential. Choosing the correct data structure is not easy. There are a lot of elements involved in deciding which data structure is the best to use for each scenario. However, there are some things that we can consider to judge which data structure is better suited to be used for each scenario:
</p>



<br>
<br>



<ul class="justified-list">
	<li><strong>Performance</strong></li>
	<li><strong>Functionality</strong></li>
</ul>



<br>
<br>



<p>
Performance is really important. If a certain data structure is faster and more performant, then it is more likely to be used by the programmer. However, performance is not everything. Sometimes, we may want our data structure to provide us more functions and capabilities rather than being more performant. Maybe we want to choose one data structure over another over the condition of having some amazing function that no other data structure has that can make our lives easier. The following are however, some of the most basic expectations for every data strucuter in terms of functionality to have:
</p>



<br>
<br>



| Operation  | Description                                                                                            |
|------------|--------------------------------------------------------------------------------------------------------|
| `Insert`   | Provide ability to add an element to the data set                                                      |
| `Remove`   | Provide ability to Delete an element from the data set                                                 |
| `Search`   | Provide ability to find an element in the data set if possible                                         |
| `Traverse` | Provide the ability to go through each element, usually for the purpose of printing the entire data set|



<br>
<br>



<p>
The performance of different data structures are determined by the algorithms and methods they employ to fulfill their tasks. Similar to all other components within a computer, data structures follow specific sets of instructions to achieve their objectives. For this very reason, we introduce the concept of analyzing algorithms and seeking to compare their efficiency. Data structures and algorithms have been a huge part of computer science since the dawn of computers as managing large amounts of data is trickier than it looks and can have siginifcant impact on the perforamnce of our programs. In the upcoming sections, we will focus on how to determine the effecniecy of differnet algorthims.
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








### Performance and measurement



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<p>
Before we can even get started on measuring the performance of an entity that attempts to store and manipulate a large set of data, we need to ask ourselves what aspects are we measuring? On other words, what are the different aspects and viewes when it comes to performance. One of the biggest concerns when it comes to ananlyzing how good an entity is in manipulating a large set of data is obviously its performance in regards to how much resource it uses. So, here is the big question "In the world of data strucutres and alogrithms what things do we need to measure in regards to performance and resource useage?"

The answer to this question is time and space. Where time demonstrates how quickly something can be accomplished and space is how much resources it takes to accomplisth that task such as memory usage.

Talk about why timing is not a good way of measuring and the problems related to it. Onec you are done end the discussion and talk about Big-o bigtheta and others in the next section.

alos talk about space complexity.

"In the world of data strucutres and alogrithms what tool, notation, etc. can we use to mesure the performance and capability of a container or collection?"


At first glance most programmers will assume that the answer is by timing them when they perform differrent operations, and while this is a completely natural thing to assume, however, there are a couple of problems with this.



In order to answer these questions and to come up with a unified way to express performance and resource usage, computer scientists have come up with something commonly refered to as asomptotic notations which are mathematical tools used ot describe the capabilites of algorithms and the data strucuters that use those alogrithms.
</p>


Time & Space Complexity


What are the important facts in Algorithms Analysis?

⦁	Time Complexity.
⦁	Space Complexity. 

Both Time and Space are important factors. Sometimes the algorithm may be faster at the cost of taking more memory and vice versa. Depending on the situation, the program may need to be faster or take less space.

What is Time complexity?

Time complexity is the amount of time the algorithm takes to solve the problem.

In the previous example if we were to replace 5 with 9999 the amount of time taken for each algorithm to solve the problem is as follows: 
⦁	Algorithm 1 takes (2.0 milliseconds)
⦁	Algorithm 2 takes (0.0 milliseconds)






Space Complexity refers to the amount of memory or space that the algorithm uses when it is solving the problem.

If one algorithm is faster than another algorithm but takes much more space and memory to accomplish the task it is not considered necessarily better.

The reason why we say “necessarily” is because the goals of an algorithm may be different for that situation. Maybe it doesn’t matter too much if the algorithm takes more memory and space. Maybe just the speed is important.




An ideal data structure takes the least amount of time and space (memory) to complete the task or solve the problem.


<br>



<p>
Let's take an instance where the utilization of numerous individual variables can result in a complex situation when it comes to managing large volumes of data. Imagine you have a classroom full of students, and you intend to store information about every student, including their name, age, and GPA. If you opt to employ distinct variables for each student, the code could resemble the following:
</p>



<br>



```C++
int main(int argc, char* argv[])
{
	// Honestly, how many times did we obtain 1.99, just to strive for 2 as our GPA?
	
	
	// First student.
	std::string student_01_name = "William Harris";
	
	int student_01_age = 18;
	int student_01_gpa = 2;		// Could also be float, but for obvious reasons it is int.

	
	// Second student.
	std::string student_02_name = "Thomas Robinson";
	
	int student_02_age = 19;
	int student_02_gpa = 3;		// Could also be float, but for obvious reasons it is int.
	
	
	return (0);
}
```



<br>



<p>
This is just the start – currently, we're dealing with only two student entities in total, treating these fields as combined attributes. But what if we aim to tweak and handle hundreds, or even thousands, of students? The code could quickly turn into a headache to manage. We'd have to create many unique fields and variables, each requiring individual attention. And let's not forget about the potential scenario where we're tasked with frequently modifying each of these fields.
</p>



<br>



<p>
As program designers, we often strive to connect pieces of data in a way that they have some form of relationship, even if the only commonality is their data type. In today's era of C++ programming, understanding how to deal with signifacnt amounts of data and how to manipulate them effectively is vitally important. For these reasons, we will explore data structures and the various algorithms they employ to efficiently manage large volumes of data. So, without any hesitation, let's begin.
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