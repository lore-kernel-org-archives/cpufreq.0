From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: [PATCH] 3/3 Dynamic cpufreq governor and updates to ACPI P-state driver
Date: Fri, 24 Oct 2003 11:52:32 -0700
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <88056F38E9E48644A0F562A38C64FB60077960@scsmsx403.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@brodo.de>, "Nakajima, Jun" <jun.nakajima@intel.com>, "Moore, Robert" <robert.moore@intel.com>, Pavel Machek <pavel@ucw.cz>
Cc: "Mallick, Asit K" <asit.k.mallick@intel.com>, linux-acpi <linux-acpi@intel.com>, cpufreq@www.linux.org.uk, linux-kernel@vger.kernel.org


OK. I will stick 'demandbased' then. 

-Venkatesh 

> -----Original Message-----
> From: Dominik Brodowski [mailto:linux@brodo.de] 
> Sent: Friday, October 24, 2003 11:39 AM
> To: Nakajima, Jun; Moore, Robert; Pavel Machek
> Cc: Pallipadi, Venkatesh; Mallick, Asit K; linux-acpi; 
> cpufreq@www.linux.org.uk; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] 3/3 Dynamic cpufreq governor and updates 
> to ACPI P-state driver
> 
> 
> Vetoed.
> 
> cpufreq_dynamic is too generic, there are different 
> approaches == different
> governors in the work which are all "dynamic".
> 
> 	Dominik
> 
> On Thu, Oct 23, 2003 at 02:50:06PM -0700, Nakajima, Jun wrote:
> > Me too, because it would be consistent with the other ones; 
> i.e. how the
> > user perceives them.
> 
> On Thu, Oct 23, 2003 at 01:47:49PM -0700, Moore, Robert wrote:
> > 
> > I would vote for "cpufreq_dynamic"
> > 
> > Bob
> 
> On Thu, Oct 23, 2003 at 04:17:04PM +0200, Pavel Machek wrote:
> > Could you name it cpufreq_demand? We have enough
> > TLAs as is.
> > 				Pavwl
> 
> 
