#Metacharacters
sub(pattern = "\\.",replacement = "",x='Peace.Love')#gives 'Peacelove'-\\escapes metacharacters
sub(pattern = "\\?",replacement = "Y",x="money?train")#gives 'moneyYtrain'
sub(pattern = '\\{',replacement = "t",x='raspy{voice}')#gives "raspytvoice}"
sub(pattern = '\\|',replacement = 'w',x='tweeter|people')#gives "tweeterwpeople"
#Sequences
sub(pattern = '\\d',replacement = '?',x = 'what is 2067?')#gives "what is ?067?"
gsub(pattern = '\\d',replacement = '@',x='your no. is 23939')#gives "your no. is @@@@@"
sub('\\D','',x='what is your name?')#"hat is your name?"-replaces first non-digit with ''
gsub('\\D','',x='what is your name?23545')# "23545"-replaces all non-digits with ''
sub('\\s','',x='what is the factor?')#"whatis the factor?"-replaces first space
gsub('\\s','',x='what is the factor?')#"whatisthefactor?"-replaces all spaces
sub('\\S','-',x='who is yer father?')#"-ho is yer father?"-replaces first non-space
gsub('\\S','-',x='who is yer father?')#"--- -- --- -------"-replaces all non-spaces
sub('\\b','-',x='what not is this?')#"-what not is this?"
gsub('\\b','-',x='what not is this?')# "-w-h-a-t- -n-o-t- -i-s- -t-h-i-s-?-"
#regex character classes
grep(pattern="[ao]",c('what','is','oats?'),value=T)#"what"  "oats?"
grep(pattern="[0-9]",c('213','aser','2ws1'),value = T)#"213"  "2ws1"
grep(pattern = '[a-z]',c('2345','quad','4988','gffd'),value = T)#"quad" "gffd"
grep(pattern='[qofg]',c('qwerty','owl','tier','fog'),value=T)#"qwerty" "owl" "fog" 
# POSIX character classes
la_vie = "La vie en #FFC0CB (rose);nnCest la vie! nttres jolie"
gsub(pattern="\\s",replacement = '',la_vie)
gsub(pattern='[[:blank:]]',replacement = '',x=la_vie)#remove space
gsub(pattern = "[[:punct:]]",replacement = 'K',x=la_vie)#remove punctuation
gsub(pattern = '[[:xdigit:]]',replacement = 'W',x=la_vie)
gsub(pattern = '[[:print:]]',replacement='x',x=la_vie)
#quantifiers
p = c('raja','meena','prem','tiara','tarun','kunwar','ajay','vijay')
grep(pattern = 'm?',p,value = T)
grep(pattern = 'm{1}',p,value = T)
grep(pattern = 'r{1}',p,value = T)
grep(pattern = 'r*',p,value = T)
grep(pattern = 'r*m',p,value = T)
grep(pattern = 'm*r',p,value = T)
grep(pattern = 'e{2}',p,value = T)
grep(pattern = 'e*t',p,value = T)
grep(pattern = 'a{2}',p,value = T)
