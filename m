From: Bas Mevissen <ml@basmevissen.nl>
Subject: Re: add new p3m model
Date: Mon, 08 Mar 2004 12:47:48 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <404C5D64.5040508@basmevissen.nl>
References: <20040308111531.GD14593@devserv.devel.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040308111531.GD14593@devserv.devel.redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Arjan van de Ven <arjanv@redhat.com>, cpufreq mailing list <cpufreq@www.linux.org.uk>

Arjan van de Ven wrote:
> Hi,
> 
> the patch below adds support for my laptop (Dell Inspiron 2600) which has
> ebx return 7 for the p3 mobile in it....
> 
> Greetings,
>     Arjan van de Ven
> 
> 
> --- linux-2.6.3/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c~	2004-03-07 15:31:51.305251000 +0100
> +++ linux-2.6.3/arch/i386/kernel/cpu/cpufreq/speedstep-lib.c	2004-03-07 15:31:51.305251000 +0100
> @@ -265,10 +265,10 @@
>  	case 0x0B: /* Intel PIII [Tualatin] */
>  		/* cpuid_ebx(1) is 0x04 for desktop PIII,
> -		                   0x06 for mobile PIII-M */
> +		                   0x06 and 0x07 for mobile PIII-M */

It is only text, but shouldn't that read "0x06 or 0x07"? It is one of 
the two and not both values at the same time.

BTW. Is this 0x07 also according specs or just what happens on the i2k6?

Bas.
