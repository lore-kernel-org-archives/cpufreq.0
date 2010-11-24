From: Borislav Petkov <bp@amd64.org>
Subject: Re: Missing "unregister_cpu_notifier" in powernow-k8.c
Date: Wed, 24 Nov 2010 14:13:03 +0100
Message-ID: <20101124131303.GA24892@aftab>
References: <20101124112801.78830fba@notabene.brown>
 <20101124021938.GB1987@redhat.com>
 <20101124023124.GD1987@redhat.com>
 <20101124090228.GA17766@liondog.tnic>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20101124090228.GA17766@liondog.tnic>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>, Neil Brown <neilb@suse.de>, x86@kernel.org, cpufreq@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Nov 24, 2010 at 04:02:28AM -0500, Borislav Petkov wrote:
> On Tue, Nov 23, 2010 at 09:31:24PM -0500, Dave Jones wrote:
> > On Tue, Nov 23, 2010 at 09:19:38PM -0500, Dave Jones wrote:
> >  >  The following might be a partial fix, but I suspect there is probably other
> >  >  clean-up that is needed.
> > 
> > Indeed, looks like another possible leak in the unlikely event that the
> > percpu msr struct can't be allocated..
> > Instead of adding an unregister on fail, I think we can just move the registration later.
> 
> Oops, that would be partly my fault, sorry. How about the following
> instead, with proper exit path labels as it is done in other kernel
> code?
> 
>   [ It is not yet tested but I'll give it a run later on my X6 to verify ]

Ok, I went and fixed up the error message too when Cool'N'Quiet is disabled in
the BIOS. Tested patches coming up...

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
General Managers: Alberto Bozzo, Andrew Bowd
Registration: Dornach, Gemeinde Aschheim, Landkreis Muenchen
Registergericht Muenchen, HRB Nr. 43632
