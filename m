From: joe <joe@xenotropic.net>
Subject: Re: strange time drift if freq<=50%
Date: Sat, 28 Jun 2003 23:49:32 -0400
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <3EFE61CC.3010307@xenotropic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk
Cc: linux@brodo.de

I can confirm another case of what Dominik reports here; I don't see any 
other cases in the archive.  I have a Fujitsu Lifebook 2010 with an AMD 
Athlon-M 1700+, running 2.5.72; if I set the clock to the minimum (via 
either

echo -n "0:63:100:powersave" > /proc/cpufreq

or

echo "powersave" > /system/devices/system/cpu/cpu0/cpufreq/scaling_governor

then I get "repeats" when I hit keys on my keyboard, my fan cranks up to 
high speed, and it seems like the system clock is running fast.

At 63% it seems to work properly.

joe


Dominik Brodowski wrote (on 4 Jun 2003):

On my p4 desktop I see a strange "time drift" if I set the frequency to 
50% or below using the p4-clockmod driver.=20

Five runs of "time make" of a previously compiled kernel returned in 
average the following times:

freq:		100%	75%	62.5%	50%
time (avg.):	5.9s	7.8s	9.2s	22.5s=09

However, on my wall clock "time make" took only 11s on frequency=3D=3D50%. =
If I reduce the frequency even further, pressing any key on the keyboard 
results in many "repeats" appearing on the screen; and the system time 
running much too fast. If it's >=3D 62.5%, there's no problem at all.

The small patch at the bottom disables all frequency states <62.5% for 
the p4-clockmod driver until the real cause of this problem can be 
found. What I'd be interested in is the following, though: does the same 
bug appear on other cpufreq drivers and architectures? If so, this 
workaround should be abstracted and moved to a proper place (e.g. 
kernel/cpufreq.c or drivers/cpufreq/freq_table.c)

	Dominik
