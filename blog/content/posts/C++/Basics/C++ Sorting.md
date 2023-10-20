---
title: "C++ Data structures & STL part 04 - Sorting"
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
Sorting is considered the process of rearranging data elements in a container in order to simplify and reduce the complextiy of the attempt to search, add, remove, and retrieve some data. As we have seen with Arrays and Vectors until now, certain operations such as searching, adding, removing, and many more can be heavilly influenced by weather the container is actually sorted or not. But, we have not really talked about how to perform sorting. Therefore, we have decided to dedicate an entire section just for explaining sorting.
</p>



<br>



<p>
we will delve into various sorting techniques within data structures and explore their distinctions. We will also examine the challenges associated with sorting in data structures and investigate the assortment of sorting algorithms available for optimizing data structure manipulation. By the conclusion of this article, you will possess a more comprehensive understanding of sorting techniques within data structures. Before we can start, there are some common conventions that we will use for creating a unified way of approaching our sorting algorithms... enums, etc..
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









### Bubble sort



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<code><h3>Theory</h3></code>

<p>
Bubble sort is a straightforward sorting algorithm that iterates through a list of elements to be sorted, checks adjcent elements, and exchanges them if they are in the incorrect order. This process continues until no further swaps are required, indicating that the list has been successfully sorted. While bubble sort isn't the most efficient sorting algorithm available, it stands out for its simplicity and ease of implementation. In interviewes it is actually recommended to use this sorting algorithm as the chances of success are high with this easy sorting algorithm. You can then use the argument of this sort not being effecient to implement more effecient ones. Bubble sort is an in-place sorting algorithm and is stable. The worst-case time complexity of this algorithm is O(n^2).
</p>



<code><h3>C-style array</h3></code>

<p>
Eventhough C-style arrays are, as many times mentioned before, not ideal to use in C++, but it in inevidible that we will eventually face them even if the only reason is for compatibility reasons. So, lets see how to implement bubble sort this way:
</p>



<br>
<br>
<br>



```C++
#pragma once

#include <iostream>
#include <algorithm>


namespace algorithms
{
	enum order
	{
		forward = 0,	// Same as "Ascending"
		reverse = 1		// Same as "Descending"
	};

	namespace sort
	{
		template<typename T, std::size_t S>
		void bubble(T(&p_container)[S], const algorithms::order& p_order = algorithms::order::forward);

		template<typename T, std::size_t S>
		static void bubble_forward(T(&p_container)[S]);

		template<typename T, std::size_t S>
		static void bubble_reverse(T(&p_container)[S]);
	};
};


template<typename T, std::size_t S>
void algorithms::sort::bubble(T(&p_container)[S], const algorithms::order& p_order)
{
	bool is_forward_order = (p_order == algorithms::order::forward);

	if (is_forward_order)
	{
		algorithms::sort::bubble_forward(p_container);

		return;
	}

	algorithms::sort::bubble_reverse(p_container);
};

template<typename T, std::size_t S>
static void algorithms::sort::bubble_forward(T(&p_container)[S])
{
	for (std::size_t unsorted_element = 0; unsorted_element < S; ++unsorted_element)
	{
		for (std::size_t selected_element = 0; selected_element < S - 1 - unsorted_element; ++selected_element)
		{
			T& element_1 = p_container[selected_element + 0];
			T& element_2 = p_container[selected_element + 1];

			if (element_1 > element_2)
			{
				std::swap(element_1, element_2);
			}
		}
	}
};

template<typename T, std::size_t S>
static void algorithms::sort::bubble_reverse(T(&p_container)[S])
{
	for (std::size_t unsorted_element = 0; unsorted_element < S; ++unsorted_element)
	{
		for (std::size_t selected_element = 0; selected_element < S - 1 - unsorted_element; ++selected_element)
		{
			T& element_1 = p_container[selected_element + 0];
			T& element_2 = p_container[selected_element + 1];

			if (element_1 < element_2)
			{
				std::swap(element_1, element_2);
			}
		}
	}
};
```



<br>
<br>
<br>



<p>
The outer for-loop in Bubble sort represents the current element that is trying to be sorted. The total number of iterations is equivilant with the number of elements in our container. The inner for-loop is  repsonsibel for contiously comparing the current element with the onen adjcent to it and swapping them if nccessarry. this way when the inner for-loop finishes we are guarenteed that the current element is placed at it's final position. For simplicity sake we take advantage of the std::swap for swapping the twe elements instead of implementing our own swap. In this implementation we use an enum that rerpresents the order by which we want to sort. We could also take adavnatge of a simple boolean to accomplish this, but I find an enum to work better for this as there is a predefined set of options for it.
</p>



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








### Selection sort



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<code><h3>Theory</h3></code>

<p>
Selection sort is very similar to bubble_sort in that it attempts to finalize the position of one element, but in a different way. Bubble_sort attempted to do this by continuosly swapping positions of the elements side by side to each other wherase selection sort will attempt to first go through the entire array each pass and find the minimum value and then swap the position of that value with the current one. So essentially selection sort work in the opposite direction to bubble sort. Bubble sort attempts to finalize the position of the biggest number at the end, but selection sort tries and finds the position of the minimu value and puts it at the begining.


It involves finding the smallest value and swapping it. Making sure that the smallest value is found first.


It is called Selection sort because we select the smallest value per pass or iteration and swap the positions and finalize the elements location.


The algorithm repeatedly selects the smallest (or largest) element from the unsorted portion of the list and swaps it with the first element of the unsorted part. This process is repeated for the remaining unsorted portion until the entire list is sorted.



Selection sort is considered not stable meaning that the algorithm does not preserve the order of records with equal keys. For example, if you have 2 elements of the type "integer 4" in your container, then there is no guarante that they will preserve the relative position nbetween one another. So, if one 4 comes before the other 4, then there is no guarante that the first 4 will still come before the second 4 after sorting. Selection Sort is not stable because it swaps non-adjacent elements.




It can however be made stable like this: There is a link to a article that does this



However it is important to note that making a selection sort stable depends highly on the container type as well for example the way we implement a stable selection sort with an array or vector is different from others like a linked list. Due to this complextiy we often don't bother with making the selection sort stable as it would introduce a lot of complexiyt and besides there are other more effecient and naturally stable algorithms that far outwight selection sort. But, non the less here is how we would do it in selection sort for an array or vector


Selection sort can be made Stable if instead of swapping, the minimum element is placed in its position without swapping i.e. by placing the number in its position by pushing every element one step forward(shift all elements to left by 1). 


The problem is not really the concept of swapping itself, but rather how we approach swapping! You see, in bubble sort we will inidivdable hit a situation where two values that are equal need to be swapped which does not happen therefore preserving their relationship. But, in selection sort we do not care and completely disregard the relationship of the elements to one another and simply swap the position of one element with aonther completely disregarding the relationship of the swapped element with its surrounding neighboor elements.
</p>



<code><h3>C-style array</h3></code>

<p>
Eventhough C-style arrays are, as many times mentioned before, not ideal to use in C++, but it in inevidible that we will eventually face them even if the only reason is for compatibility reasons. So, lets see how to implement bubble sort this way:
</p>



<br>
<br>
<br>



```C++
#pragma once

#include <iostream>
#include <algorithm>


namespace algorithms
{
	enum order
	{
		forward = 0,	// Same as "Ascending"
		reverse = 1		// Same as "Descending"
	};

	namespace sort
	{
		template<typename T, std::size_t S>
		void selection(T(&p_container)[S], const algorithms::order& p_order = algorithms::order::forward);

		template<typename T, std::size_t S>
		static void selection_forward(T(&p_container)[S]);

		template<typename T, std::size_t S>
		static void selection_reverse(T(&p_container)[S]);
	};
};


template<typename T, std::size_t S>
void algorithms::sort::selection(T(&p_container)[S], const algorithms::order& p_order)
{
	bool is_forward_order = (p_order == algorithms::order::forward);

	if (is_forward_order)
	{
		algorithms::sort::selection_forward(p_container);

		return;
	}

	algorithms::sort::selection_reverse(p_container);
};

template<typename T, std::size_t S>
static void algorithms::sort::selection_forward(T(&p_container)[S])
{
	for (std::size_t unsorted_element_index = 0; unsorted_element_index < S - 1; ++unsorted_element_index)
	{
		std::size_t smallest_element_index = unsorted_element_index;

		for (std::size_t selected_element_index = unsorted_element_index + 1; selected_element_index < S; ++selected_element_index)
		{
			// We will compare smallest and selected to find out which is smaller and swap them.
			T& element_1 = p_container[smallest_element_index];
			T& element_2 = p_container[selected_element_index];

			if (element_1 > element_2)
			{
				smallest_element_index = selected_element_index;
			}
		}

		//If smallest is different from what we set it intially, then swap them.
		if (smallest_element_index != unsorted_element_index)
		{
			std::swap(
				p_container[smallest_element_index],
				p_container[unsorted_element_index]
			);
		}
	}
};

template<typename T, std::size_t S>
static void algorithms::sort::selection_reverse(T(&p_container)[S])
{
	for (std::size_t unsorted_element_index = 0; unsorted_element_index < S - 1; ++unsorted_element_index)
	{
		std::size_t smallest_element_index = unsorted_element_index;

		for (std::size_t selected_element_index = unsorted_element_index + 1; selected_element_index < S; ++selected_element_index)
		{
			// We will compare smallest and selected to find out which is smaller and swap them.
			T& element_1 = p_container[smallest_element_index];
			T& element_2 = p_container[selected_element_index];

			if (element_1 < element_2)
			{
				smallest_element_index = selected_element_index;
			}
		}

		// If smallest is different from what we set it intially, then swap them.
		if (smallest_element_index != unsorted_element_index)
		{
			std::swap(
				p_container[smallest_element_index],
				p_container[unsorted_element_index]
			);
		}
	}
};
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







### Insertion sort



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<code><h3>Theory</h3></code>

<p>
Insertion sort work by adding one element at a time to the sorted portion of our container. The most common scenario that will be asked in interviews that should instantly remind any programmer this algorithm is sorting a deck of cards.
</p>



<code><h3>C-style array</h3></code>

<p>
Eventhough C-style arrays are, as many times mentioned before, not ideal to use in C++, but it in inevidible that we will eventually face them even if the only reason is for compatibility reasons. So, lets see how to implement bubble sort this way:
</p>



<br>
<br>
<br>



```C++
#pragma once

#include <iostream>
#include <algorithm>


namespace algorithms
{
	enum order
	{
		forward = 0,	// Same as "Ascending"
		reverse = 1		// Same as "Descending"
	};

	namespace sort
	{
		template<typename T, std::size_t S>
		void insertion(T(&p_container)[S], const algorithms::order& p_order = algorithms::order::forward);

		template<typename T, std::size_t S>
		static void insertion_forward(T(&p_container)[S]);

		template<typename T, std::size_t S>
		static void insertion_reverse(T(&p_container)[S]);
	};
};


template<typename T, std::size_t S>
void algorithms::sort::insertion(T(&p_container)[S], const algorithms::order& p_order)
{
	bool is_forward_order = (p_order == algorithms::order::forward);

	if (is_forward_order)
	{
		algorithms::sort::insertion_forward(p_container);

		return;
	}

	algorithms::sort::insertion_reverse(p_container);
};

template<typename T, std::size_t S>
static void algorithms::sort::insertion_forward(T(&p_container)[S])
{
	for (std::size_t unsorted_element_index = 1; unsorted_element_index < S; ++unsorted_element_index)
	{
		T unsorted_element_save = p_container[unsorted_element_index];

		std::size_t shifting_element_index = unsorted_element_index - 1;

		// Shift to the right side...
		while (shifting_element_index != std::size_t(-1) && p_container[shifting_element_index] > unsorted_element_save)
		{
			p_container[shifting_element_index + 1] = p_container[shifting_element_index + 0];

			--(shifting_element_index);
		}

		p_container[shifting_element_index + 1] = unsorted_element_save;
	}
};

template<typename T, std::size_t S>
static void algorithms::sort::insertion_reverse(T(&p_container)[S])
{
	for (std::size_t unsorted_element_index = 1; unsorted_element_index < S; ++unsorted_element_index)
	{
		T unsorted_element_save = p_container[unsorted_element_index];

		std::size_t shifting_element_index = unsorted_element_index - 1;

		// Shift to the right side...
		while (shifting_element_index != std::size_t(-1) && p_container[shifting_element_index] < unsorted_element_save)
		{
			p_container[shifting_element_index + 1] = p_container[shifting_element_index + 0];

			--(shifting_element_index);
		}

		p_container[shifting_element_index + 1] = unsorted_element_save;
	}
};
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






### Quick sort



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<code><h3>Theory</h3></code>

<p>
Quicksort is an efficient sorting algorithm with an average time complexity of O(n log n). However, by default, quicksort is not stable, which means that it may change the relative order of equal elements in the input array. This means that the worst-case is different and you should research what it is.
</p>



<code><h3>C-style array</h3></code>

<p>
Eventhough C-style arrays are, as many times mentioned before, not ideal to use in C++, but it in inevidible that we will eventually face them even if the only reason is for compatibility reasons. So, lets see how to implement bubble sort this way:
</p>



<br>
<br>
<br>



```C++
#ifndef QUICK_SORT
#define QUICK_SORT

#include <iostream>
#include <algorithm>

namespace algorithms
{
	enum order
	{
		forward = 0,
		reverse = 1
	};

	namespace sort
	{
		template<typename T, std::size_t S>
		void quick(T(&p_container)[S], const algorithms::order& p_order = algorithms::order::forward, std::size_t p_lower_bound = std::size_t(0), std::size_t p_upper_bound = S - 1);

		template<typename T, std::size_t S>
		static void quick_forward(T(&p_container)[S], std::size_t p_lower_bound = std::size_t(0), std::size_t p_upper_bound = S - 1);

		template<typename T, std::size_t S>
		static void quick_reverse(T(&p_container)[S], std::size_t p_lower_bound = std::size_t(0), std::size_t p_upper_bound = S - 1);
	};
};


template<typename T, std::size_t S>
void algorithms::sort::quick(T(&p_container)[S], const algorithms::order& p_order, std::size_t p_lower_bound, std::size_t p_upper_bound)
{
	bool is_forward_order = (p_order == algorithms::order::forward);

	if (is_forward_order)
	{
		algorithms::sort::quick_forward(p_container, p_lower_bound, p_upper_bound);

		return;
	}

	algorithms::sort::quick_reverse(p_container, p_lower_bound, p_upper_bound);
};

template<typename T, std::size_t S>
static void algorithms::sort::quick_forward(T(&p_container)[S], std::size_t p_lower_bound, std::size_t p_upper_bound)
{
	// If the container is of size 1 or 0, then just return
	if (p_lower_bound >= p_upper_bound)
	{
		return;
	}

	// Choosing the last element as the pivot
	const T& pivot_element = p_container[p_upper_bound];

	std::size_t rhs_pointer = p_upper_bound;
	std::size_t lhs_pointer = p_lower_bound;

	while (lhs_pointer < rhs_pointer)
	{
		while (p_container[lhs_pointer] <= pivot_element && lhs_pointer < rhs_pointer)
		{
			++(lhs_pointer);
		}

		while (p_container[rhs_pointer] >= pivot_element && rhs_pointer > lhs_pointer)
		{
			--(rhs_pointer);
		}

		std::swap(
			p_container[lhs_pointer],
			p_container[rhs_pointer]
		);
	}

	// Now just swap the position of the pivot element with one of the pointer elements.
	std::swap(
		p_container[lhs_pointer],
		p_container[p_upper_bound]
	);

	// As a safety check for `std::size_t`. If you use an int, this wont' be nccessary.
	if (lhs_pointer == std::size_t(0))
	{
		return;
	}

	algorithms::sort::quick_forward(p_container, p_lower_bound, lhs_pointer - 1);
	algorithms::sort::quick_forward(p_container, lhs_pointer + 1, p_upper_bound);
};

template<typename T, std::size_t S>
static void algorithms::sort::quick_reverse(T(&p_container)[S], std::size_t p_lower_bound, std::size_t p_upper_bound)
{
	// If the container is of size 1 or 0, then just return
	if (p_lower_bound >= p_upper_bound)
	{
		return;
	}

	// Choosing the last element as the pivot
	const T& pivot_element = p_container[p_upper_bound];

	std::size_t rhs_pointer = p_upper_bound;
	std::size_t lhs_pointer = p_lower_bound;

	while (lhs_pointer < rhs_pointer)
	{
		while (p_container[lhs_pointer] >= pivot_element && lhs_pointer < rhs_pointer)
		{
			++(lhs_pointer);
		}

		while (p_container[rhs_pointer] <= pivot_element && rhs_pointer > lhs_pointer)
		{
			--(rhs_pointer);
		}

		std::swap(
			p_container[lhs_pointer],
			p_container[rhs_pointer]
		);
	}

	// Now just swap the position of the pivot element with one of the pointer elements.
	std::swap(
		p_container[lhs_pointer],
		p_container[p_upper_bound]
	);


	// As a safety check for `std::size_t`. If you use an int, this wont' be nccessary.
	if (lhs_pointer == std::size_t(0))
	{
		return;
	}

	algorithms::sort::quick_reverse(p_container, p_lower_bound, lhs_pointer - 1);
	algorithms::sort::quick_reverse(p_container, lhs_pointer + 1, p_upper_bound);
};

#endif	// QUICK_SORT
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





### Merge sort



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<code><h3>Theory</h3></code>

<p>
Quicksort is an efficient sorting algorithm with an average time complexity of O(n log n). However, by default, quicksort is not stable, which means that it may change the relative order of equal elements in the input array. This means that the worst-case is different and you should research what it is.
</p>



<code><h3>C-style array</h3></code>

<p>
Eventhough C-style arrays are, as many times mentioned before, not ideal to use in C++, but it in inevidible that we will eventually face them even if the only reason is for compatibility reasons. So, lets see how to implement bubble sort this way:
</p>



<br>
<br>
<br>



```C++
#ifndef MERGE_SORT
#define MERGE_SORT

#include <iostream>
#include <algorithm>

namespace algorithms
{
	enum order
	{
		forward = 0,
		reverse = 1
	};

	namespace sort
	{
		template<typename T, std::size_t S>
		void merge(T(&p_container)[S], const algorithms::order& p_order = algorithms::order::forward, std::size_t p_lower_bound = std::size_t(0), std::size_t p_upper_bound = S - 1);

		template<typename T, std::size_t S>
		static void merge_forward(T(&p_container)[S], std::size_t p_lower_bound = std::size_t(0), std::size_t p_upper_bound = S - 1);

		template<typename T, std::size_t S>
		static void merge_reverse(T(&p_container)[S], std::size_t p_lower_bound = std::size_t(0), std::size_t p_upper_bound = S - 1);
	};
};


template<typename T, std::size_t S>
void algorithms::sort::merge(T(&p_container)[S], const algorithms::order& p_order, std::size_t p_lower_bound, std::size_t p_upper_bound)
{
	bool is_forward = (p_order == algorithms::order::forward);

	if (is_forward)
	{
		algorithms::sort::merge_forward(p_container, p_lower_bound, p_upper_bound);

		return;
	}

	algorithms::sort::merge_reverse(p_container, p_lower_bound, p_upper_bound);
};

template<typename T, std::size_t S>
static void algorithms::sort::merge_forward(T(&p_container)[S], std::size_t p_lower_bound, std::size_t p_upper_bound)
{
	// Recursive section
	///////////////////////////////////


	if (p_lower_bound >= p_upper_bound)
	{
		return;
	}

	std::size_t middle_index = p_lower_bound + (p_upper_bound - p_lower_bound) / 2;

	merge_forward(p_container, p_lower_bound, middle_index + 0);
	merge_forward(p_container, middle_index + 1, p_upper_bound);


	///////////////////////////////////
	// Recursive section



	// Sorting section
	///////////////////////////////////


	// Finding the length of each sub array...
	std::size_t lhs_length = (middle_index - p_lower_bound) + 1;
	std::size_t rhs_length = (p_upper_bound - middle_index) + 0;


	// Creating sub arrays...
	T* sub_array_l = new T[lhs_length];
	T* sub_array_r = new T[rhs_length];


	// Copy elements to each sub array...
	for (std::size_t index = std::size_t(0); index < lhs_length; ++index)
	{
		sub_array_l[index] = p_container[index + p_lower_bound];
	}

	for (std::size_t index = std::size_t(0); index < rhs_length; ++index)
	{
		sub_array_r[index] = p_container[index + 1 + middle_index];
	}


	// Creating 3 indexes to keep track in each array when iterating.
	std::size_t index_l = std::size_t(0);
	std::size_t index_r = std::size_t(0);
	std::size_t index_s = p_lower_bound;

	bool element_l_is_smaller = false;
	bool element_r_is_smaller = false;


	// Merging
	while (index_l < lhs_length && index_r < rhs_length)
	{
		element_l_is_smaller = (sub_array_l[index_l] < sub_array_r[index_r]);
		element_r_is_smaller = (sub_array_l[index_l] > sub_array_r[index_r]);

		if (element_l_is_smaller)
		{
			p_container[index_s] = sub_array_l[index_l];
			++index_l;
			++index_s;

			continue;
		}

		if (element_r_is_smaller)
		{
			p_container[index_s] = sub_array_r[index_r];
			++index_r;
			++index_s;

			continue;
		}
	}


	// Possibly, there are still some elements remaining in each sub array...
	while (index_l < lhs_length)
	{
		p_container[index_s] = sub_array_l[index_l];
		++index_l;
		++index_s;
	}

	while (index_r < rhs_length)
	{
		p_container[index_s] = sub_array_r[index_r];
		++index_r;
		++index_s;
	}


	///////////////////////////////////
	// Sorting section
};

template<typename T, std::size_t S>
static void algorithms::sort::merge_reverse(T(&p_container)[S], std::size_t p_lower_bound, std::size_t p_upper_bound)
{
	// Recursive section
	///////////////////////////////////


	if (p_lower_bound >= p_upper_bound)
	{
		return;
	}

	std::size_t middle_index = p_lower_bound + (p_upper_bound - p_lower_bound) / 2;

	merge_reverse(p_container, p_lower_bound, middle_index + 0);
	merge_reverse(p_container, middle_index + 1, p_upper_bound);


	///////////////////////////////////
	// Recursive section



	// Sorting section
	///////////////////////////////////


	// Finding the length of each sub array...
	std::size_t lhs_length = (middle_index - p_lower_bound) + 1;
	std::size_t rhs_length = (p_upper_bound - middle_index) + 0;


	// Creating sub arrays...
	T* sub_array_l = new T[lhs_length];
	T* sub_array_r = new T[rhs_length];


	// Copy elements to each sub array...
	for (std::size_t index = std::size_t(0); index < lhs_length; ++index)
	{
		sub_array_l[index] = p_container[index + p_lower_bound];
	}

	for (std::size_t index = std::size_t(0); index < rhs_length; ++index)
	{
		sub_array_r[index] = p_container[index + 1 + middle_index];
	}


	// Creating 3 indexes to keep track in each array when iterating.
	std::size_t index_l = std::size_t(0);
	std::size_t index_r = std::size_t(0);
	std::size_t index_s = p_lower_bound;

	bool element_l_is_bigger = false;
	bool element_r_is_bigger = false;


	// Merging
	while (index_l < lhs_length && index_r < rhs_length)
	{
		element_l_is_bigger = (sub_array_l[index_l] > sub_array_r[index_r]);
		element_r_is_bigger = (sub_array_l[index_l] < sub_array_r[index_r]);

		if (element_l_is_bigger)
		{
			p_container[index_s] = sub_array_l[index_l];
			++index_l;
			++index_s;

			continue;
		}

		if (element_r_is_bigger)
		{
			p_container[index_s] = sub_array_r[index_r];
			++index_r;
			++index_s;

			continue;
		}
	}


	// Possibly, there are still some elements remaining in each sub array...
	while (index_l < lhs_length)
	{
		p_container[index_s] = sub_array_l[index_l];
		++index_l;
		++index_s;
	}

	while (index_r < rhs_length)
	{
		p_container[index_s] = sub_array_r[index_r];
		++index_r;
		++index_s;
	}


	///////////////////////////////////
	// Sorting section
};

#endif	// MERGE_SORT
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





### Iterator approach



<!-- ############################################# Separator - Top ############################################# -->

<hr>

<br>

<!-- ############################################# Separator - Top ############################################# -->



<code><h3>Theory</h3></code>

<p>
// The idea behind these set of functions is that instead of trying to
		// obtain the actual container type, we try and get the iterators that
		// enable us to interact with the elments directly. This way we are 
		// independent from the type of containers. Surprisingly, this is the
		// same method that most algorithms from the <algorithm> header file
		// and the STL library use in order to approach container management
</p>



<code><h3>C-style array</h3></code>

<p>
Eventhough C-style arrays are, as many times mentioned before, not ideal to use in C++, but it in inevidible that we will eventually face them even if the only reason is for compatibility reasons. So, lets see how to implement bubble sort this way:
</p>



<br>
<br>
<br>



```C++
#ifndef QUICK_SORT
#define QUICK_SORT

#include <iostream>
#include <algorithm>

namespace algorithms
{
	enum order
	{
		forward = 0,
		reverse = 1
	};

	namespace sort
	{
		template<typename T, std::size_t S>
		void quick(T(&p_container)[S], const algorithms::order& p_order = algorithms::order::forward, std::size_t p_lower_bound = std::size_t(0), std::size_t p_upper_bound = S - 1);

		template<typename T, std::size_t S>
		static void quick_forward(T(&p_container)[S], std::size_t p_lower_bound = std::size_t(0), std::size_t p_upper_bound = S - 1);

		template<typename T, std::size_t S>
		static void quick_reverse(T(&p_container)[S], std::size_t p_lower_bound = std::size_t(0), std::size_t p_upper_bound = S - 1);
	};
};


template<typename T, std::size_t S>
void algorithms::sort::quick(T(&p_container)[S], const algorithms::order& p_order, std::size_t p_lower_bound, std::size_t p_upper_bound)
{
	bool is_forward_order = (p_order == algorithms::order::forward);

	if (is_forward_order)
	{
		algorithms::sort::quick_forward(p_container, p_lower_bound, p_upper_bound);

		return;
	}

	algorithms::sort::quick_reverse(p_container, p_lower_bound, p_upper_bound);
};

template<typename T, std::size_t S>
static void algorithms::sort::quick_forward(T(&p_container)[S], std::size_t p_lower_bound, std::size_t p_upper_bound)
{
	// If the container is of size 1 or 0, then just return
	if (p_lower_bound >= p_upper_bound)
	{
		return;
	}

	// Choosing the last element as the pivot
	const T& pivot_element = p_container[p_upper_bound];

	std::size_t rhs_pointer = p_upper_bound;
	std::size_t lhs_pointer = p_lower_bound;

	while (lhs_pointer < rhs_pointer)
	{
		while (p_container[lhs_pointer] <= pivot_element && lhs_pointer < rhs_pointer)
		{
			++(lhs_pointer);
		}

		while (p_container[rhs_pointer] >= pivot_element && rhs_pointer > lhs_pointer)
		{
			--(rhs_pointer);
		}

		std::swap(
			p_container[lhs_pointer],
			p_container[rhs_pointer]
		);
	}

	// Now just swap the position of the pivot element with one of the pointer elements.
	std::swap(
		p_container[lhs_pointer],
		p_container[p_upper_bound]
	);

	// As a safety check for `std::size_t`. If you use an int, this wont' be nccessary.
	if (lhs_pointer == std::size_t(0))
	{
		return;
	}

	algorithms::sort::quick_forward(p_container, p_lower_bound, lhs_pointer - 1);
	algorithms::sort::quick_forward(p_container, lhs_pointer + 1, p_upper_bound);
};

template<typename T, std::size_t S>
static void algorithms::sort::quick_reverse(T(&p_container)[S], std::size_t p_lower_bound, std::size_t p_upper_bound)
{
	// If the container is of size 1 or 0, then just return
	if (p_lower_bound >= p_upper_bound)
	{
		return;
	}

	// Choosing the last element as the pivot
	const T& pivot_element = p_container[p_upper_bound];

	std::size_t rhs_pointer = p_upper_bound;
	std::size_t lhs_pointer = p_lower_bound;

	while (lhs_pointer < rhs_pointer)
	{
		while (p_container[lhs_pointer] >= pivot_element && lhs_pointer < rhs_pointer)
		{
			++(lhs_pointer);
		}

		while (p_container[rhs_pointer] <= pivot_element && rhs_pointer > lhs_pointer)
		{
			--(rhs_pointer);
		}

		std::swap(
			p_container[lhs_pointer],
			p_container[rhs_pointer]
		);
	}

	// Now just swap the position of the pivot element with one of the pointer elements.
	std::swap(
		p_container[lhs_pointer],
		p_container[p_upper_bound]
	);


	// As a safety check for `std::size_t`. If you use an int, this wont' be nccessary.
	if (lhs_pointer == std::size_t(0))
	{
		return;
	}

	algorithms::sort::quick_reverse(p_container, p_lower_bound, lhs_pointer - 1);
	algorithms::sort::quick_reverse(p_container, lhs_pointer + 1, p_upper_bound);
};

#endif	// QUICK_SORT
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