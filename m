From: Ducrot Bruno <ducrot@poupinou.org>
Subject: Re: [PATCH] 1/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Wed, 22 Oct 2003 11:17:47 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031022091747.GM13989@poupinou.org>
References: <88056F38E9E48644A0F562A38C64FB6007791F@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6007791F@scsmsx403.sc.intel.com>
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

On Tue, Oct 21, 2003 at 11:57:58AM -0700, Pallipadi, Venkatesh wrote:
> 
> 
> > -----Original Message-----
> > From: Ducrot Bruno [mailto:ducrot@poupinou.org] 
> > Sent: Tuesday, October 21, 2003 10:56 AM
> > 
> > > It will work any processor 
> > > that is ACPI compatible and again there are no specific 
> > > checks for Intel here.
> > > 
> > 
> > On a K7 with powernow for example, perf_ctrl and perf_data 
> > will be MSR 0
> > with your patch, that do not make sence.
> > Even if you know the correct MSRs, the values for 'control' 
> > and 'status'
> > in _PSS packages will be only bit-fields, and they can *not* be
> > written nor read directly to the (correct) MSRs (again for K7 
> > powernow).
> > 
> > This is because the FfixedHW is only an indication that a CPU specific
> > 'feature' (even though already somehow defined in ACPI like P-state,
> > C-state, etc.) have to be handled by the OS in a non-acpi driver, as
> > per ACPI spec, and that will be dependant of the CPU.
> > 
> 
> Agree with most of your comments. 
> Current ACPI P-state driver ignored everything other than SYSTEM_IO.
> And we are trying to add support for FIXED_HW. I was unaware of
> any other CPU using ACPI PCT FIXED_HW to mean anything other than
> MSR. As you mentioned, if K7 indeed exports some ACPI-PCT information 
> to mean something else, then that is a real bug in my patch. I will 
> add CPU specific abstraction to handle FIXED_HW get/set functions in 
> the next revision of the patch. 

That is why Dominik seperated the acpi cpufreq driver in 2 files in his
cleanup patch.  Others cpufreq drivers may use acpi to retrieve infos
if needed.  Even though by now K7 do not support that, it can be changed
for (the doc. seems to be under NDA, but AMD seems willing to cooperate).

Looking around some other asl, it seems also that if you verify that
_PCT return FFixedHW, but length and address are both different to 0,
it may be possible that a generic driver via MSR could work, but there
is nothing in specs afaik (and specs can be changed if compatible..).

-- 
Ducrot Bruno

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
