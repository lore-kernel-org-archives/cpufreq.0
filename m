From: Lars Gemeinhardt <lars.gemeinhardt@searchbroker.de>
Subject: Re: Question - Duron and Freq Scaling
Date: Wed, 27 Aug 2003 13:43:24 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <3F4C995C.9030902@searchbroker.de>
References: <A3C83F41488BD61195C3000802252FC105597E91@dubim07742.ie.ml.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces@www.linux.org.uk>
In-Reply-To: <A3C83F41488BD61195C3000802252FC105597E91@dubim07742.ie.ml.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Breathnach, Proinnsias (Dublin)" <p_breathnach@ml.com>
Cc: cpufreq@www.linux.org.uk

Breathnach, Proinnsias (Dublin) wrote:

>Hi,
>
Hello,

>	Quick question if I may, I have a Sony Vaio (FX 401) laptop ... AMD
>Duron 800
>
>ACPI shows 16 frequency throttling states ... 
>
>[francis@vaio CPU0]$ pwd
>/proc/acpi/processor/CPU0
>[francis@vaio CPU0]$ cat throttling
>state count:             16
>active state:            T0
>states:
>   *T0:                  00%
>    T1:                  06%
>    T2:                  12%
>    T3:                  18%
>    T4:                  24%
>    T5:                  31%
>    T6:                  37%
>    T7:                  43%
>    T8:                  49%
>    T9:                  55%
>    T10:                  62%
>    T11:                  68%
>    T12:                  74%
>    T13:                  80%
>    T14:                  86%
>    T15:                  93%
>
>Yet CPUFreq only notes 5 states ... is there any reason I couldn't use the
>remaining 11 states (Yes  ... .I know that running @ 52MHz or so would be
>painful ...but hey !)
>
This is an old question - and you get also the old answer: throttling is 
not the same as cpufreq (with uses the powernow functions from your cpu) 
- a quick example:

you have a 800 mhz cpu and throttle to 25% then your cpu work 1/4 of the 
time (with full power) and stops 3/4 of the time like this:
RSSSRSSSRSSS... (R=run, S=stop)
if you use cpufreq and the lowest state, then the cpu runs with 500 mhz 
(inst. of 800) and with only 1.2V (inst. of 1.5) and this saves much 
more power then the throttle steps ...

>
>powernow: AMD K7 CPU detected.
>powernow: PowerNOW! Technology present. Can scale: frequency and voltage.
>powernow: Found PSB header at c00f74d0
>powernow: Table version: 0x12
>powernow: Flags: 0x0 (Mobile voltage regulator)
>powernow: Settling Time: 100 microseconds.
>powernow: Has 28 PST tables. (Only dumping ones relevant to this CPU).
>powernow: PST:11 (@c00f759e)
>powernow:  cpuid: 0x770^Ifsb: 100^ImaxFID: 0xa^Istartvid: 0xa
>powernow:    FID: 0x4 (5.0x [500MHz])^IVID: 0x13 (1.200V)
>powernow:    FID: 0x5 (5.5x [550MHz])^IVID: 0xe (1.300V)
>powernow:    FID: 0x6 (6.0x [600MHz])^IVID: 0xd (1.350V)
>powernow:    FID: 0x8 (7.0x [700MHz])^IVID: 0xb (1.450V)
>powernow:    FID: 0xa (8.0x [800MHz])^IVID: 0xa (1.500V)
>powernow: Minimum speed 500 MHz. Maximum speed 800 MHz.
>
>kernel is 2.4.22 vanilla + cpufreq patch from codemonkey.org.uk (2.4.22-preX
>IIRC)
>
>P
>(This was supposed to be quick !)
>  
>
Ciao Lars

>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@www.linux.org.uk
>http://www.linux.org.uk/mailman/listinfo/cpufreq
>
>  
>
