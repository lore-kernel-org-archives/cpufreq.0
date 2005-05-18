From: Nebojsa Trpkovic <trxman@gmail.com>
Subject: Re: Centrino: undervolting and further reducing heat
Date: Wed, 18 May 2005 14:45:38 +0200
Message-ID: <428B38F2.5080907@gmail.com>
References: <d6f982$h87$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <d6f982$h87$1@sea.gmane.org>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
content-type: text/plain
To: cpufreq@lists.linux.org.uk

I use undervolted AMD64 on two gentoo boxes for months:

1. socket 754 nforce3-250gb, athlon64 3000+ (Newcastle core) overclocked
to 2.4GHz and undervolted to run @1.45V

2. socket 939 nforce4 ultra,  athlon64 3000+ (Winchester core)
undervolted to run @1V at 1GHz and @1.275V at 1.8GHz (stable voltages
suficient to run prime95 for hours were 0.9V at 1GHz and 1.175V at
1.8GHz but I like to be 110% safe so I've left extra 0.1V just in case)

Ofcorse, I had to manualy modify powernow-k8.c

;)




Daniel Bonniot wrote:

>
> Hi,
>
> I have a dothan 1.6 GHz processor, and i've been investigating how to
> reduce heat to minimize fan usage. One very promising avenue is
> undervolting. According to several online articles, there is a large
> potential for undervolting. I ended up modifying speedstep-centrino.c
> to test it out. Results are very positive: it can run under heavy load
> at 1.6Ghz with only 972mV (down from 1340mV). This decreased
> temperature by 10���C! At 600MHz, the minimum 700mV was sufficient.
>
> I understand that the driver needs to be conservative by default, but
> given the huge benefits, it would make a lot of sense to offer a way
> to specify lower voltages to those who want to. Has anybody
> investigated this possibility, or already started working on it? What
> would be a good interface to specify the voltages?
>
>
> Independently of this feature, I wonder how it's possible to further
> reduce consumption when the system is mostly ideal, and even 600MHz is
> more than needed. The idea being to let the system cool down even more
> in that case. Is there any existing way to achive this on linux? One
> possibility I found in the intel docs is the IA32_THERM_CONTROL MSR,
> which can reduce clock speed by 12.5% to 87.5%. Am I right in thinking
> that it could be combined with speedstep to achieve even lower power
> consumption states? Are there other possibilities?
>
> Cheers,
>
> Daniel
>
>
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@lists.linux.org.uk
> http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
