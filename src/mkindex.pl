#!/usr/bin/perl -w
#
#	mkindex.pl	: Make index for UTP project
#	Deri James	: Monday 07 Jan 2013
#
# Input file produced by .ix macro
#

use strict;
use constant {
    TXT		=> 0,
    PAGE		=> 1,
    LABEL	=> 2,
    TYPE		=> 3,
};

my (%idx,%bkm,%wds,%ltr);

while (<>)
{
    chomp;

    next if ! s/^ix: //;

    my (@r)=split("\t");

    # clean

    foreach (@r)
    {
	s/^ +//;
	s/ +$//;
	s/  +/ /g;
    }

    # deroman

#    $r[PAGE]=1000-from_roman($r[PAGE]) if $r[PAGE]=~m/^[ivxlc]+$/;

    # range.prep

    $r[TYPE]='a';
    $r[TYPE]='b' if $r[TXT]=~s/\%begin //;
    $r[TYPE]='e' if $r[TXT]=~s/\%end //;

    # rotate

    my (@tok,@keys);

    if ($r[TXT]=~m/ %key /)
    {
	$tok[0]=$r[TXT];
    }
    else
    {
	(@tok)=split(' ',$r[TXT]);
    }

    foreach (@tok) {s/%~/QQ1QQ/g; tr/~/ /; s/QQ1QQ/%~/g;}

    foreach my $j (0..$#tok)
    {
	my $key=join(' ',@tok[$j..$#tok]);
	$key.=', '.join(' ',@tok[0..$j-1]) if $j>0;

	if ($r[TYPE] eq 'a')
	{
	    push(@{$idx{$key}->{DATA}},[$r[LABEL],$r[PAGE]]);
	}
	elsif ($r[TYPE] eq 'b')
	{
	    $idx{$key}->{$r[TYPE]}=[$r[LABEL],$r[PAGE]];
	}
	else
	{
	    if (exists($idx{$key}->{b}))
	    {
		my $st=$idx{$key}->{b}->[1];
		my $lab=$idx{$key}->{b}->[0];
		$st.="\\[en]$r[PAGE]" if $r[PAGE] > $st;
		push(@{$idx{$key}->{DATA}},[$lab,$st]);
		delete($idx{$key}->{b});
	    }
	    else
	    {
		print STDERR "No matching %begin record for key '$key'\n";
	    }
	}
    }
}

# see terms

if (open(F,"<see.terms"))
{
    while (<F>)
    {
	chomp;

	my (@r)=split("\t");

	if ($r[2] and $r[2]=~m/\%also/)
	{
	    push(@{$idx{"$r[0], {see also} $r[1]"}->{DATA}},[]);
	}
	else
	{
	    push(@{$idx{"$r[0], {see} $r[1]"}->{DATA}},[]);
	}
    }

    close(F);
}

# gen.key

foreach my $key (keys %idx)
{
    my ($skey,$val);

    if ($key=~m/^(.*) %key (.*)/)
    {
	$skey=$2;
	$val=$1;
	$skey=~tr'/''d;
    }
    else
    {
	$skey=Clean($key);
	$val=$key;

    }

    $skey="!!$skey" if $skey=~m/^[^a-zA-Z]+$/;
    $skey="!$skey" if $skey=~m/^[0-9]/;

#    $skey=lc($skey);
    if (exists($bkm{$skey}))
    {
	push(@{$bkm{$skey}->{DATA}},@{$idx{$key}->{DATA}});
	$bkm{$skey}->{CT}+=$#{$idx{$key}->{DATA}}+1;
	print STDERR "Duplicate key '$skey' merged\n";
    }
    else
    {
	$bkm{$skey}->{DATA}=$idx{$key}->{DATA};
	$bkm{$skey}->{CT}=$#{$idx{$key}->{DATA}}+1;
	$bkm{$skey}->{AKEY}=$val;
    }
}

foreach my $key (sort {lc($a) cmp lc($b)} keys %bkm)
{
    my $skey=$key;
    $skey=~tr[,][]d;
    my ($wd1,$wd2)=split(' ',$skey);
    $wd2='' if !defined($wd2);
    my $flt=substr($wd1,0,1);
    my $typ=2;
    my $txt=$bkm{$key}->{AKEY};

    # types: 1="{see...}",2=normal,4="^[...]", 3="...[...]..."

    if ($txt=~m/{see/)
    {
	$typ=1;
    }
    elsif ($txt=~m/^\[/)
    {
	$typ=4;
    }
    elsif ($txt=~m/\[.*\]/)
    {
	$typ=3;
    }

    my $nowds=split(' ',$txt);

    $wd2=Clean($wd2);

    $wds{$wd1}->[$typ]->{WCT}++,$wds{$wd1}->[$typ]->{MINWDS}=$nowds if !exists($wds{$wd1}->[$typ]->{WORDS}->{$wd2});
    push(@{$wds{$wd1}->[$typ]->{WORDS}->{$wd2}},$bkm{$key});
    $wds{$wd1}->[$typ]->{CT}++;
    $wds{$wd1}->[$typ]->{MINWDS}=$nowds if $wds{$wd1}->[$typ]->{MINWDS} > $nowds;
}

my $lastflt='';

print <<'EOF';
.ig
Index formatting macros, lifted from CSTR #128
with slight changes to fit the UTP manual
..
.so utp.mac
.\" Precedes each index term
.de XX
.br
.ti -.2i
.ne 2
..
.de ZZ
.br
..
.\" Header between letters
.de YY
.sp 1.5
.ne 3
.ce
.pdfbookmark 2 \\$1
- \\$1 -
.sp .5
..
.Se "" "Index" NONE
.af PN 1
.nr PS 8
.nr VS 9
.\" Just do one column for nroff...
.if t .2C
.na
.in .2i
.hy 0
EOF

foreach my $key (sort {lc($a) cmp lc($b)} keys %wds)
{
    my $flt=lc(substr($key,0,1));

    $lastflt=$flt,print ".YY $flt ",uc($flt),"\n" if ($flt ne $lastflt and $flt ne '!');

    foreach my $j (1..4)
    {
	next if !defined($wds{$key}->[$j]);

	my $wd=$wds{$key}->[$j];

	if ($wd->{WCT}==1)
	{
	    if ($wd->{CT}==1)
	    {
		# simple entry - one word, one entry

		doref($wd->{WORDS},'XX',0,0,0,0);
	    }
	    else
	    {
		# multi...

		if ($wd->{MINWDS} == 2)
		{
		    # The 2 words match the keys

		    doref($wd->{WORDS},'XX',0,0,0,0);
		    doref($wd->{WORDS},'ZZ',2,1,9999,0);
		}
		else
		{
		    # 2 words math, create a leader

		    doref($wd->{WORDS},'XX',0,0,0,2);
		    doref($wd->{WORDS},'ZZ',2,0,9999,0);
		}
	    }
	}
	else
	{
	    # Only 1 word match

    		if ($wd->{MINWDS} == 1  or exists($wd->{WORDS}->{''}))
		{
		    # The words matches the keys

		    doref($wd->{WORDS},'XX',0,0,0,0);
		    doref($wd->{WORDS},'ZZ',1,1,9999,0);
		}
		else
		{
		    # create a leader

		    doref($wd->{WORDS},'XX',0,0,0,1);
		    doref($wd->{WORDS},'ZZ',1,0,9999,0);
		}

	}
    }
}

sub doref
{
    my $w=shift;
    my $typ=shift;
    my $drop=shift;
    my $from=shift;
    my $to=shift;
    my $leader=shift;
    my $outbuf=".$typ\n";
    my $j=-1;

    foreach my $key (sort {lc($a) cmp lc($b)} keys %{$w})
    {
	foreach my $e (@{$w->{$key}})
	{
	    $j++;
	    next if $j < $from;
	    last if $j > $to;

	    my $ent=$e->{AKEY};

	    if ($drop or $leader)
	    {
		my (@l)=split(' ',$ent);
		$ent=join(' ',@l[0..$leader-1]) if $leader;
		$ent=join(' ',@l[$drop..$#l]) if $drop;
	    }

	    $ent=~s/\[(.*?)\]/\\f[CW]$1\\f[P]/g;
	    $ent=~s/\{(.*?)\}/\\f[2]$1\\f[P]/g;

	    $ent="  $ent" if $typ eq 'ZZ';
	    $ent=~s/,+$//;

	    my $ref=$e->{DATA};
	    my $refct=0;
	    my $reftot=$#{$ref};

	    if (!$leader and $#{$ref->[0]} >= 0)
	    {
		$outbuf.="$ent,   \\c\n";
		foreach my $r (@{$ref})
		{
		    my $prefix='';

		    $prefix='-A ,' if $refct < $reftot;
		    $outbuf.=".pdfhref L -D $r->[0] $prefix -E -- $r->[1]\n";
		    $refct++;
		}
	    }
	    else
	    {
		$outbuf.="$ent\n";
	    }
	}
    }
    print $outbuf;
}

sub Clean
{
    my $skey=shift;

    $skey=~tr/_/0/;

    my $quoted=0;

    if ($skey=~m/%/)
    {
	$quoted=1;
	$skey=~s/%%/QQ0QQ/g;
	$skey=~s/%\[/QQ1QQ/g;
	$skey=~s/%\]/QQ2QQ/g;
	$skey=~s/%\{/QQ3QQ/g;
	$skey=~s/%\}/QQ4QQ/g;
	$skey=~s/%~/QQ5QQ/g;
    }

    $skey=~s/%e/\\/g;	# implement troff escape
    $skey=~s/~/ /g;		# remove tildes
    $skey=~tr'%()/[]{}''d;	# remove % and font-changing []{}

    if ($quoted)
    {  # restore literals but without escape charcter
	$skey=~s/QQ0QQ/%/g;
	$skey=~s/QQ1QQ/[/g;
	$skey=~s/QQ2QQ/]/g;
	$skey=~s/QQ3QQ/{/g;
	$skey=~s/QQ4QQ/}/g;
	$skey=~s/QQ5QQ/~/g;
    }

    return($skey);
}

my $end=1;

my @trans = (
    [M  => 1000],     [CM => 900],
    [D  => 500],      [CD => 400],
    [C  => 100],      [XC => 90],
    [L  => 50],       [XL => 40],
    [X  => 10],       [IX => 9],
    [V  => 5],        [IV => 4],
    [I  => 1],
);

sub firstword
{
    my $wd=shift;

    my ($ret)=split(' ',$wd,2);
    $ret=~s/,//;
    return $ret;
}

sub from_roman {
    my $r = shift;
    my $n = 0;
    foreach my $pair (@trans) {
	my ($k, $v) = @$pair;
	$n += $v while $r =~ s/^$k//i;
    }
    return $n


}
