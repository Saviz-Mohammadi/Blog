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
As we begin our exploration of the Standard Template Library, we will analyze <span class="special">an entity that, although not commonly regarded as a container, certainly displays container-like characteristics</span>.  The trust worthy <span class="special">"Array"</span>! In many programming languages, arrays are a fundamentally valuable and straightforward method for grouping data, so much so that they are inherently integrated and do not require external libraries in order to function. C++ is no exception. No matter whether we embrace the array voluntarily or not, it remains one of the most significant and fundamental components of a programming language, allowing us to manipulate large amounts of data effectively and efficiently. In order to begin our exploration, we will examine the array from different aspects as a data structure and explain in detail its strength and weaknesses.
</p>



<br>
<br>



<p>
When it comes to organizing a collection of items, arranging them sequentially in adjacent, contiguous spaces is the most natural method of approaching the problem. For example, imagine that one created a list of elements on a piece of paper; these elements would be arranged in horizontal or vertical order. An array data structure in programming accomplishes this exact purpose. At its most basic level, <span class="special">an array consists of elements of the same data type that are stored in contiguous memory locations, without any gaps in between them</span>. Array elements share a common name, which can be used to manipulate and manage them collectively. For example, if a programmer wishes to record names for various coffee drinks that they enjoy, the structure of the array would resemble something similar to the following:
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
In order to create and work with arrays in C++, it is essential to understand the concept of array declarations. C++ array declarations serve as a means of signaling to the compiler that you intend to use a collection of elements of the same type, and that you wish to reserve memory for them.  A declaration of an array entails specifying the array's characteristics, such as: Specifying the <span class="special">data type of the elements</span> that the array will contain which defines the type of values the array can hold, a <span class="special">name for the array</span> that will be used throughout our program, and last but not least, the <span class="special">number of elements</span> the array will accommodate, which determines the number of elements the array will hold. The array must be declared with all of this information in order to function correctly.
</p>



<br>
<br>
<br>



```C++
#include <iostream>


int main(int argc, char* argv[])
{
	int numbers[5]; // Declaring an array that can hold 5 integer elements.
	
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
Declaring an array in the STL container manner is, in theory, no different from the C-style version. Declaration serves the same purpose; it instructs the compiler to allocate and reserve sufficient space for storing 10 integer elements. However, since we are working with an STL container array, the syntax differs from that of a C-style array. The STL container array object employs templates to operate. The characterisitcs of the array do not defer, we are still required to provide and specify both the data type of the elements that the array will store and the total number of elements within the template brackets, as demonstrated in the following approach:
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










### Accessing elements



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<code><h3>C approach</h3></code>

<p>
Accessing elements within a container or collection is indeed one of the fundamental functionalities offered by a data structure. After all, when we store something somewhere, we naturally expect to retrieve it at a later point; otherwise, there would be no purpose in storing it initially. To retrieve information from a specific location within an array in the C approach, we employ the <span class="special">name</span> of the array in conjunction with a commonly referred-to entity called an <span class="special">index</span>. The method that we demonstarted above is commonly refered to as <span class="special">"Array Subscripting"</span>. Where we use the name of the array in combination with a set of square brackets that contain the index of teh element that we wish to access. An index is an integer that corresponds to the position of an element within the array. It is crucial to note that, unlike the real world where we typically label the first element as 1 in the context of arrays, we start counting from 0. In the example below, if we wished to obtain the first element, we would use an index of 0:
</p>



<br>
<br>
<br>



```C++
#include <iostream>


int main(int argc, char* argv[])
{
	int numbers[5] = {23, 10, 7, 9, 12};
	
	// Printing the first element in the array.
	std::cout << "The first number is: " << numbers[0] << std::endl;

	return (0);
}
```



<br>
<br>
<br>
<br>
<br>
<br>




<code><h3>STL approach</h3></code>

<p>
In the realm of C++, there are multiple methods for accomplishing tasks, and one alternative approach for retrieving an element from an array involves what is commonly referred to as <span class="special">"Arithmetic operations"</span>. In this method we obtain an element by performing mathematical operations on the pointers that reference the storage location of each element. <span class="special">Iterators</span> serve the purpose of enabling programmers to access and manipulate individual elements within a container. They achieve this by facilitating iteration through the elements using pointers. In some ways, iterators resemble the C way of working with and manipulating pointers, but they offer a more refined approach. If we wish to achieve the same objective using an object-oriented approach in C++, we can employ the following method with iterators:
</p>



<br>
<br>
<br>



```C++
#include <iostream>
#include <array>


int main(int argc, char* argv[])
{
	std::array<int, 5> numbers = {1, 2, 3, 4, 5};

    // Create an "Iterator" pointing to the first element in the array.
    std::array<int, 5>::iterator it = numbers.begin();
    
    // Printing elements at positions 0 and 2.
    std::cout << "Element at index 0: " << *(it + 0) << std::endl;
    std::cout << "Element at index 2: " << *(it + 2) << std::endl;

    return (0);
}
```



<br>
<br>
<br>

<p>
Iterators serve as a universal means of accessing elements within STL (Standard Template Library) containers, offering a consistent interface for element access. This uniformity means that we need not concern ourselves with the inner workings or characteristics of the container, as iterators provide a consistent method of retrieving elements across all container types. 

It's easy to overlook the concept of iterators when working with simpler data structures like arrays, which already offer straightforward ways of access, such as the aforementioned method. In such cases, it may not seem necessary to introduce yet another approach for accessing data structures. However, as we delve into more complex data structures that lack straightforward methods for element retrieval, our appreciation for iterators will grow.
</p>

<p>
It may appear incredibly convenient when we simply place a number within square brackets, and presto! We retrieve the desired element. So, why introduce yet another approach to tackle this problem? Well, the issue lies in the fact that this method pertains solely to arrays at the moment. As we venture into more intricate data structures, we'll encounter the challenge of having to remember and manage various methods for obtaining elements from them.

The dilemma arises because not everything is stored contiguously and neatly, like arrays that allow for straightforward access through simple number increments or decrements.
</p>

<p>
In the provided code snippet, on line 7, we declare and initialize a "std::array" called "numbers" containing five integer elements: 1, 2, 3, 4, and 5. Following this, we create an iterator named "it", which is declared and initialized using the "begin()" function of the "std::array". This iterator now references the first element within the "numbers" array. Subsequently, we attempt to print the various elements within the array, starting with the first element. To do this, we use the expression *(it + 0), which dereferences the iterator "it" and adds 0 to its position, effectively keeping it at the same element it initially pointed to (index 0). Then, it prints the value at that position, which is 1. In a similar manner, when we use *(it + 2), the iterator "it" is dereferenced and incremented by 2, causing it to point to the third element of the array (index 2). It then prints the value at that position, which is 3.



Iterators in C++ function in a manner analogous to pointers, and they allow the use of pointer arithmetic. When you add or subtract an integer value to/from an iterator, it advances or retreats the iterator by a number of positions equivalent to the memory size occupied by the type the iterator points to. In this context, adding 2 to an iterator pointing to a 4-byte integer type advances it by 8 bytes. In C++, when you perform iterator arithmetic, such as it + 2, the iterator advances by 2 positions, with each position corresponding to the size of the type the iterator is pointing to. In the case of a std::array of integers, where each integer typically occupies 4 bytes (assuming a typical 32-bit integer), this means that iterator arithmetic like it + 2 effectively moves the iterator 8 bytes forward in memory. It's worth noting that *(it + 0) is functionally identical to *(it), as adding zero doesn't alter the iterator's position. However, some developers find this notation helpful as it resembles array subscripting, where the number following the iterator addition corresponds to the index within square brackets.


*(it + 0) == array[0]
*(it + 2) == array[2]
</p>



<br>
<br>
<br>
<br>
<br>
<br>




<code><h3>Big-O for accessing elements</h3></code>

<p>
In the realm of C++, there are multiple methods for accomplishing tasks, and one alternative approach for retrieving an element from an array involves what is commonly referred to as <span class="special">"Arithmetic operations"</span>. In this method we obtain an element by performing mathematical operations on the pointers that reference the storage location of each element. <span class="special">Iterators</span> serve the purpose of enabling programmers to access and manipulate individual elements within a container. They achieve this by facilitating iteration through the elements using pointers. In some ways, iterators resemble the C way of working with and manipulating pointers, but they offer a more refined approach. If we wish to achieve the same objective using an object-oriented approach in C++, we can employ the following method with iterators:
</p>

<br>

<p>
I understand that some of you may be feeling a bit puzzled about the reasons behind the constraints and characteristics we've discussed regarding arrays so far. While you might already be familria with arrays, you may not have delved into the specific rationale behind these requirements and limitations. Until this point, we focused on establishing a fundamental understanding of working with arrays and their basic syntax, which is why we didn't delve into the reasoning behind these rules. However, fear not, as we are now prepared to address your questions. Explaining these concepts will help us grasp the time complexity and Big-O notation associated with accessing elements in arrays.


Because each element in an array is placed directly adjacent to one another, accessing individual elements becomes not only easier but also completely independent from the others. This independence stems from the fact that to access an element, we don't need to traverse or consider the previous elements in any way. This characteristic is precisely why arrays are referred to as offering random access. With the assurance that each element is sequentially positioned due to the contiguous arrangement, coupled with our knowledge of the exact size of each element and the total memory allocated, we can perform intriguing operations using straightforward mathematical calculations. In essence, this means that any element can be accessed by simply adding an offset to the base value of the array or the position of the first element.


Let's consider accessing the third element in the array. We already have the initial position, so all that's required is to move forward by three steps. In this context, assuming a 32-bit system where an integer typically occupies 4 bytes, we can calculate the distance by multiplying the desired position (in this case, 3) by the step size (4 bytes). This computation results in 12 bytes. Consequently, we can swiftly reposition ourselves to the beginning of the seventh element within our array. These are the fundamental principles that underlie the constraints we've discussed. They facilitate the efficient and rapid retrieval of elements we are already aware of. It's these attributes that empower compilers to execute various optimizations and clever techniques on our arrays.


The size of an array is fixed and cannot be altered after declaration. This constraint is not intended to frustrate programmers but serves a crucial purpose in optimizing array performance, particularly regarding element access. To fulfill its commitment to us, the array data structure must ensure that the final size is declared and provided from before-hand.


Every element within an array must adhere to the same data type, whether they are integers, floats, characters, or even custom types like structs and classes. This enforced uniformity serves a dual purpose. Firstly, it allows the array to accurately predict and calculate the total memory it requires by multiplying the size of a single element by the desired count. Moreover, having all elements of the same type offers another significant advantage: rapid element retrieval from the array. This is achieved by leveraging the knowledge of the element type, which indicates its size. Since the array comprises elements of identical types, we can efficiently determine the location of any element through straightforward arithmetic operations. In essence, finding an element within the array becomes a quick and efficient process.


We possess several key pieces of information about our array: its starting point, the desired number of elements to store, and the uniform data types contained within it. This knowledge allows us to accurately determine the size of each data type, all of which are equal. Armed with this information, we can efficiently forecast and manage our array. This is precisely why the time complexity or Big-O notation for accessing elements in arrays is considered constant, denoted as O(1). It is because we can retrieve each element independently of others by simply knowing the starting location and performing basic mathematical operations to calculate the element's position, regardless of the array's size.

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