From: "Michael Christie" <public@mc8.co.uk>
Subject: "CPU frequency out of sync" error
Date: Sun, 2 Jan 2005 13:38:42 -0000
Message-ID: <008c01c4f0d0$6020c280$0207a8c0@mjcxp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: cpufreq@www.linux.org.uk

I'm trying to get cpu frequency scaling to work with a desktop system using 
a Mobile Athlon (XP2200+) but so far I'm not having much luck.  Incase it 
helps, the motherboard being used is a Soltek 75frv which has a KT400 
chipset.

The bios didn't have the relevant PST table for the cpu so I have patched 
powernow-k7 with a valid table (which I found on the internet.)  After 
patching this, if I try to execute powernowd I get numerous errors in the 
form of "Warning: CPU frequency is 1795, cpufreq assumed 1662 kHz" where the 
first number is always 1795 and the second number decreases as cpufreq tries 
to clock down through the frequency steps defined in my custom PST.  After 
going down 4 "steps" the error message then changes to "Warning: CPU 
frequency out of sync: cpufreq and timing core thinks of 798, is 1795 kHz."
The above happens when using ACPI or APM.

If I try to use cpufreqd instead of powernowd, no errors are thrown up but 
I'm not convinced it is working.  cat /proc/cpuinfo reports a frequency of 
532MHz (which is the lowest step I've defined.)  However, running x86info -a 
reports:
Voltage ID codes: Maximum=1.450V Startup=1.450V Currently=1.450V
Frequency ID codes: Maximum=13.5x Startup=6.0x Currently=13.5x
Therefore, there seems to be conflicting information on whether the 
processor has been downclocked or not.  (Note that although the startup 
multiplier is defined as 6.0x, it seems that as my bios is made by AMI, it 
actually writes the maximum multiplier (rather than the startup multiplier) 
to the FID MSR on boot up and thus the startup multiplier is really 13.5x.)
I should also mention that similar behaviour was shown with /proc/cpuinfo 
and x86info when I tried powernowd (ie. x86info showing constant multiplier 
of 13.5 which cpuinfo showed the expected, downclocked frequency.)

It looks like either the cpu frequency scaling isn't working or it is 
working but the new processor speed isn't being fully recognised (I suspect 
it is the former.)  Does anyone have any idea what could be the cause of 
this problem?

Thanks,

Michael Christie


---
This message has been certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.825 / Virus Database: 563 - Release Date: 30/12/2004 
