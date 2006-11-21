From: Adrian Bunk <bunk@stusta.de>
Subject: Re: [discuss] 2.6.19-rc6: known regressions (v4)
Date: Tue, 21 Nov 2006 22:39:00 +0100
Message-ID: <20061121213900.GT5200@stusta.de>
References: <Pine.LNX.4.64.0611152008450.3349@woody.osdl.org> <20061121212424.GQ5200@stusta.de> <20061121213139.GC9651@redhat.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1161372AbWKUVjD@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20061121213139.GC9651@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, Linus Torvalds <torvalds@osdl.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mattia Dongili <malattia@linux.it>, cpufreq@lists.linux.org.uk

On Tue, Nov 21, 2006 at 04:31:39PM -0500, Dave Jones wrote:
> On Tue, Nov 21, 2006 at 10:24:24PM +0100, Adrian Bunk wrote:
> 
>  > Subject    : CPU_FREQ_GOV_ONDEMAND=y compile error
>  > References : http://lkml.org/lkml/2006/11/17/198
>  > Submitter  : alex1000@comcast.net
>  > Caused-By  : Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
>  >              commit 05ca0350e8caa91a5ec9961c585c98005b6934ea
>  > Handled-By : Mattia Dongili <malattia@linux.it>
>  > Patch      : http://lkml.org/lkml/2006/11/17/236
>  > Status     : patch available
> 
> not a regression, easily worked around, queued for .20

It is a regression since commit 05ca0350e8caa91a5ec9961c585c98005b6934ea 
was merged after 2.6.18.

Considering that the fix is trivial, why shouldn't it be merged before 
2.6.19?

> 		Dave

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed
