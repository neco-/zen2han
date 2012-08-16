#!perl

use utf8;
use Encode;

my $file = "zen2han.tmp";
my $filesize = -s $file;

open(my $hfile, "<", $file) or die "Cannot open $file: $!";
read($hfile, $text, $filesize);
close($hfile);

my $utf_text = decode_utf8($text);
my @list = ();
for my $str (split /\n/, $utf_text)
{
  $str =~ tr/０-９ａ-ｚＡ-Ｚ　/0-9a-zA-Z /;
  push @list, $str;
}

foreach my $elem(@list)
{
  print "$elem\n";
}

