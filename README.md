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

Snippet 1
```ruby
+def print_rainbow(array)
 +  array.each do |element|
 +    color = element.keys
 +    color_string = color[0].to_s
 +    puts color_string.colorize(color[0])
 +  end
 +end
```
ex1 - Big O: O(n) seems like it is iterating the array loop just once

Snippet 2
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
 ex2. Big O: O(1) there isn't even an argument to adjust, it just checks the @number_of_guesses one time

Snippet 3
```ruby
+  def draw_guesses
 +  	# split word and put letters in array
 +    until @letter_array.length == @word.length
 +     	@word.split("").each do |letter|
 +    	   @letter_array.push(letter)
 +      end
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
ex3 - Big O: O(n)  definitely not sure about this one. even though i see what look like loops within loops, it feels like the initial 'until' call is actually just doing one thing, which is making the @letter_array.length == @word.length by pushing letters into it, so that seems linear. after that i think it will move on to the word_length.times part which also seems linear, and then the last part which is outside of that loop is also linear....it's tough when you can't see the rest of the code.  reading other people's code is hard!

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
ex4 - big O: O(n^2)  looks like the entries.each loop is exponential, because it is going to go through each entry and adjust the value for emoticons[emoticon] every time with another linear method.  after that though to be able to return the proper value, it needs to do a max_by enumerable, which seems like it will be exponential because it will need to check values against each other to find the max. n^2 + n^2 = 2n^2, which simplifies back to n^2

Snippet 5 - Big O:
```ruby
+def overall_mood
 +  all = {
 +    positive: 0,
 +    negative: 0,
 +    meh: 0
 +  }
 +  text.each do |aline|
 +    line = strip_punctuation(aline)   #- linear
 +    face = analyze_mood(line)         #- linear (at least going by my method for analyze_mood)
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
ex 5 - big O: O(n^2) seems like to create local variable 'line', it is linear, and then i had to go by the method that i wrote for analyze_mood, which i'm pretty sure was linear, so n^2, but then at the end they used a max_by method which again seems like it will need to hold values and use them to compare to other values, which is exponential. together they would make 2n^2, but we lost that coefficient


Snippet 6 - Big O:
```ruby
+def overall_mood(array)
 +  happy_moods = []
 +  sad_moods = []
 +  neutral_moods =[]
 +  array.each do |line|
 +    moods = analyze_mood(line)  #my method for this was linear
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
ex 6 - big O: O(n^2)  I don't think i have any other option but to use my method for analyze_mood which i'm pretty sure was linear. the only loop in this method is asking us to go through each line and do something linear, so it seems like n * n which will be n^2

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

ex 7 = Big O: O(n) this code confused the crap out of me.  i even tried to run it in irb to see what the hell it was doing and it kept just giving me error messages.  i assumed that num was an array since we could call .length on it and use indexing to get out values, so i guess the for loop is iterating through and assigning a value to 'key' (which is a misleading variable name if you ask me) and then assigning a value to 'i', then we jump into the while loop which also seems like it is linear, so together i think this might be exponential, but i'm really not sure what's happening here.  also apparently i have forgotten how to end sentences and use proper grammar...

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
ex 8 - big O: O(n^2) exponential  . looks like a loop within a loop

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

ex 9 - big O: O(n^2) i've never seen java, but this looks like a for loop within a for loop, which seems exponential

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
ex 10 - this just looks terrible, big O = awful.  is that the technical term?
