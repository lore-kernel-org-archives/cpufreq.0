From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: VIA C3 'Ezra-T' [C5M] - longhaul - do nothing
Date: Wed, 29 Aug 2007 21:16:29 +0200
Message-ID: <46D5C60D.8080809@interia.pl>
References: <9f90e8bf0708280759x6068ae15j9f24e654307a3037@mail.gmail.com>	
	<46D4433A.7000509@interia.pl>	
	<9f90e8bf0708281101q19afb3ableb3589b7c363759c@mail.gmail.com>	
	<46D46CC2.6080405@interia.pl>	
	<9f90e8bf0708281314v28f29cb3o8e68a3b77701e656@mail.gmail.com>	
	<46D5000D.7010503@interia.pl>	
	<9f90e8bf0708290624m592290a0v6ae9d76b7d4d19a0@mail.gmail.com>	
	<46D5AE8F.2080209@interia.pl>
	<9f90e8bf0708291135v289c3244xef7a2ac0187c32ea@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <9f90e8bf0708291135v289c3244xef7a2ac0187c32ea@mail.gmail.com>
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
To: "Herbert G. Fischer" <herbert.fischer@gmail.com>
Cc: cpufreq@lists.linux.org.uk

> With scale_voltage=1:
> 
> longhaul: VIA C3 'Ezra-T' [C5M] CPU detected.  Powersaver supported.
> longhaul: Using northbridge support.
> longhaul: MinMult:3.0x MaxMult:7.5x
> longhaul: FSB:133MHz  Lowest speed: 399MHz   Highest speed:399MHz
> longhaul: VRM 8.5
> longhaul: Claims to support voltage scaling but min & max are both 
> 1.250. Voltage scaling disabled
OK. Your processor has RevisionID equal to 1, but it isn't supporting 
voltage scaling.
> [...]
> 
> I also benchmarked with nbench and the changes did not changed processor 
> performance.
> 
> Thanks
Can You check if changing following lines in "do_powersaver" in longhaul.c 
makes any diference?
        /* Setup new frequency */
        longhaul.bits.RevisionKey = longhaul.bits.RevisionID;
Change it to:
        /* Setup new frequency */
        longhaul.bits.RevisionKey = 0;

----------------------------------------------------------------------
Piekne kobiety wsrod samych swin!
Obejrzyj

>>>http://link.interia.pl/f1b18
