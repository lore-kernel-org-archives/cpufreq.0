From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: Pentium III (Coppermine) cpufreq support
Date: Thu, 29 Jan 2004 12:35:41 +0100
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <20040129113541.GY25416@poupinou.org>
References: <20040129092604.GB5591@dominikbrodowski.de>
	<20040129085037.77B733FFB@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040129085037.77B733FFB@latitude.mynet.no-ip.org>
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
To: aeriksson2@fastmail.fm
Cc: cpufreq@www.linux.org.uk

On Thu, Jan 29, 2004 at 09:50:36AM +0100, aeriksson2@fastmail.fm wrote:
> 
> Hi all,
> 
> Another PIII(Speedstep)/440BZ owner chiming in...
> 
> I've been successful in getting the -smi driver to work (I believe).
> However, I need to apply this patch:
> 
> --- ../../cf-2.6/cpufreq/linux/arch/i386/kernel/cpufreq/speedstep-lib.c 2003-08-19 15:38:33.000000000 +0200
> +++ arch/i386/kernel/cpu/cpufreq/speedstep-lib.c        2003-11-10 21:41:12.325084272 +0100
> @@ -200,7 +200,7 @@
>                  */
>                 rdmsr(MSR_IA32_PLATFORM_ID, msr_lo, msr_hi);
>                 dprintk(KERN_DEBUG "cpufreq: Coppermine: MSR_IA32_PLATFORM ID is 0x%x, 0x%x\n", msr_lo, msr_hi);
> -               if ((msr_hi & (1<<18)) && (msr_hi & (3<<24))) {
> +               if ((msr_hi & (1<<18)) ) {
>                         if (c->x86_mask == 0x01)
>                                 return SPEEDSTEP_PROCESSOR_PIII_C_EARLY;
>                         else
> 
> Now reading the comment just before these lines, it's
> apparent that this is not the way things are supposed to work.

Well, that the only 'official' info we got from Intel in
order to detect a speedstep capable processor in earlier
PIII coppermine...  But they seems to be wrong (and actually
some system do have an early speedstep-capable PIII coppermine
that do not pass this check).

> I've asked for this patch to be considered by the maintainers
> and the decision was not to apply it. I'd be interested in
> other approaches to getting past these lines in the cpu 
> detection code which works can be committed. 
> 
> You may want to check this path yourself. But I wouldn't be 
> surprised if doing the Wrong Thing here could fry your box.
> Question:
> Is there any chance that tricking the code into accepting 
> the cpu as speedstep-capable, would made the code appear to
> work when observing the behavior from outside but actually
> do no good to the metal? I don't have the hardware here to 
> check if the box actually does consume less power when in
> low performance mode.

If you allow a non-speedstep capable processor, and if
you use the speedstep-ich driver, this will likely
freeze the system no matter what.

Cheers,

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
