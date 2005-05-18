From: Aaron Spettl <aaron@spettl.de>
Subject: Re: Centrino: undervolting and further reducing heat
Date: Wed, 18 May 2005 15:57:26 +0200
Message-ID: <428B49C6.90505@spettl.de>
References: <d6f982$h87$1@sea.gmane.org> <428B38F2.5080907@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <428B38F2.5080907@gmail.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
content-type: text/plain
To: cpufreq@lists.linux.org.uk

Hi

I've got a banias 1.6 GHz processor and like Daniel I've reduced the
voltages. My multiplicators and voltages:
  6x @ 0.780V (default: 0.988V)
10x @ 0.956V
12x @ 1.004V
14x @ 1.116V
16x @ 1.244V (default: 1.484V)
So far I've found nobody who needs higher settings on a banias cpu (I'm
admin on a german notebook forum and have seen many values).

Dothan cpus need less power, in my experience (very) safe values are:
  6x @ 0.732V
10x @ 0.860V
12x @ 0.988V
14x @ 1.052V
16x @ 1.212V
17x (?)
18x (?)
As you can see with Daniels cpu (6x @ 0.700V, 16x @ 0.972) these
voltages should be no problem for anyone, so I suppose it would be safe
to set the default values to these.
I think my banias values should be increased by one step (0.016V) to be
sure.

Idea:
Is it possible to set a kernel option like "reduce cpu voltage", maybe
even an "aggressive" option? We could leave the original tables for
default and activate the lower voltages only if this option is set. A
kernel boot parameter could override this option for one session, so
people could test it easily.

Regards
Aaron


Nebojsa Trpkovic wrote:

>I use undervolted AMD64 on two gentoo boxes for months:
>
>1. socket 754 nforce3-250gb, athlon64 3000+ (Newcastle core) overclocked
>to 2.4GHz and undervolted to run @1.45V
>
>2. socket 939 nforce4 ultra,  athlon64 3000+ (Winchester core)
>undervolted to run @1V at 1GHz and @1.275V at 1.8GHz (stable voltages
>suficient to run prime95 for hours were 0.9V at 1GHz and 1.175V at
>1.8GHz but I like to be 110% safe so I've left extra 0.1V just in case)
>
>Ofcorse, I had to manualy modify powernow-k8.c
>
>;)
>
>
>
>
>Daniel Bonniot wrote:
>
> =20
>
>>Hi,
>>
>>I have a dothan 1.6 GHz processor, and i've been investigating how to
>>reduce heat to minimize fan usage. One very promising avenue is
>>undervolting. According to several online articles, there is a large
>>potential for undervolting. I ended up modifying speedstep-centrino.c
>>to test it out. Results are very positive: it can run under heavy load
>>at 1.6Ghz with only 972mV (down from 1340mV). This decreased
>>temperature by 10=B0C! At 600MHz, the minimum 700mV was sufficient.
>>
>>I understand that the driver needs to be conservative by default, but
>>given the huge benefits, it would make a lot of sense to offer a way
>>to specify lower voltages to those who want to. Has anybody
>>investigated this possibility, or already started working on it? What
>>would be a good interface to specify the voltages?
>>
>>
>>Independently of this feature, I wonder how it's possible to further
>>reduce consumption when the system is mostly ideal, and even 600MHz is
>>more than needed. The idea being to let the system cool down even more
>>in that case. Is there any existing way to achive this on linux? One
>>possibility I found in the intel docs is the IA32_THERM_CONTROL MSR,
>>which can reduce clock speed by 12.5% to 87.5%. Am I right in thinking
>>that it could be combined with speedstep to achieve even lower power
>>consumption states? Are there other possibilities?
>>
>>Cheers,
>>
>>Daniel
>>
>>
>>_______________________________________________
>>Cpufreq mailing list
>>Cpufreq@lists.linux.org.uk
>>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>>
>>   =20
>>
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
> =20
>
