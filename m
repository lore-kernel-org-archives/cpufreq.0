From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] Fix cpu recognization if BIOS does not set cpu to max
	freq [was: Re: [Bug 3600] New: Cpu recognization fails after
	upgrade from 2.6.7 to 2.6.9]
Date: Fri, 29 Oct 2004 17:35:44 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041029153544.GA9799@dominikbrodowski.de>
References: <200410201413.i9KED718023481@fire-1.osdl.org>
	<20041020154744.GA5372@dreamland.darkstar.lan>
	<20041020180537.17d0dd7c@paraclito.crema>
	<20041020165110.GA6992@dreamland.darkstar.lan>
	<20041021102529.GD22405@poupinou.org>
	<20041023214325.GA13050@dreamland.darkstar.lan>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041023214325.GA13050@dreamland.darkstar.lan>
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
To: Kronos <kronos@kronoz.cjb.net>
Cc: Dave Jones <davej@redhat.com>, Bruno Ducrot <ducrot@poupinou.org>, cpufreq@www.linux.org.uk

On Sat, Oct 23, 2004 at 11:43:25PM +0200, Kronos wrote:
> On some notebooks BIOS fails to set K7 CPUs to the maximum frequency.
> powernow-k7 fails to load or falls back to ACPI (if available) with
> wrong values. If a bogus FSB speed is detected a workaround should be
> used.
> 
> Signed-off-by: Luca Tettamanti <kronos@kronoz.cjb.net>
> 
> --- a/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-23 22:29:40.000000000 +0200
> +++ b/arch/i386/kernel/cpu/cpufreq/powernow-k7.c	2004-10-23 22:39:23.000000000 +0200
> @@ -598,6 +598,13 @@
>  
>  	/* A K7 with powernow technology is set to max frequency by BIOS */
>  	fsb = (10 * cpu_khz) / fid_codes[fidvidstatus.bits.MFID];
> +	if (fsb < 99000) {
> +		/* BIOS did not set the processor to the max frequency.
> +		 * This does not respect AMD recomandation, but it happens.
> +		 */

So if the motherboard allows for modifying the FSB, and I decide to set the
FSB to 98 MHz, it breaks... What about the following approaches?

- yet another DMI table?

- there's an entry "fsbspeed" in pst_s. Is this useful to determining the
  FSB, and then checking whether FSB*CFID makes more sense than FSB*MFID
  when comparing it to cpu_khz?


	Dominik
