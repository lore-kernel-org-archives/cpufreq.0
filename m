From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: [PATCH 2.6] powernow-k7 acpi support.
Date: Tue, 10 Feb 2004 21:05:26 +0100
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040210200526.GI13262@poupinou.org>
References: <20040209175000.GE13262@poupinou.org>
	<20040209180553.GA30914@dominikbrodowski.de>
	<20040209182957.GF13262@poupinou.org>
	<20040209132659.GY13262@poupinou.org>
	<20040209150519.GA6531@dominikbrodowski.de>
	<20040209175000.GE13262@poupinou.org>
	<20040209180553.GA30914@dominikbrodowski.de>
	<20040209185831.GG13262@poupinou.org>
	<20040210090320.GC10662@dominikbrodowski.de>
	<20040210180812.GA12634@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040210180812.GA12634@redhat.com>
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
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@www.linux.org.uk

On Tue, Feb 10, 2004 at 06:08:12PM +0000, Dave Jones wrote:
> On Tue, Feb 10, 2004 at 10:03:20AM +0100, Dominik Brodowski wrote:
>  > On Mon, Feb 09, 2004 at 07:58:31PM +0100, Bruno Ducrot wrote:
>  > > Ok, you win.  That one is ok ?
>  > 
>  > Looks good as well. All we have to decide is where to call these functions,
>  > though... and Davej has to decide whether he likes it, too :-)
> 
> Looks good to me, though I'm missing the part where you wire this up
> to the rest of the code. I see two possibilities.

Well, that need to be decided at first.  I'm acually testing it by
calling that function in powernow_decode_bios() with something like
that:


--- linux-2.6.3-bk-acpi/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/02/10 20:04:05	1.2
+++ linux-2.6.3-bk-acpi/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004/02/10 20:05:12
@@ -426,6 +426,9 @@
 	unsigned int etuple;
 	unsigned int ret;
 
+	if (powernow_acpi_init() == 0)
+		return 0;
+
 	etuple = cpuid_eax(0x80000001);
 	etuple &= 0xf00;
 	etuple |= (c->x86_model<<4)|(c->x86_mask);


but I guess this is not what people want probably, especially if there
are good PST's.

> - fallback to acpi when we detect bad PST's.

That sound good.

> - module parameter to force usage of acpi (override PST)

Yes, or check if the laptop is blacklisted.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
