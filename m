From: Dominik Brodowski <linux@brodo.de>
Subject: Re: [PATCH] 1/3 Dynamic cpufreq governor and updates to ACPI
	P-state driver
Date: Tue, 21 Oct 2003 21:57:38 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20031021195738.GA26971@brodo.de>
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
Cc: "Mallick, Asit K" <asit.k.mallick@intel.com>, Ducrot Bruno <ducrot@poupinou.org>, cpufreq@www.linux.org.uk, "Nakajima, Jun" <jun.nakajima@intel.com>

On Tue, Oct 21, 2003 at 10:15:31AM -0700, Pallipadi, Venkatesh wrote:
> 
> > -----Original Message-----
> > From: Ducrot Bruno [mailto:ducrot@poupinou.org] 
> > 
> > There is already a patch from Dominik Brodowski for the apci 
> > p-state which IMHO
> > is better at least by design.  
> 
> Are you referring to cleanup of ACPI P-state driver by Dominik?
> That patch is indeed nice and clean. But that is mostly 
> orthogonal to this patch. I mean, 
> - SMP awareness in P-state driver 
> - P-state coordination between HT siblings
> will still be required even after Dominik's patch. Though exact 
> location of these changes will change when applied over Dominik's 
> patch.
> 
> There is a small overlap in handling MSR based P-state transitions, 
> but that is a real minor change in my patch and I am reusing most 
> of the existing IO based transitions code for MSR based ones.

Indeed there is. However, as 2.6. is in a "stability freeze" right now, my
pretty invasive cleanup won't have a chance of going in soon. I'd like to
separate the issues with the p-state driver from the demandbased cpufreq
governor, though...

	Dominik
