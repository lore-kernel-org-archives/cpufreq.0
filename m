From: Thomas Renninger <trenn@suse.de>
Subject: Re: [PATCH] cpufreq powernow-k8: Remove firmware warning in zero transition latency case
Date: Wed, 8 Jun 2011 16:46:35 +0200
Message-ID: <201106081646.35673.trenn@suse.de>
References: <201106081007.14264.trenn@suse.de> <20110608135526.GA6420@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110608135526.GA6420@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org

On Wednesday, June 08, 2011 03:55:27 PM Dave Jones wrote:
> On Wed, Jun 08, 2011 at 10:07:13AM +0200, Thomas Renninger wrote:
>  > AMD's BKDG documents that a zero transition latency should get passed
>  > for several recent CPU models.
>  > -> This isn't a firmware bug.
> 
> but the test you're deleting is checking for family < 11h. 
Eh, right. And in 2.6.32 we had:
-               if (boot_cpu_data.x86 != 0x11)
which I now removed and wanted to submit mainline...

> My reading of that comment is that it _was_ a firmware bug on earlier
> systems.

Not sure whether earlier systems really showed this, but
the test is correct, you can ignore the patch.

Thanks for pointing that out,

   Thomas
