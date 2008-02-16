From: Cesar Eduardo Barros <cesarb@cesarb.net>
Subject: S3C2410 and cpufreq
Date: Sat, 16 Feb 2008 10:01:30 -0200
Message-ID: <47B6D09A.1060606@cesarb.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk
Cc: openmoko-kernel@lists.openmoko.org

For some weeks I have been working on a cpufreq driver for the OpenMoko 
Neo1973 GTA01, which uses a S3C2410 SoC. It's far from complete (it will 
end up touching almost every device driver for the SoC), but the core 
code (which does the frequency switching) is mostly ready.[1]

Some characteristics of the S3C2410 are not well supported by the core 
cpufreq architecture, meaning it had to be bent a bit to fit. Harald 
Welte on openmoko-kernel suggested I ask for comments on this list (I've 
added a CC: to openmoko-kernel so they can follow the discussion).

- The S3C2410 and other chips derived from it have three main clocks, 
FCLK, HCLK, and PCLK. HCLK is obtained from FCLK via a divider, and PCLK 
is obtained from HCLK via another divider. It's FCLK which tracks the 
PLL output. All the devices on the chip use either HCLK or PCLK as their 
clock, except the CPU core, which uses FCLK (and on the S3C2442, used by 
the GTA02, the CPU core can use the HCLK instead of FCLK).[2]

This means almost all device drivers for the devices on the chip will 
need (or work better with) a cpufreq transition notifier. However, what 
they are interested in is not the CPU core frequency (which doesn't 
interest them at all), but one of the three main clocks.[3]

I solved this by embedding struct cpufreq_freqs inside another 
structure, which has the old and new values for all the relevant clocks. 
However, if the transition notifier is called from the cpufreq core 
without being asked to by the cpufreq driver (should never happen in 
practice, only in theory), the pointer passed to the notifiers is not 
embedded within the bigger structure, meaning I had to pass it out of 
band.[4]

- The cpufreq core allows the drivers to set a range of valid 
frequencies (policy->min and policy->max); however, the drivers often 
want to just exclude some frequencies from the middle of the range, and 
shrinking the range is too restrictive.

One of the reasons is that the relation between the CPU core frequency 
and the main clocks is not monotonic; for instance, we might have 
HCLK=FCLK/2 at higher frequencies, but then change to HCLK=FCLK at lower 
frequencies (where we can do so without getting above the maximum HCLK 
frequency). The drivers might not like a HCLK or PCLK below a minimum, 
but often what the cpufreq core is tracking is FCLK (or sometimes HCLK 
on the S3C2442).

Another reason is the serial driver. In some frequencies, none of the 
available divider values on the baud rate generator can generate a 
frequency within the tolerances for the desired baud rate, especially on 
the higher baud rates (like the 115200 used by the GTA01 modem). These 
frequencies are not only the lower ones, but also a few of the higher 
ones. The driver needs a way to exclude these frequencies, without 
halving the whole range.

The way I solved this is a bit of a hack. I use a separate frequency 
table to mark which frequencies are available or not.[5] At the 
beginning of the CPUFREQ_ADJUST phase[6], the table is cleared (in fact 
copied from a "clean" table). During the rest of the phase, the drivers 
call a special exported helper function, passing it a callback. The 
helper function generates the clock values for all the frequencies, and 
ask the callback whether they can be used. Based on the returned boolean 
value, the function can mark the frequency as invalid on the table, and 
if needed shrink the policy range. Despite being a bit verbose for the 
drivers (which need to declare and register a notifier block, and 
implement both the policy notifier and the callback), it pushes all the 
complexity to the cpufreq driver.

- There is more than one way to set a particular CPU core frequency, 
since the dividers for the other clocks can vary.

Following a suggestion on IRC, I implemented this by enhancing the 
policy adjust helper described above; it now also iterates through all 
the valid frequencies for that CPU core clock, asking the driver whether 
any of them is valid, and stopping at the first found. This is usually 
the slowest possible (higher divider values), except for a special 
performance hack: if this is the frequency which would be chosen by the 
"performance" governor, I only allow the fastest divider values.[7]

- Some drivers do not want a frequency switch in some situations.

One example would be the sound driver[8], where the transition latencies 
could cause dropped audio samples. Another example would be the USB 
gadget driver[8], since for some reason it stops working if in use 
during a frequency transition.

The way I planned to work around this is to have another exported helper 
function which sets a global boolean flag. At the end of the 
CPUFREQ_INCOMPATIBLE phase[9], if the flag is set, it sets policy->min 
to policy->max and clears the flag. This function is to be called by the 
relevant drivers on their policy notifiers during the CPUFREQ_ADJUST phase.


[1] The current revision of the code can be found at the 
s3c2410-cpufreq-om branch of 
http://repo.or.cz/w/linux-2.6/s3c2410-cpufreq.git; the revision of the 
code current as of this email message is the one sent to the 
openmoko-kernel mailing list, archived at 
http://lists.openmoko.org/pipermail/openmoko-kernel/2008-February/001021.html 
and its replies.
[2] I simplified a bit; there's another PLL which generates 48MHz for 
the USB, and a few devices can use it (mostly the USB cores).
[3] Or in some cases more than one of the three main clocks; the serial 
driver on the S3C2442 can use either PCLK or a divided FCLK.
[4] A global pointer to the struct on the stack is set before starting 
the transition and cleared after ending it; there's an exported function 
to get it. To the drivers, it's as if that function did a container_of 
on the passed pointer; they are unaware of the global pointer, other 
than the fact that they will receive NULL if it's not available.
[5] This table is later directly passed to cpufreq_frequency_table_target().
[6] Implemented via a policy notifier with a very high priority.
[7] This is actually done when clearing the table of valid divider 
values, at the beginning of the CPUFREQ_ADJUST phase. For the 
"performance" index, all the other divider values are pre-set to invalid.
[8] Not adapted for cpufreq yet.
[9] Implemented via a policy notifier with a very low (negative) priority.

-- 
Cesar Eduardo Barros
cesarb@cesarb.net
cesar.barros@gmail.com
