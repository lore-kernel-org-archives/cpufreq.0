From: Michael Frank <mflt1@micrologica.com.hk>
Subject: Re: Cpufreq: powernow-k7 weirdness
Date: Mon, 7 Jul 2003 12:16:10 +0800
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <200307071129.46683.mflt1@micrologica.com.hk>
References: <tpisqgv58s.fsf@lanthane.pps.jussieu.fr> <20030706184801.GY7796@poupinou.org> <200307062356.01561.lbelli@crema.unimi.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-admin@www.linux.org.uk>
In-Reply-To: <200307062356.01561.lbelli@crema.unimi.it>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
To: Luigi Belli <lbelli@crema.unimi.it>, cpufreq@www.linux.org.uk

On Monday 07 July 2003 05:56, Luigi Belli wrote:
> On Sunday 06 July 2003 08:48 pm, Ducrot Bruno wrote:
> > Things should be a little bit more smooth, but there is still deadlock
> > when for example you switch from max freq. to min.
>
> Never had problems switching max to min (and I do it every time I boot the

You CPU can't scream oooouch...

> system), min to max instead often freezes everything (and I'm undervolted,
> so virtually less stable).
>
>

Some of the problems refereed to in this thread are likely hardware related,
may occur with all CPU's where voltage/frequency is scaled and are more 
pronounced with high-power CPUs such as PIII, Duron and up.

On power supplies
-----------------
Computer power supplies generally use buck type regulators where a choke
is in series with the output and is somewhat slow in regulation.
Further, modern mainboards core-voltage (also buck) regulator is electrically 
in series with the (mostly 12V)  output of the main PSU. When powersupplies 
are heavily loaded with several disks and an "oversize/upgraded"  main board,
regulation becomes marginal.

Inner resistance increases and regulation deteriorates with age as capacitors 
"dry out" and loose a substantial part of their capacity. 

The 10$ 300W PSU is a poor joke. Using a quality and even oversize powersupply 
is better for regulation, brownout protection and system stability. Saving a 
few bucks here is not worthwhile ;). BTW, a decent 300W PSU is much heavier than
the 10$ version.

On notebooks, when batteries a low/older, inner resistance is higher leading 
to similar problems with "Bigger CPUs" such as reset prior to low-charge 
shutdown.

On scaling CPU frequency/core voltage
-------------------------------------
Be warned: Semiconductors exhibit a disproportional (exponential to
avalanche) relationship between voltage and stress/~reliability. 

When switching  max to min, voltages will _overshoot_, possibly crashing and 
in extreme cases even damaging/destroying the CPU as the CPU core voltage is  
already high (close to the limit) at that time. Voltage overshoot is also 
bad for other parts of the system and unfortunately does not trigger any 
warning. I am not aware of crowbar protected Vcore on mainboards.

When switching min to max, voltages will _collapse_ very likely leading to 
a crash, and possibly even triggering the undervoltage circuit in the 
main power supply leading to a reset.

Switching speeds should be done incrementally, with a few (2-10) ms
between steps. Taking longer won't do any harm. 

The actual minimum time between steps depends on systems design and can 
only be established by watching the (core) voltage on an oscilloscope 
while modulating cpufreq/ACPI settings. The time used should be double 
or triple the minimum for longterm stability. It would be better if 
Mainboard manufacturers would specify this minimum time.

Would one want to make the interstep time userspace selectable from 1 - 50 ms?

Regards
Michael

-- 
Powered by linux-2.5.74-mm1. Compiled with gcc-2.95-3 - mature and rock solid

My current linux related activities:
- 2.5 yenta_socket testing
- Test development and testing of swsusp and ACPI S3
- Everyday usage of 2.5 kernel

More info on 2.5 kernel: http://www.codemonkey.org.uk/post-halloween-2.5.txt
