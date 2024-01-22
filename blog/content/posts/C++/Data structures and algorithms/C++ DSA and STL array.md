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
As we begin our exploration of the various data structures and their algorithms, we will analyze an entity that, although not commonly regarded as a container, certainly displays container-like characteristics. The trustworthy Array! In many programming languages, arrays are a fundamentally valuable and straightforward method for grouping data, so much so that they are inherently integrated and do not require external libraries in order to function. C++ is no exception. Whether we embrace the Array voluntarily or not, it remains one of a programming language's most significant and fundamental components, allowing us to manipulate large amounts of data effectively and efficiently. In order to begin our exploration, we will examine the Array from different aspects as a data structure and explain its strengths and weaknesses in detail.
</p>



<br>
<br>



<p>
When organizing a collection of items, arranging them sequentially in adjacent, contiguous spaces is the most natural method of approaching the problem. For example, imagine that one created a list of elements on a piece of paper; these elements would be arranged in horizontal or vertical order. An array data structure in programming accomplishes this exact purpose. At its most basic level, an array consists of elements of the same data type stored in contiguous memory locations without any gaps between them. Array elements share a common name, which can be used to manipulate and manage them collectively. For example, if a programmer wishes to record names for various coffee drinks that they enjoy, the structure of the array would resemble something similar to the following:
</p>



<br>
<br>
<br>



image



<br>
<br>
<br>



<p>
The C++ language, as mentioned earlier, is comprised of two key components: "C" and "++," with the "++" part representing the concept of classes and objects within the object-oriented programming (OOP) world. For this reason, arrays in C++ can be utilized and manipulated in two distinct manners: using built-in C arrays or employing the std::array class provided within the STL library as a container. Understanding and grasping both approaches is critical since many programmers and existing codebases may employ either method interchangeably. As we try to understand the five fundamental functionalities expected of arrays as containers - namely, Insert, Remove, Access, Search, and Traverse - we will explore them through the "C" and "++" perspectives.
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



<p>
Before we can explain the array data structure and the associated set of operations, it's essential to have an array to work with in the first place. Let's start our exploration by attempting to create an array capable of holding five integer elements and name it numbers using two distinct methods: C arrays and std::array from the Standard Template Library (STL). It is a common practice to set array names in plural form, such as numbers, elements, etc, to indicate that they refer to a set or collection of elements instead of just one. We will accomplish this by performing the two fundamental operations of declaration and initialization, which should now be common knowledge to programmers in this field.
</p>



<br>
<br>
<br>
<br>



##### Declaration (C approach)

<p>
C++ array declarations serve as a means of signaling to the compiler that you intend to use a collection of elements of the same type and that you wish to reserve memory for them. A declaration of an array in the C approach entails specifying the array's characteristics, such as Specifying the data type of the elements that the array will contain, which defines the type of values the array can hold, a name for the array that will be used throughout our program, and last but not least, the number of elements the array will accommodate. The array must be declared with all this information to function correctly. Once declared, the characteristics of the array cannot be changed later on!
</p>



<br>
<br>
<br>



```C++
///////////////////////////////////////////////////////////////////////////////
//
// Description:
// 
// This program demonstrates the creation of a C-style array. The array is
// called numbers and will be created to hold 5 integer numbers.
//
///////////////////////////////////////////////////////////////////////////////

#include <iostream>
#include <cstdlib>

int main(void)
{
	int numbers[5];
	
	return(EXIT_SUCCESS);
}
```



<br>
<br>
<br>
<br>



##### Declaration (STL approach)

<p>
Declaring an array in the STL container manner is no different from the C-style version. Declaration serves the same purpose; it instructs the compiler to allocate and reserve sufficient space for storing ten integer elements. However, since we are working with an STL container array, the syntax differs from that of a C-style array. The STL container array object employs templates to operate. The characteristics of the array do not defer; we are still required to provide and specify both the data type of the elements that the array will store and the total number of elements within the template brackets, as demonstrated in the following approach:
</p>


<br>
<br>
<br>



```C++
#inculde <iostream>
#include <array>

int main(int argc, char* argv[])
{
	// Declaring an array to hold 5 integer elements.
	std::array<int, 5> numbers;
	
	return (0);
}
```



<br>
<br>
<br>



<p>
You may be wondering about the rationale behind imposing these requirements, such as explicitly specifying to the compiler the number of elements to store in the array and mandating uniformity in element types. The purpose for these enforcement measures will become clear in the subsequent sections, where it is best to illustrate them alongside the relevant functionalities to deepen our understanding of their existence. Therefore, for the time being, your patience is appreciated as you continue reading. Rest assured, these questions will be addressed at the appropriate juncture.
</p>


<br>
<br>
<br>
<br>
<br>
<br>



##### Initialization (C approach)



<p>
Initializing an array involves populating it with default values, as it may contain unpredictable and garbage elements in each cell after declearation. When initializing a C-style array, we have two options. We can either provide all the elements ahead of time, as shown in the example "number_1", or we can set the elements of an array to a default value, such as 0, and then populate the elements one by one later in our code, as shown in "number_2". The example of "numbers_3" demonstrates a shorthand way of accomplishing the same thing as the second method. However, it is much easier as we do not need to write every element individually. It is more common to use the second method because we often do not know the values in advance. However, we can specify the elements later on in our program by accessing and manipulating each one of them as we see fit.
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


##### Initialization (STL approach)

<p>
Initialization an array in the STL container manner is, in theory, serves the same purpose; it instructs the compiler to populate an existing array with default values or values that we want. However, since we are working with an STL container array, the syntax differs from that of a C-style array. We can use an initilizer list to inject the elements that we want into an array container at the time of declaration. The following is a represesntation of how this would look like:
</p>


<br>
<br>
<br>
<br>
<br>
<br>



```C++
std::array<int, 3> arr {...};
```



<br>
<br>
<br>


<code><h3>Other approaches</h3></code>
It is important to understand that after creating an array we have the option to leave an array uninitialized and populate it later on. We can do this by taking advantage of loops. Here is an example:

<!-- ############################################# Separator - Bottom ############################################# -->

<div class="line-divider-bottom">
  <hr class="left-line">
  <span>|</span>
  <span class="middle">Decleration & Initialization</span>
  <span>|</span>
  <hr class="right-line">
</div>

<!-- ############################################# Separator - Bottom ############################################# -->







### Traversing elements



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<code><h3>Theory</h3></code>

<p>
This might come as a surprise, but unlike many other resources in the realm of programming that typically begin by explaining how to insert, delete, and manipulate elements within a container, I've chosen to commence with the concept of traversing. Why, you may wonder? My rationale behind prioritizing traversal is rooted in its exceptional significance—it is an operation that holds immense sway over the performance of other operations. In programming, traversing refers to the process of systematically visiting each element of a data structure. The reason why traversing is so important is because visiting an element enables us to have exclusive capability over it which involves all kinds of manipulation over that particular element or set of elements.
</p>

<br>
<br>

<p>
The manner in which we traverse a data structure is intricately tied to the structure's inherent characteristics. Traversal significantly impacts other operations; for instance, prior to contemplating the insertion of an element, we must first ascertain the correct location within the structure, a task accomplished by navigating through the entire structure—effectively traversing it. The same principle applies to deleting an element; determining its location within the data structure is imperative before the removal process can commence. Even operations like searching are profoundly influenced by the chosen method of element traversal.
</p> 

When discussing the STL part take time to explain iterators in depth.

<br>
<br>

<code><h3>C approach</h3></code>

<p>
Arrays usually have the most basic method when it comes to traversing. If a programmer wishes to traveres an array they would tiypically use some variation of a loop (for-loop, while-loop) and start at the begining with index zero and continue iterating through the array elements using the loop until they encounter the last element through the index of the last eleemnt which is usually one less than the total size. Do take note that for the loop to stop correctly we must instruct the condition to be one less than the total size by either decrementing the size or using the less than operator. The following code demonstrates this concept:
</p>



<br>
<br>
<br>



```C++
#include <iostream>
#include <cstdlib>

int main(void)
{
    int numbers[] = {1, 2, 3, 4, 5};

	// For-loop
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////

	std::cout << "Using a for-loop to print the array:" << "\n";
	
    for(std::size_t index = 0; index < 5; ++index)
	{
        std::cout << numbers[index] << "\n";
    }
	
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	// For-loop
	
	
	
	
	// while-loop
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	
	std::cout << "Using a while-loop to print the array:" << "\n";
	
	std::size_t index = 0;
	
	while(index < 5)
	{
		std::cout << numbers[index] << "\n";
		
		++index;
	}
	
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	// while-loop

    return(EXIT_SUCCESS);
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




<code><h3>Big-O for traversing</h3></code>

<p>
Big-O referes to the worst time complextiy and worst case sceniaro that can happen. When dealing with arrays the assumption is that the programmer intends to traveres the entire set of the array from the first eleemnt until the very last element. Under these assumptions the time complextiy for the worst-case sceniar is O(n). This is since we need to manually traveres every element in the array one by one which can increase in a linear fashion if the array can be of random size.
</p>

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




### Accessing elements



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<code><h3>C approach</h3></code>

<p>
Accessing elements within a container or collection is indeed one of the fundamental functionalities offered by a data structure. After all, when we store something somewhere, we naturally expect to retrieve it at a later point; otherwise, there would be no purpose in storing it initially. To retrieve information from a specific location within an array in the C approach, we employ the <span class="special">name</span> of the array in conjunction with a commonly referred-to entity called an <span class="special">index</span>. The method that we demonstarted above is commonly refered to as <span class="special">"Array Subscripting"</span>. Where we use the name of the array in combination with a set of square brackets that contain the index of teh element that we wish to access. An index is an integer that corresponds to the position of an element within the array. It is crucial to note that, unlike the real world where we typically label the first element as 1 in the context of arrays, we start counting from 0. In the example below, if we wished to obtain the first element, we would use an index of 0:
</p>


One of the requirements and special characterisitcs of an array is the fact that in the declaration of it we had to tell explicity to the compiler how many elements we wanted to store in it. This property combined with the fact that All the elements of an array are required to be of the same type, this means they can either be all integers, floats, chars, or even any custom types such as structs and class types. This reason for this enforcement is because this enables an array to predict and measure the total amount of memeory it needs by simply multipling the size of an element by the total count that we want. In addition, having all elements of the same type has yet another adavantage, that being that we can effectively find an element instantousely in the array by simply knowing the type wihch indicates the size of it and since the array is a collection of many elements with the same type, we can simply mulitply the size with the element position to obtain it. In other words, we can simply find the location of any element within the array by performing simple arithmatic operations which is really effecient.


The size of an array cannot be changed after it is instantiated as it is the main reasno we can effectively predict and benefit from the increadible access speeds of the array which is something that we discussed earlier. Unfortunately, when one part benefits chances are other parts suffer for it! due to the architecutrela design of an array that there is really no such thing as "Add" or "Remove" In the context of the Array data structure. What we are really doing is converting the potential garbage values of already existing spaces allocated by the compliler to hold something other than what theer is already, making it look like we are adding or removing the elements. But, how about we first have some insights as to why this is which has something to do with how the array data strucutre is structured.


<br>
<br>
<br>

Being the fat fingered culmsy programer that I am, it is not unlikely for me to attempt to access an elemen in a positino which does not exsit.


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
#include <cstdlib>

int main(void)
{
	int numbers[5] = {23, 10, 7, 9, 12};
	
	// Printing the first element in the array.
	std::cout << "The first number is: " << numbers[0] << std::endl;

	return (EXIT_SUCCESS);
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

accessing the first element: with front() which has a complexity of O(1)
accessing the last element: with back() which has a complexity of O(1)
accessing a random element: with at() or with operator[] both have a complexity of O(1)

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



### Searching elements



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<code><h3>Theory</h3></code>

<p>
Searching is a fundamental operation in computer science, and it involves finding a specific element or value within a collection of data. This collection can take various forms, we will focus on searching in the context of arrays in this page. It surprises me how a large number of programmers do not know the difference between searcing and accessing an element. The difference between accessing and searching is the fact that in accessing one may know from before hand the exact index or placement of an element and try and access it. From the other hand, searching is the attempt to find and obtain an element withouth having any previous knowledeg over its position or existance within the data structure. There are different algorithms for searching, and their efficiency depends on various factors like the size of the array, whether the data is sorted or unsorted, and the specific requirements of the problem. Let's take a look at some of the different ways:
</p>

<br>
<br>

<code><h3>Linear search</h3></code>

<p>
The most natural approach for finding an element in an array is to go through each element in a linear fashion and examine if the element is the one we are looking for. This method is also sometimes referred to as the brute force approach because we literally need to examine every element as we go which means that the complextiy of this method is O(n) and can increase at a linear rate depending on teh size of the array.
</p>


#include <iostream>

```C++
#include <iostream>
#include <cstdlib>

int main(void)
{
    int numbers[] = {1, 2, 3, 4, 5};

	// For-loop
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////

	std::cout << "Using a for-loop to print the array:" << "\n";
	
    for(std::size_t index = 0; index < 5; ++index)
	{
        std::cout << numbers[index] << "\n";
    }
	
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	// For-loop
	
	
	
	
	// while-loop
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	
	std::cout << "Using a while-loop to print the array:" << "\n";
	
	std::size_t index = 0;
	
	while(index < 5)
	{
		std::cout << numbers[index] << "\n";
		
		++index;
	}
	
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	// while-loop

    return(EXIT_SUCCESS);
}
```

bool contains(int* beginptr, std::size_t length, int target);

int main(void)
{
    int array[5] = {1, 2, 3, 4, 5};
    
    std::cout << contains(array, 5, 10);
    
    return(0);
}


bool contains(int* beginptr, std::size_t length, int target)
{
    for(std::size_t index = std::size_t(0); index < 5; ++index)
    {
        if(beginptr[index] == target)
        {
            return(true);
        }
    }
    
    return(false);
}


<br>
<br>
<br>



```C++
#include <iostream>
#include <cstdlib>

int main(void)
{
    int numbers[] = {1, 2, 3, 4, 5};

	// For-loop
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////

	std::cout << "Using a for-loop to print the array:" << "\n";
	
    for(std::size_t index = 0; index < 5; ++index)
	{
        std::cout << numbers[index] << "\n";
    }
	
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	// For-loop
	
	
	
	
	// while-loop
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	
	std::cout << "Using a while-loop to print the array:" << "\n";
	
	std::size_t index = 0;
	
	while(index < 5)
	{
		std::cout << numbers[index] << "\n";
		
		++index;
	}
	
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	// while-loop

    return(EXIT_SUCCESS);
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

<code><h3>Searching array algorithms</h3></code>

Interpolation search
This is another algorithm to find an element in a sorted array. Another, because the first thing that comes to mind is the binary search. That’s perhaps the most well known and intuitive way of finding an element in a sorted array. If you don’t know what binary search is, you’ll probably get bored somewhere along the line and leave this article, so, for the sake of succinctness, I will make it short.

Binary search is a recursive algorithm to find an element in a sorted array. The idea is to suppose that the element we are looking for is right in the middle of the array. If it is, we’re lucky, if not, and if it’s less than the one we’re looking for, we do the same for the right half of the array. And of course, if it’s greater, we do the same for the left half. After each step the array is getting twice as smaller, resulting in a logarithmic complexity (O(logN)). Small example.

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




<code><h3>Big-O for traversing</h3></code>

<p>
Big-O referes to the worst time complextiy and worst case sceniaro that can happen. When dealing with arrays the assumption is that the programmer intends to traveres the entire set of the array from the first eleemnt until the very last element. Under these assumptions the time complextiy for the worst-case sceniar is O(n). This is since we need to manually traveres every element in the array one by one which can increase in a linear fashion if the array can be of random size.
</p>

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






### Adding and Removing elements



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<code><h3>Theory</h3></code>

<p>
I chose to discuss these two fundamental operations together because, despite being opposites of each other, they share significant similarities in their underlying nature. Before delving into these operations, let's revisit some key aspects of arrays. An essential characteristic of arrays is the explicit declaration of the number of elements to be stored in them. Additionally, all elements within an array must be of the same type. These enforcements ensure that the array can accurately predict its required memory by multiplying the size of an element by the total count, thus enabling the ease of access and manipulation of each element in it.

While the immutability of arrays offers advantages in certain aspects, it introduces drawbacks, particularly concerning addition and deletion operations. The challenge arises from the fact that these operations in an array do not align with our conventional understanding of "Add" or "Remove" in the context of data structures. Instead, when we appear to add or remove elements, we are essentially replacing existing spaces allocated by the compiler, adjusting them to accommodate different values. This architectural design constrains the dynamic manipulation of array size, creating some confusion in comprehension.

In reality, when we claim to add or remove an element, we are simply accessing the designated address of an element using the square brackets method and then updating the value to something different than its previous state. When attempting to add, we face the limitation that the array's size is fixed, preventing the incorporation of additional space. On the other hand, in the context of removal, what we typically mean is altering the element to a default value, such as 0 for integers or an empty string. This concept can be confusing for beginners, as arrays demonstrate characteristics that differ from other data structures. The notion of adding and removing in arrays doesn't align with the conventional understanding of these terms.
</p>

<br>
<br>

<code><h3>Linear search</h3></code>

<p>
The most natural approach for finding an element in an array is to go through each element in a linear fashion and examine if the element is the one we are looking for. This method is also sometimes referred to as the brute force approach because we literally need to examine every element as we go which means that the complextiy of this method is O(n) and can increase at a linear rate depending on teh size of the array.
</p>


#include <iostream>

```C++
#include <iostream>
#include <cstdlib>

int main(void)
{
    int numbers[] = {1, 2, 3, 4, 5};

	// For-loop
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////

	std::cout << "Using a for-loop to print the array:" << "\n";
	
    for(std::size_t index = 0; index < 5; ++index)
	{
        std::cout << numbers[index] << "\n";
    }
	
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	// For-loop
	
	
	
	
	// while-loop
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	
	std::cout << "Using a while-loop to print the array:" << "\n";
	
	std::size_t index = 0;
	
	while(index < 5)
	{
		std::cout << numbers[index] << "\n";
		
		++index;
	}
	
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	// while-loop

    return(EXIT_SUCCESS);
}
```

bool contains(int* beginptr, std::size_t length, int target);

int main(void)
{
    int array[5] = {1, 2, 3, 4, 5};
    
    std::cout << contains(array, 5, 10);
    
    return(0);
}


bool contains(int* beginptr, std::size_t length, int target)
{
    for(std::size_t index = std::size_t(0); index < 5; ++index)
    {
        if(beginptr[index] == target)
        {
            return(true);
        }
    }
    
    return(false);
}


<br>
<br>
<br>



```C++
#include <iostream>
#include <cstdlib>

int main(void)
{
    int numbers[] = {1, 2, 3, 4, 5};

	// For-loop
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////

	std::cout << "Using a for-loop to print the array:" << "\n";
	
    for(std::size_t index = 0; index < 5; ++index)
	{
        std::cout << numbers[index] << "\n";
    }
	
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	// For-loop
	
	
	
	
	// while-loop
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	
	std::cout << "Using a while-loop to print the array:" << "\n";
	
	std::size_t index = 0;
	
	while(index < 5)
	{
		std::cout << numbers[index] << "\n";
		
		++index;
	}
	
    ////////////////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////////////////
	// while-loop

    return(EXIT_SUCCESS);
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

<code><h3>Searching array algorithms</h3></code>

Interpolation search
This is another algorithm to find an element in a sorted array. Another, because the first thing that comes to mind is the binary search. That’s perhaps the most well known and intuitive way of finding an element in a sorted array. If you don’t know what binary search is, you’ll probably get bored somewhere along the line and leave this article, so, for the sake of succinctness, I will make it short.

Binary search is a recursive algorithm to find an element in a sorted array. The idea is to suppose that the element we are looking for is right in the middle of the array. If it is, we’re lucky, if not, and if it’s less than the one we’re looking for, we do the same for the right half of the array. And of course, if it’s greater, we do the same for the left half. After each step the array is getting twice as smaller, resulting in a logarithmic complexity (O(logN)). Small example.

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




<code><h3>Big-O for traversing</h3></code>

<p>
Big-O referes to the worst time complextiy and worst case sceniaro that can happen. When dealing with arrays the assumption is that the programmer intends to traveres the entire set of the array from the first eleemnt until the very last element. Under these assumptions the time complextiy for the worst-case sceniar is O(n). This is since we need to manually traveres every element in the array one by one which can increase in a linear fashion if the array can be of random size.
</p>

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







### Custom Vector



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
#ifndef VECTOR_H
#define VECTOR_H

#define DEFAULT_VECTOR_SIZE std::size_t(10)

#include <iostream>

namespace algorithms
{
	namespace containers
	{
		template <typename T>
		class Vector
		{
		private:
			T* m_array;
			std::size_t m_size;
			std::size_t m_capacity;

		// Constructors
		public:
			Vector();
			Vector(std::size_t p_size = std::size_t(0), const T& p_value = T());

		// Copy
		public:
			Vector(const Vector<T>& p_other);
			const Vector<T>& operator=(const Vector<T>& p_other);

		// Destructor
		public:
			~Vector();

		public:
			void push_back(const T& p_element);
			void pop_back();
			const T& back() const noexcept;

			void push_front(const T& p_element);
			void pop_front();
			const T& front() const noexcept;

			void insert_at(std::size_t p_index, const T& p_element);
			void erase_at(std::size_t p_index);

			T& at(std::size_t p_index);
			const T& at(std::size_t p_index);

			T& operator[](std::size_t p_index);
			const T& operator[](std::size_t p_index) const;

			T* data();
			const T* data() const;

			void realloc(std::size_t p_capacity);
			void fill(const T& p_value);
			void clear();

			constexpr std::size_t size() const noexcept;
			constexpr std::size_t capacity() const noexcept;
			constexpr bool is_empty() const noexcept;

			bool operator==(const Array<T, S>& p_other) const;
			bool operator!=(const Array<T, S>& p_other) const;
			bool operator> (const Array<T, S>& p_other) const;
			bool operator< (const Array<T, S>& p_other) const;
			bool operator>=(const Array<T, S>& p_other) const;
			bool operator<=(const Array<T, S>& p_other) const;

			std::string to_string();
			friend std::istream& operator>>(std::istream& p_istream, Array<T, S>& p_array);
			friend std::ostream& operator<<(std::ostream& p_ostream, const Array<T, S>& p_array);
		};
	};
};




// Implementations
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


template <typename T>
algorithms::containers::Vector<T>::Vector() : m_size(std::size_t(0)), m_capacity(DEFAULT_VECTOR_SIZE)
{
	this->m_array = new T[(this->m_capacity)];
};


template <typename T>
algorithms::containers::Vector<T>::Vector(std::size_t p_size, const T& p_value) : m_size(p_size), m_capacity(p_size * 2)
{
	this->m_array = new T[(this->m_capacity)];

	this->fill(p_value);
};


template <typename T>
algorithms::containers::Vector<T>::Vector(const Vector<T>& p_other) : m_size(p_other.size())
{
	// This needs to be changed, look at copy assignment operator...
	for (std::size_t index = std::size_t(0); index < (this->m_size); ++index)
	{
		this->m_array[index] = p_other[index];
	}
};


template <typename T>
const algorithms::containers::Vector<T>& algorithms::containers::Vector<T>::operator=(const Vector<T>& p_other)
{
	// If the other array is bigger than ours...
	if (p_other.size() > this->m_size)
	{
		delete[] (this->m_array);

		T* new_array = T[p_other.capacity()];

		this->m_array = new_array;
	}

	this->m_size = p_other.size();

	for (std::size_t index = std::size_t(0); index < (this->m_size); ++index)
	{
		this->m_array[index] = p_other[index];
	}

	return (*this);
};


template <typename T>
algorithms::containers::Vector<T>::~Vector()
{
	delete[] this->m_array;
};


template <typename T>
void algorithms::containers::Vector<T>::push_back(const T& p_value)
{
	// Expand the capacity....
	if (this->m_size == this->m_capacity)
	{
		realloc(this->m_capacity * 2);
	}

	this->m_array[this->m_size] = p_value;

	++(this->m_size);
};


template <typename T>
void algorithms::containers::Vector<T>::pop_back()
{
	if (this->m_size > 0)
	{
		--(this->m_size);
	}

	// Shrink the capacity...
	if (this->m_size <= this->m_capacity / 2)
	{
		realloc(this->m_capacity / 2);
	}
};


template <typename T>
const T& algorithms::containers::Vector<T>::back() const noexcept
{
	return (this->m_array[m_size - 1]);
};

// Done until here

template <typename T>
void algorithms::containers::Vector<T>::push_front(const T& p_value)
{
	insert_at(0, p_value);
};


template <typename T>
void algorithms::containers::Vector<T>::pop_front()
{
	erase_at(0);
};


template<typename T>
const T& algorithms::containers::Vector<T>::front() const noexcept
{
	return (this->m_array[0]);
};


template<typename T>
void algorithms::containers::Vector<T>::insert_at(std::size_t p_index, const T& p_element)
{
	// Check bounds...
	if (p_index < this->m_size || p_index >= this->m_size)
	{
		std::out_of_range("Index out of bounds!");
	}

	++(this->m_size);

	if (this->m_size >= this->m_capacity)
	{
		realloc(this->m_capacity * 2);
	}

	// Shift to the right...
	for (std::size_t index = (this->m_size); index > p_index ; --index)
	{
		this->m_array[index] = this->m_array[index - 1];
	}

	this->m_array[p_index] = p_element;
};


template <typename T>
void algorithms::containers::Vector<T>::erase_at(std::size_t p_index)
{
	// Check bounds...
	if (p_index < this->m_size || p_index >= this->m_size)
	{
		std::out_of_range("Index out of bounds!");
	}

	// Shift elements to the right...
	for (std::size_t index = p_index; index < (this->m_size) - 1; ++index)
	{
		this->m_array[index] = this->m_array[index + 1];
	}

	--(this->m_size);
};


template<typename T, std::size_t S>
T& algorithms::containers::Array<T, S>::at(std::size_t p_index)
{
	if (p_index < 0 || p_index >= m_size)
	{
		throw std::out_of_range("Attempting to access index out of bounds!");
	}

	return (
		this->m_array[p_index]
		);
};


template<typename T, std::size_t S>
const T& algorithms::containers::Array<T, S>::at(std::size_t p_index)
{
	if (p_index < 0 || p_index >= m_size)
	{
		throw std::out_of_range("Attempting to access index out of bounds!");
	}

	return (
		this->m_array[p_index]
		);
};


template <typename T>
T& algorithms::containers::Vector<T>::operator[](std::size_t p_index)
{
	return (this->m_array[p_index]);
};


template<typename T>
const T& algorithms::containers::Vector<T>::operator[](std::size_t p_index) const
{
	return (this->m_array[p_index]);
};


template<typename T, std::size_t S>
T* algorithms::containers::Array<T, S>::data()
{
	// Very useful when using with something like "memset".
	return(
		this->m_array
		);
};


template<typename T, std::size_t S>
const T* algorithms::containers::Array<T, S>::data() const
{
	// Very useful when using with something like "memset".
	return(
		this->m_array
		);
};


template <typename T>
void algorithms::containers::Vector<T>::realloc(std::size_t p_capacity)
{
	// Creating new array...
	T* new_array = new T[p_capacity];

	// Copy/Move over elements.
	for (std::size_t index = std::size_t(0); index < (this->m_size); ++index)
	{
		new_array[index] = m_array[index];
	}

	// Deleting old array...
	delete[](this->m_array);

	// Changing members...
	this->m_array = new_array;
	this->m_capacity = p_capacity;
};


template<typename T>
void algorithms::containers::Vector<T>::fill(const T& p_value)
{
	for (std::size_t index = std::size_t(0); index < (this->m_size); ++index)
	{
		this->m_array[index] = T(p_value);
	}
};


template <typename T>
void algorithms::containers::Vector<T>::clear()
{
	T* new_array = new T[DEFAULT_VECTOR_SIZE];

	this->m_size = std::size_t(0);
	this->m_capacity = DEFAULT_VECTOR_SIZE;

	delete[](this->m_array);

	this->m_array = new_array;
};


template <typename T>
constexpr std::size_t algorithms::containers::Vector<T>::size() const noexcept
{
	return (this->m_size);
};


template <typename T>
constexpr std::size_t algorithms::containers::Vector<T>::capacity() const noexcept
{
	return (this->m_size);
};


template <typename T>
constexpr bool algorithms::containers::Vector<T>::is_empty() const noexcept
{
	return (this->m_size == std::size_t(0));
};


template<typename T, std::size_t S>
bool algorithms::containers::Array<T, S>::operator==(const Array<T, S>& p_other) const
{
	// Comparing size of arrays first.
	if (m_size != p_other.size())
	{
		return (false);
	}

	// Comparing individual elements next.
	for (std::size_t index = 0; index < m_size; ++index)
	{
		if (m_array[index] != p_other[index])
		{
			return (false);
		}
	}

	return (true);
};


template<typename T, std::size_t S>
bool algorithms::containers::Array<T, S>::operator!=(const Array<T, S>& p_other) const
{
	// Comparing size of arrays first.
	if (m_size != p_other.size())
	{
		return (true);
	}

	// Comparing individual elements next.
	for (std::size_t index = 0; index < m_size; ++index)
	{
		if (m_array[index] != p_other[index])
		{
			return (true);
		}
	}

	return (false);
};


template<typename T, std::size_t S>
bool algorithms::containers::Array<T, S>::operator> (const Array<T, S>& p_other) const
{
	// Comparing size of arrays first.
	if (this->m_size > p_other.size())
	{
		return (true);
	}

	if (this->m_size < p_other.size())
	{
		return (false);
	}

	// Comparing individual elements next.
	for (std::size_t index = 0; index < m_size; ++index)
	{
		if (m_array[index] <= p_other[index])
		{
			return (false);
		}
	}

	return (true);
};


template<typename T, std::size_t S>
bool algorithms::containers::Array<T, S>::operator< (const Array<T, S>& p_other) const
{
		// Comparing size of arrays first.
	if (this->m_size < p_other.size())
	{
		return (true);
	}

	if (this->m_size > p_other.size())
	{
		return (false);
	}

	// Comparing individual elements next.
	for (std::size_t index = 0; index < m_size; ++index)
	{
		if (m_array[index] >= p_other[index])
		{
			return (false);
		}
	}

	return (true);
};


template<typename T, std::size_t S>
bool algorithms::containers::Array<T, S>::operator>=(const Array<T, S>& p_other) const
{
	return !(*this < p_other);
};


template<typename T, std::size_t S>
bool algorithms::containers::Array<T, S>::operator<=(const Array<T, S>& p_other) const
{
	return !(*this > p_other);
}


template<typename T, std::size_t S>
std::string algorithms::containers::Array<T, S>::std::string to_string()
{
	std::string result = std::string();

	for (std::size_t index = 0; index < m_size - 1; ++index)
	{
		result << "[" << this->m_array[index] << "] ";
	}

	result << "[" << this->m_array[m_size - 1] << "]";

	return (result);
};


template<typename T, std::size_t S>
std::istream& algorithms::containers::Array<T, S>::operator>>(std::istream& p_istream, Array<T, S>& p_array)
{
	for (std::size_t index = 0; index < array.size(); ++index)
	{
		p_istream >> p_array[index];
	}

	return (p_istream);
};


template<typename T, std::size_t S>
std::ostream& algorithms::containers::Array<T, S>::operator<<(std::ostream& p_ostream, const Array<T, S>& p_array)
{
	for (std::size_t index = 0; index < array.size(); ++index)
	{
		p_ostream << p_array[index];
	}

	return (p_ostream);
};


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Implementations

#endif // VECTOR_H
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