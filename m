From: Kronos <kronos@kronoz.cjb.net>
Subject: [2.6.9-rc2] ondemand governor not working
Date: Wed, 15 Sep 2004 18:32:54 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040915163254.GA6657@dreamland.darkstar.lan>
Reply-To: kronos@kronoz.cjb.net
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi,
I just tried 2.6.9-rc2 and found out that ondemand governor is not
working. Sampling rate is set to zero:

/sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
0
/sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate_max
0
/sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate_min
0

This is what I've found out: powernow-k7 sets transition_latency to a
very low value:

powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
powernow: FSB: 133.902 MHz
powernow: Found PSB header at c00f0320
powernow: Table version: 0x12
powernow: Flags: 0x0 (Mobile voltage regulator)
powernow: Settling Time: 100 microseconds.
powernow: Has 1 PST tables. (Only dumping ones relevant to this CPU).
powernow: PST:0 (@c00f0330)
powernow:  cpuid: 0x7a0  fsb: 133  maxFID: 0x16  startvid: 0xb
powernow:    FID: 0x12 (4.0x [535MHz])  VID: 0x13 (1.200V)
powernow:    FID: 0x6 (6.0x [803MHz])  VID: 0x13 (1.200V)
powernow:    FID: 0xa (8.0x [1071MHz])  VID: 0x13 (1.200V)
powernow:    FID: 0xe (10.0x [1339MHz])  VID: 0xe (1.300V)
powernow:    FID: 0x2 (12.0x [1606MHz])  VID: 0xc (1.400V)
powernow:    FID: 0x16 (14.0x [1874MHz])  VID: 0xb (1.450V)
powernow: SGTC: 13333
powernow: Minimum speed 535 MHz. Maximum speed 1874 MHz.

powernow-k7.c:637:

policy->cpuinfo.transition_latency = 20 * latency / fsb;

transition_latency = 20 * 13333 / 133902 = (int)1.99 = 1
        
Since transition_latency is expressed in ns it seems to me a bit low,
maybe it should be 1ms?

The ondemand governor then does this:

cpufreq_ondemand.c:350
def_sampling_rate = (policy->cpuinfo.transition_latency / 1000) *
                                        DEF_SAMPLING_RATE_LATENCY_MULTIPLIER;

transition_latency / 1000 is clearly zero.

Luca
-- 
Home: http://kronoz.cjb.net
"La Via prosegue senza fine."
	Bilbo Baggins - Il Signore degli Anelli - J.R.R. Tolkien
