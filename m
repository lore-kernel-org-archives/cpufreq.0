From: "Lincoln Smith" <dagdamor@optushome.com.au>
Subject: Geode GXm driver not handling frequency change properly?
Date: Sun, 4 Jul 2004 14:48:22 +1000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <000701c46182$22d93700$0801a8c0@nalfeshnee>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: CPUFreq List <cpufreq@www.linux.org.uk>

I have a Geode GX1 233 in a little SBC machine operating as a wireless
router.  I was experimenting with the cpufreq driver and things just didn't
seem to work properly.  The frequency checks in 2.6.7 seem to have
illuminated the problem.  The interpretation of the target frequency seems
to be inverted.  The frequency written to scaling_setspeed is interpreted as
the length of time to turn the processor "off" for.  The realized frequency
is cpu_maxfreq - scaling_setspeed.

Some dmesg output to illustrate.

cpufreq:suspend modulation w/ duration of ON:1888 us, OFF:4800 us
cpufreq:suspend modulation w/ clock speed: 167848 kHz.
Warning: CPU frequency out of sync: cpufreq and timing core thinks of
167848, is 66020 kHz.

cpufreq:suspend modulation w/ duration of ON:1120 us, OFF:864 us
cpufreq:suspend modulation w/ clock speed: 101846 kHz.
Warning: CPU frequency out of sync: cpufreq and timing core thinks of
101846, is 132022 kHz.

cpufreq:suspend modulation w/ duration of ON:3712 us, OFF:672 us
cpufreq:suspend modulation w/ clock speed: 35848 kHz.
Losing some ticks... checking if CPU frequency changed.
Warning: CPU frequency out of sync: cpufreq and timing core thinks of 35848,
is 198020 kHz.

In each case the actual frequency is the maximum frequency (about 233 MHz)
minus the requested frequency.

The solution is likely trivial? I will look at it but someone else will
probably be faster than me.

Cheers
Lincoln Smith
