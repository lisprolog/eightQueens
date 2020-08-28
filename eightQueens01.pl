 #!/usr/bin/perl -l


 sub placequeen
   {
   $_[0]=~/^(.)(.*(.))(??{abs$1-$3!=length$2 && 'x'})/ ? () : 
     length $_[0] == 8 ? @_ : map $_[0]=~$_?():placequeen("$_@_"), 0..7
   }
 print map '.'x$_.'Q'.'.'x(7-$_)."\n", /./g for placequeen;
