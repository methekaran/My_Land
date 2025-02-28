Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

 

Example 1:

Input: s = "abc", t = "ahbgdc"
Output: true
Example 2:

Input: s = "axc", t = "ahbgdc"
Output: false

Int sp,tp;

While (sp < s.strlen() && tp < t.strlen())begin
   If(s[sp]==t[tp])begin
      sp+=1;
   end
   tp=tp+1;
end
Return (sp==s.strlen());
