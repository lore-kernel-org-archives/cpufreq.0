From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [PATCH] 1/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 19:55:45 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031021175545.GK13989@poupinou.org>
References: <88056F38E9E48644A0F562A38C64FB6007791A@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6007791A@scsmsx403.sc.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>, linux-acpi <linux-acpi@intel.com>, "Mallick,
	Asit K" <asit.k.mallick@intel.com>, linux-kernel@vger.kernel.org, Dominik Brodowski <linux@brodo.de>

On Tue, Oct 21, 2003 at 10:15:31AM -0700, Pallipadi, Venkatesh wrote:
> 
> > -----Original Message-----
> > From: Ducrot Bruno [mailto:ducrot@poupinou.org] 


...

> > Your do not handle correctly 
> > other processors
> > than Intel.  
> 
> I am sorry. I do not understand this comment. 
> - Major part of Patch 1 is adding SMP awareness, which has
> nothing specific to Intel at all.
> - A part of patch 1 adds MSR based transition capability. 
> This is based on ACPI spec.

Could you tell me where you find in ACPI spec. that FfixedHW means 
always MSR?  That not true for C-states definitions via _CST for
example (the first entry being always an FFixedHW, because it
is C1 and will be the single asm instruction: 'hlt').
Look 2.0b page 228.

> It will work any processor 
> that is ACPI compatible and again there are no specific 
> checks for Intel here.
> 

On a K7 with powernow for example, perf_ctrl and perf_data will be MSR 0
with your patch, that do not make sence.
Even if you know the correct MSRs, the values for 'control' and 'status'
in _PSS packages will be only bit-fields, and they can *not* be
written nor read directly to the (correct) MSRs (again for K7 powernow).

This is because the FfixedHW is only an indication that a CPU specific
'feature' (even though already somehow defined in ACPI like P-state,
C-state, etc.) have to be handled by the OS in a non-acpi driver, as
per ACPI spec, and that will be dependant of the CPU.


-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
