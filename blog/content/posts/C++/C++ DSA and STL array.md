---
title: "C++ Data structures & STL part 02 - Array container"
date: 2023-05-12T14:06:22-07:00
draft: true

weight: 4
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
As we begin our exploration of the Standard Template Library, we will analyze an entity that, although not commonly regarded as a container, certainly displays container-like characteristics.  The trust worthy array! In many programming languages, arrays are a fundamentally valuable and straightforward method for grouping data, so much so that they are inherently integrated and do not require external libraries in order to function. C++ is no exception. No matter whether we embrace the array voluntarily or not, it remains one of the most significant and fundamental components of a programming language, allowing us to manipulate large amounts of data effectively and efficiently. In order to begin our exploration, we will examine a few common characteristics of arrays as well as their architectural design.
</p>



<br>
<br>



<p>
When it comes to organizing a collection of items, arranging them sequentially in adjacent, contiguous spaces is the most natural method of approaching the problem. For example, imagine that one created a list of elements on a piece of paper; these elements would be arranged in horizontal or vertical order. An array data structure in programming accomplishes this exact purpose. At its most basic level, an array consists of elements of the same data type that are stored in contiguous memory locations, without any gaps in between them. Array elements share a common name, which can be used to manipulate and manage them collectively. For example, if a programmer wishes to record names for various coffee drinks that they enjoy, the structure of the array would resemble something similar to the following:
</p>



<br>
<br>
<br>



image



<br>
<br>
<br>



<p>
The C++ language, as mentioned earlier, is comprised of two key components: "C" and "++", with the "++" part representing classes and objects. For this reason, arrays in C++ can be utilized and manipulated in two distinct manners: using built-in C-style arrays or employing the array class provided within the STL library as a container. It is critical to understand and grasp both approaches since many programmers and existing codebases may employ either methods interchangeably. As we try to understand the five fundamental functionalities expected of arrays as a container - namely, Insert, Remove, Access, Search, and Traverse - we will explore them through both the "C" and "++" perspectives. However, before we can explain the array data structure from these diverse angles, we must first have an array to begin with. Let us start by exploring their distinctions by performing the two most fundamental operations familiar to every programmer in this field: Declaring and Initializing arrays.
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










### Decleration & Initialization



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<code><h3>C-style approach</h3></code>

<p>
In order to create and work with arrays in C++, it is essential to understand the concept of array declarations. C++ array declarations serve as a means of signaling to the compiler that you intend to use a collection of elements of the same type, and that you wish to reserve memory for them.  A declaration of an array entails specifying the array's characteristics, such as: Specifying the <span class="special">data type</span> of the elements that the array will contain which defines the type of values the array can hold, a <span class="special">name</span> for the array that will be used throughout our program, and last but not least, the <span class="special">number of elements</span> the array will accommodate, which determines the number of elements the array will hold. The array must be declared with all of this information in order to function correctly.
</p>



<br>
<br>
<br>



```C++
#include <iostream>


int main(int argc, char* argv[])
{
	int numbers[5]; // Declaring an array that can hold 10 integer elements.
	
	return (0);
}
```



<br>
<br>
<br>



<p>
Initializing an array involves populating it with default values, as it may contain unpredictable and garbage elements in each cell. When initializing a C-style array, we have two options. We can either provide all the elements ahead of time, as shown in the example "number_1", or we can set the elements of an array to a default value, such as 0, and then populate the elements one by one later in our code, as shown in "number_2". The example of "numbers_3" demonstrates a shorthand way of accomplishing the same thing as the second method. However, it is much easier as we do not need to write every element individually. It is more common to use the second method because we often do not know the values in advance. However, we can specify the elements later on in our program by accessing and manipulating each one of them as we see fit.
</p>



<br>
<br>
<br>



```C++
#include <iostream>


int main(int argc, char* argv[])
{
	// Elements are set immediately to their correct values.
	int numbers_1[5] = {5, 10, 7, 9, 12};
	
	
	// Elements will need to be set to the correct value later on.
	int numbers_2[5] = {0, 0, 0, 0, 0};
	int numbers_3[5] = {0};
	
	
	return (0);
}
```



<br>
<br>
<br>
<br>
<br>
<br>




<code><h3>STL-style approach</h3></code>

<p>
Declaring an array in the STL container manner is, in theory, no different from the C-style version. Declaration serves the same purpose; it instructs the compiler to allocate and reserve sufficient space for storing 10 integer elements. However, since we are working with an STL container array, the syntax differs from that of a C-style array. The STL container array object employs templates to operate. Consequently, we must specify both the data type it will store and the total number of elements within the template brackets, as demonstrated in the following approach:
</p>



<br>
<br>
<br>



```C++
#include <iostream>
#include <array>

int main(int argc, char* argv[])
{
	// Declaring an array to hold 10 integer elements.
	std::array<int, 5> numbers;
	
	return (0);
}
```



<br>
<br>
<br>



<p>
Initializing an array involves populating it with default initial values, as it may contain unpredictable and garbage values in each cell. When initializing a C-style array, we have two methods at our disposal. We can either provide all the elements beforehand, as demonstrated by "numbers_1" in the following example, or we can initialize all elements of an array to a default value, such as 0 in this case, and later populate them one by one, as shown in the "number_2" example. Another short hand method of trying to accomplish the same action as the second method is provided as "numbers_3", which does the same thing. The second method is more commonly used because often, we do not have the values available to us in advance, but we can specify how many elements we need, which is a fundamental requirement of an array data structure:
</p>

Since the STL array container is an object, as we all know from the concept of Object oriented designs and classes and objects, we an use an initilizer list to inject the elements that we want into an array container at the time of declaration. The following is a represesntation of how this would look like:

<br>
<br>
<br>



```C++
std::array<int, 3> arr {...};
```



<br>
<br>
<br>



<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Introduction</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->