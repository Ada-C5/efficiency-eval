# 1. linear O(n)
# 2. constant O(1)
# 3. exponential O(n^2) 
# 4. On first pass it looks linear O(n) but the line 
# 		emoticon = analyze_mood(entry) 
# 		is a function call to a function I cannot see which may contain a loop? 
#     Therefore it is O(n^2)
# 5. Same as the previous, with added:
#     line = strip_punctuation(aline)
#     face = analyze_mood(line)
# 		therefore I think this is O(n^3)
# 6. exponential O(n^2)
# 7. linear O(n)
# 8. exponential O(n^2)
# 9. exponential O(n^2)
# 10. exponential O(n^2)

# I thought I understood this stuff but want to go over it more if possible.
# It feels a little shaky. 