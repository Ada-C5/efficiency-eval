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

Snippet 1 - Big O: O(n^2) because it goes through one loop and it accesses a hash
```ruby
+def print_rainbow(array)
 +  array.each do |element| #Loop 1
 +    color = element.keys # accessing a hash also has an efficiency of O(n)
 +    color_string = color[0].to_s
 +    puts color_string.colorize(color[0])
 +  end
 +end
```

Snippet 2 - Big O: O(1) because it only accesses the array
```ruby
+  def lose?
 +    if @number_of_guesses == 0
 +      puts "The dinosaur chomps you before you are able to guess the word, '#{ @answer_validation_array.join("")  }'."   
 +      puts "You were eaten :("
 +      return true
 +    else
 +      return false
 +    end
 +  end
```

Snippet 3 - Big O: O(n^3) because of a loop within a loop with an insertion to array inside
```ruby
+  def draw_guesses
 +  	# split word and put letters in array
 +    until @letter_array.length == @word.length # one loop
 +      @word.split("").each do |letter| # another loop
   +    	@letter_array.push(letter) # array insert O(n)
 +      end
 +    	word_length = @letter_array.length # not array search/insert/delete so O(1)
 +    	word_length.times do  # loop
 +    		@dashes_array.push("_ ") # array insert O(n) inside loop
 +    	end
 +    end
 +		@dashes_array.each do |dash| #another loop
 +			print dash
 +		end
 +    # draws blank spaces or correct guesses under ice cream
 +  end
```

Snippet 4 - Big O: O(n^2)
```ruby
def overall_mood(entries)
  return nil if entries.length == 0
  emoticons = Hash.new(0)
  entries.each do |entry|  # loop O(n)
    emoticon = analyze_mood(entry)  #also O(n)
    emoticons[emoticon] += 1
  end
  return emoticons.max_by{|k,v| v}[0]
end
```

Snippet 5 - Big O: O(n^2)
```ruby
+def overall_mood
 +  all = {
 +    positive: 0,
 +    negative: 0,
 +    meh: 0
 +  }
 +  text.each do |aline| #loop
 +    line = strip_punctuation(aline)
 +    face = analyze_mood(line) #loop
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

Snippet 6 - Big O: O(n^2)
```ruby
+def overall_mood(array)
 +  happy_moods = []
 +  sad_moods = []
 +  neutral_moods =[]
 +  array.each do |line| #loop
 +    moods = analyze_mood(line) #loop
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

Snippet 7 - Big O: O(n^2)
```ruby
for j in 2..num.length #loop
	key = num[j]
	i = j - 1
	while i > 0 and num[i] > key #loop
		num[i+1] = num[i]
		i = i - 1
	end
	num[i+1] = key
end
```

Snippet 8 - Big O: O(n^2)
```ruby
n.times do |i| #loop
  index_min = i
  (i + 1).upto(n) do |j| #loop
    index_min = j if a[j] < a[index_min]
  end
  # Yep, in ruby I can do that, no aux variable. w00t!
  a[i], a[index_min] = a[index_min], a[i] if index_min != i
end
```

Snippet 9 - Big O: O(n^2)
```java
public int[] sort(int[] toSort) {
  for (int i = 0; i < toSort.length -1; i++) {  // loop
    boolean swapped = false;
    for (int j = 0; j < toSort.length - 1 - i; j++) { //loop
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

Snippet 10 - Big O: O(n^3)
```java
import java.util.Random;

public class GoBozo {
	public static void main(String args[]) {
		int[] arMyValues = { 3, 2, 1, 5, 4 };
		BozoSort(arMyValues);

		System.out.println("Array sorted... you bozo!");

		// Loop through the array and show it sorted.
		for (int i = 0; i < 5; i++) {  //loop 1
			System.out.println("Element: " + i + " - " + arMyValues[i]); // with loop 2 inside
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
		while (!isSorted(arValues)) { //loop 2 with loop 3 inside
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
		for (int i = 0; i < arValues.length - 1; i++) { //loop 3  
			if (arValues[i] > arValues[i + 1]) {
				return false;
			}
		}

		return true;
	}
}
```
