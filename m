From: Borislav Petkov <bp@amd64.org>
Subject: Re: [PATCH 1/5] acpi-cpufreq: Add support for modern AMD CPUs
Date: Tue, 17 May 2011 20:13:53 +0200
Message-ID: <20110517181353.GC26422@gere.osrc.amd.com>
References: <1305651819-25660-1-git-send-email-mjg@redhat.com>
 <20110517173536.GI30053@aftab>
 <20110517174233.GA25111@srcf.ucam.org>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110517174233.GA25111@srcf.ucam.org>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Garrett <mjg@redhat.com>
Cc: Borislav Petkov <bp@amd64.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "davej@redhat.com" <davej@redhat.com>, "Langsdorf, Mark" <mark.langsdorf@amd.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, Andreas Herrmann <andreas.herrmann3@amd.com>

+ Andreas.

On Tue, May 17, 2011 at 06:42:33PM +0100, Matthew Garrett wrote:
> > Ok, I'm a bit confused here but maybe because I don't know the whole
> > cpufreq subsystem that well. Is the purpose here to add hw pstates
> > support to acpi-cpufreq so that it is used on AMD but leave the old
> > Fid/Vid method to powernow-k8, thus phasing it out...?
> 
> Yes. The last patch in the set removes the hw pstate code from 
> powernow-k8.

Ok, good. The diffstat of 5/5 talks for itself but let's see what the
others have to say first. Obviously, these changes need to be tested
very thoroughly on a bunch of machines before we go forth with them.

> > >  #define MSR_IA32_PERF_STATUS		0x00000198
> > >  #define MSR_IA32_PERF_CTL		0x00000199
> > > +#define MSR_AMD_PERF_STATUS		0xc0010063
> > > +#define MSR_AMD_PERF_CTL		0xc0010062
> > 
> > Yeah, there are defines for those in
> > <arch/x86/kernel/cpu/cpufreq/powernow-k8.h>:
> > 
> > #define MSR_PSTATE_STATUS       0xc0010063 /* Pstate Status MSR */
> > #define MSR_PSTATE_CTRL         0xc0010062 /* Pstate control MSR */
> > 
> > can you remove them from there for consistency so that we can use only
> > the msr-index.h definitions.
> 
> That happens in the final patch.

Maybe I should read the whole patchset first :).

> 
> > > +static int check_powernow_cpu(unsigned int cpuid)
> > > +{
> > > +	struct cpuinfo_x86 *cpu = &cpu_data(cpuid);
> > > +
> > > +	return cpu_has(cpu, X86_FEATURE_POWERNOW);
> > > +}
> > 
> > This could be static_cpu_has() since all the CPUs, including the boot
> > CPU, will have the HwPstate thing set. Thus, you can ignore the "cpuid"
> > parameter.
> 
> Ok, this was just for symmetry with the est version.

Right, but I don't think that would be different on Intel and
static_cpu_has is faster with the alternatives mechanism anyway.

Thanks.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Gemeinde Aschheim, Landkreis Muenchen
Registergericht Muenchen, HRB Nr. 43632
