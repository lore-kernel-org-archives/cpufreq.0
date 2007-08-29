From: =?ISO-8859-2?Q?Rafa=B3_Bilski?= <rafalbilski@interia.pl>
Subject: Re: VIA C3 'Ezra-T' [C5M] - longhaul - do nothing
Date: Wed, 29 Aug 2007 22:21:17 +0200
Message-ID: <46D5D53D.8030902@interia.pl>
References: <9f90e8bf0708280759x6068ae15j9f24e654307a3037@mail.gmail.com>	
	<46D4433A.7000509@interia.pl>	
	<9f90e8bf0708281101q19afb3ableb3589b7c363759c@mail.gmail.com>	
	<46D46CC2.6080405@interia.pl>	
	<9f90e8bf0708281314v28f29cb3o8e68a3b77701e656@mail.gmail.com>	
	<46D5000D.7010503@interia.pl>	
	<9f90e8bf0708290624m592290a0v6ae9d76b7d4d19a0@mail.gmail.com>	
	<46D5AE8F.2080209@interia.pl>	
	<9f90e8bf0708291135v289c3244xef7a2ac0187c32ea@mail.gmail.com>	
	<46D5C60D.8080809@interia.pl>
	<9f90e8bf0708291240v4b816e9bvf29a103cf446b26e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <9f90e8bf0708291240v4b816e9bvf29a103cf446b26e@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Herbert G. Fischer" <herbert.fischer@gmail.com>
Cc: cpufreq@lists.linux.org.uk

> [...]
> longhaul: Using northbridge support.
Can You uncomment ACPI C3 support and check if it is working too?
Restore these lines to original state below:
    /* Check ACPI support for C3 state */
    if (pr != NULL && longhaul_version == TYPE_POWERSAVER) {
        cx = &pr->power.states[ACPI_STATE_C3];
        if (cx->address > 0 && cx->latency <= 1000)
            longhaul_flags |= USE_ACPI_C3;
    } 

> After changing governor to powersave:
> [...]
> longhaul: Setting to FSB:133MHz Mult:3.0x (399MHz)
> cpufreq-core: notification 1 of frequency transition to 399000 kHz
> cpufreq-core: scaling loops_per_jiffy to 1601526for frequency 399000 kHz
> userspace: saving cpu_cur_freq of cpu 0 to be 399000 kHz
> cpufreq-core: governor: change or update limits
> cpufreq-core: __cpufreq_governor for CPU 0, event 3
> powersave: setting to 399000 kHz because of event 3
> cpufreq-core: target for CPU 0: 399000 kHz, relation 0
> freq-table: request for target 399000 kHz (relation: 0) for cpu 0
> freq-table: target is 0 (399000 kHz, 1)
Yes. It is working. Longhaul ver. 2 wasn't working probably because of the 
same reason. Now I have to think how to deal with this situation. I have 
Nehemiah with RevID = 0. Good. I have Ezra with RevID = 1 and voltage 
scaling. Bad. I have to check if it is working with RevID = 0. Probably 
not because VIA documentation advise to poke RevKey with RevID. But 
I will read it again to refresh my memory.
> Clocksource tsc unstable (delta = -208657423 ns)
> 
> [...]
> 
> The "Clocksource tsc unstable (delta = -208657423 ns)" is something to 
> worry about?
No. It isn't used anyway because of "Marking TSC unstable due to: possible 
TSC halt in C2."

Do You agree to test patch(es) that I will write (probably) tommorow?

Thanks


----------------------------------------------------------------------
Sprawdz co sie dzieje w Twojej okolicy!
Kliknij >>> http://link.interia.pl/f1b7e
