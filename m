From: David Pottage <david@chrestomanci.org>
Subject: Temperature Limiting Govenor?
Date: Tue, 31 Jan 2006 09:45:01 +0000
Message-ID: <43DF319D.2010105@chrestomanci.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hi.

I have an AMD64 system, that will tend to heat up hotter than I would 
prefer if it is run at the maximum clock speed, especialy in summer.

In order to prolong the life of the CPU, and other components in my 
case, I have written a simple user space governor in perl, that 
dynamically limits the maximum clock speed to prevent CPU overheat, 
while allowing short busts at full speed.

On my system this allows me busts of high CPU speed for good interactive 
performance, while preventing long running processes such as media 
encoding from causing exesively high temperatures.

Would it be worthwhile incorporating similar functionality into a kernel 
space governor? How easy would it be to do? Is it possible for more than 
one governor to be active at once?

The script:
-----------------------------------

*#!/usr/bin/perl -w*

/# Setup Pragmas./
*use* *strict*;
*use* *diagnostics*;

*my* $usage = *"*cpuLimitTemp.pl [<maxTemp>]*"*;

*my* $maxTemp = 60;   /# Default value./

*sub *main ()
{
    /# Code to read command line args./
    $maxTemp = $1 *if*( scalar @ARGV && $ARGV[0] =~ *m!*(\d+)*!* );

    /# Grab a list of CPU frequencies available, find out which is the current max./
    *my* @freqList = getFreqList();
    *my* $curLimit = getCurFreqLimit(@freqList);

    *while*( 1 )
    {
        *my* $curTemp = getCurTemp();

        *if*( $maxTemp < $curTemp )
        {
            /# Reduce the maximum available CPU frequency, to prevent overheat./
            *if*( $curLimit + 1 == scalar @freqList )
            {
                /# We are already at the lowest available CPU frequency./
                /# Drastic measures might be taken here, such as system shutdown./
                print STDERR *"*WARNING: Possible overheat: temp: $curTemp\n*"*;
            }
            *else*
            {
                /# Reduce the maximum available CPU frequency./
                setMaxFreq( $freqList[++$curLimit] );
                printf STDERR *"*Reducing   CPU frequency ceiling to % 5d MHz, Temp is: %d\n*"*,
                    $freqList[$curLimit]/1000, $curTemp;
            }

            sleep 30;
        }
        *elsif*( 0 != $curLimit )
        {
            /# The CPU has cooled after a previous overheat, increase the temperature back up./
            setMaxFreq( $freqList[--$curLimit] );
            printf STDERR *"*Increasing CPU frequency ceiling to % 5d MHz, Temp is: %d\n*"*,
                    $freqList[$curLimit]/1000, $curTemp;
            sleep 30;
        }

        sleep 1;
    }

    *return* 0;
}

*sub *getCurTemp
{
    open SENSOR, *'*-|*'*, *"*sensors*"* *or* die *"*Error getting CPU temp $!*"*;
    *while*( *my* $line = *<SENSOR>* )
    {
        *if*( $line =~ *m!*^CPU Temp:\s+([+-]?\d+) C*!* )
        {
            close SENSOR;
            *return* 0+$1;    /# Force to a number./
        }
    }

    die *"*Error CPU temp not reported by sensors*"*;
}

*sub *setMaxFreq ($)
{
    *my*($newFreq) = @_;
    open LIMITFILE, *'*>*'*, *'*/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq*'*
        *or* die *"*Cannot change the maximum CPU frequency.*"*;
    print LIMITFILE $newFreq;
    close LIMITFILE;
}

*sub *getFreqList
{
    open FREQFILE, *'*<*'*, *'*/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies*'*
        *or* die *"*Error, cannot read list of available CPU frequencies $!*"*;
    *my* $rawFreqList = *<FREQFILE>*;
    $rawFreqList =~ *s!*\s+$*!!*;
    *my* @freqList = reverse sort {$a <=> $b} split( */* */*, $rawFreqList);
    close FREQFILE;
    *return* @freqList;
}

*sub *getCurFreqLimit (@)
{
    *my* @freqList = @_;

    /# Read the current max freq./
    open LIMITFILE, *'*<*'*, *'*/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq*'*
        *or* die *"*Cannot read the maximum CPU frequency.*"*;
    *my* $curLimit = *<LIMITFILE>*;
    close LIMITFILE;
    $curLimit =~ *s!*\s+$*!!*;

    /# Find out which frequency number it is./
    *my* %freqHash;
    *my* $entNum;
    $freqHash{$_} = $entNum++ *foreach* (@freqList);

    *return* $freqHash{$curLimit};
}

exit main();
