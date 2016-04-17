# Evaluating Efficiency

1. Read the following article on Big O: [Big O Notation & Complexity in Ruby](https://samurails.com/interview/big-o-notation-complexity-ruby/)
2. Work through [this quiz](http://www.codequizzes.com/computer-science/big-o-algorithms) on Big O. Try out the code snippets and read the answers.
3. Do the assignment below and submit a PR with your answers.


## Assignment - Determine the big O
Give the efficiency of each of the following code snippets

Snippet EX - Big O: Answer given for this first example: O(n^2)
```ruby
+  rainbow.each do |item|
 +    item.each do |key, value|
 +     puts Rainbow(key.to_s).color(value[:r], value[:g], value[:b])
 +    end
 +  end
```

Snippet 1 - Big O:
```ruby
+def print_rainbow(array)
 +  array.each do |element|
 +    color = element.keys
 +    color_string = color[0].to_s
 +    puts color_string.colorize(color[0])
 +  end
 +end
```

**Answer: O(n)**

_This is one loop through the array for each element, therefore it is linear._

Snippet 2 - Big O:
```ruby
+  def lose?
 +    if @number_of_guesses == 0
 +      puts "The dinosaur chomps you before you are able to guess the word, '#{ @answer_validation_array.join("") }'."
 +      puts "You were eaten :("
 +      return true
 +    else
 +      return false
 +    end
 +  end
```

**Answer: O(1)**

_This has no loops, so no matter how much data we have, the amount of time to execute this method should be constant._


Snippet 3 - Big O:
```ruby
+  def draw_guesses
 +  	# split word and put letters in array
 +    until @letter_array.length == @word.length
 +      	@word.split("").each do |letter|
 +    			@letter_array.push(letter)
 +      	end
 +    	word_length = @letter_array.length
 +    	word_length.times do
 +    		@dashes_array.push("_ ")
 +    	end
 +    end
 +		@dashes_array.each do |dash|
 +			print dash
 +		end
 +    # draws blank spaces or correct guesses under ice cream
 +  end
```

**Answer: O(n^3)**

_Struggling with this one, as I am not sure about the ```until loop``` with 2 nested ```.each``` loops, but I am thinking the ```until``` loop also counts as O(n). The loop outside of everything also has O(n), but I am thinking we need to consider the worse case here, so just the three loops. Otherwise, this would be O(n^4)._

Snippet 4 - Big O:
```ruby
def overall_mood(entries)
  return nil if entries.length == 0
  emoticons = Hash.new(0)
  entries.each do |entry|
    emoticon = analyze_mood(entry)
    emoticons[emoticon] += 1
  end
  return emoticons.max_by{|k,v| v}[0]
end
```

**Answer: O(n^2)**

_The ```analyze_mood``` method has a loop in it (from our example in the mood analysis). The method here has another ```.each``` loop. At the return, the ```.max_by``` loop is actually two loops, as it does a ```.each``` loop as well (as an enumerable), but from my understanding these happen together. We are looking at the worst case, which is the first loop with the ```analyze_mood``` method that has another loop. Nested loops like this have O(n^2)._

Snippet 5 - Big O:
```ruby
+def overall_mood
 +  all = {
 +    positive: 0,
 +    negative: 0,
 +    meh: 0
 +  }
 +  text.each do |aline|
 +    line = strip_punctuation(aline)
 +    face = analyze_mood(line)
 +    if face == ":-)"
 +      all[:positive] +=1
 +    if face == ":-("
 +      all[:negative] +=1
 +    else
 +      all[:meh] +=1
 +    end
 +  end
 +  largest = all.max_by{|key, value| value}
 +  puts "#{largest.keys} is most common mood"
 +end
```

**Answer: O(n^2)**

_Again we have two nested looped since the ```analyze_mood``` method has a loop inside of it. The ```.max_by``` here is the same as the above snippet - although it is essentially 2 loops, they happen together and so the other loops are considered "worst case"._

Snippet 6 - Big O:
```ruby
+def overall_mood(array)
 +  happy_moods = []
 +  sad_moods = []
 +  neutral_moods =[]
 +  array.each do |line|
 +    moods = analyze_mood(line)
 +    if moods == ":-)"
 +      happy_moods << moods
 +    elsif moods == ":-("
 +      sad_moods << moods
 +    else
 +      neutral_moods << moods
 +    end
 +  end
 +  happy_length = happy_moods.length
 +  sad_length = sad_moods.length
 +  neutral_length = neutral_moods.length
 +
 +  if happy_length > sad_length && happy_length > neutral_length
 +    return "The most common mood is :-)"
 +  elsif sad_length > happy_length && sad_length > neutral_length
 +    return "The most common mood is :-("
 +  else
 +    return "The most common mood is :-|"
 +  end
 +end
```

**Answer: O(n^2)**

_And again we have two nested looped since the ```analyze_mood``` method has a loop inside of it._

Snippet 7 - Big O:
```ruby
for j in 2..num.length
	key = num[j]
	i = j - 1
	while i > 0 and num[i] > key
		num[i+1] = num[i]
		i = i - 1
	end
	num[i+1] = key
end
```

Snippet 8 - Big O:
```ruby
n.times do |i|
  index_min = i
  (i + 1).upto(n) do |j|
    index_min = j if a[j] < a[index_min]
  end
  # Yep, in ruby I can do that, no aux variable. w00t!
  a[i], a[index_min] = a[index_min], a[i] if index_min != i
end
```

Snippet 9 - Big O:
```java
public int[] sort(int[] toSort) {
  for (int i = 0; i < toSort.length -1; i++) {
    boolean swapped = false;
    for (int j = 0; j < toSort.length - 1 - i; j++) {
      if(toSort[j] > toSort[j+1]) {
        swapped = true;
        int swap = toSort[j+1];
        toSort[j + 1] = toSort[j];
        toSort[j] = swap;
      }
    }
    if(!swapped)
        break;
  }
  return toSort;
}
```

Snippet 10 - Big O:
```java
import java.util.Random;

public class GoBozo {
	public static void main(String args[]) {
		int[] arMyValues = { 3, 2, 1, 5, 4 };
		BozoSort(arMyValues);

		System.out.println("Array sorted... you bozo!");

		// Loop through the array and show it sorted.
		for (int i = 0; i < 5; i++) {
			System.out.println("Element: " + i + " - " + arMyValues[i]);
		}
	}

	// BozoSort Algorithm
	// Warning: Highly inefficient and not recommended for large arrays.
	// Use with caution, it is for bozos after all!
	private static void BozoSort(int[] arValues) {
		int slot1 = 0;
		int slot2 = 0;
		int temp;

		Random rand = new Random();

		// Continue until sorted
		while (!isSorted(arValues)) {
			// Pick two values at random.
			slot1 = rand.nextInt(arValues.length);
			slot2 = rand.nextInt(arValues.length);

			// Swap the values and go for a retest.
			temp = arValues[slot1];
			arValues[slot1] = arValues[slot2];
			arValues[slot2] = temp;
		}
	}

	// Loop through the array and determine if one value is larger
	// than the one after it. If it is, then it isn't sorted.
	// Returns true if the array is sorted.
	private static boolean isSorted(int[] arValues) {
		for (int i = 0; i < arValues.length - 1; i++) {
			if (arValues[i] > arValues[i + 1]) {
				return false;
			}
		}

		return true;
	}
}
```
