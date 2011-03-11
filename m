From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] cpufreq: Remove the pm_message_t argument from driver suspend
Date: Fri, 11 Mar 2011 21:31:47 +0100
Message-ID: <201103112131.47862.rjw@sisk.pl>
References: <201103102113.05946.rjw@sisk.pl> <20110310205008.GB7750@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <20110310205008.GB7750@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@vger.kernel.org, Linux PM mailing list <linux-pm@lists.linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@suse.de>

On Thursday, March 10, 2011, Dave Jones wrote:
> On Thu, Mar 10, 2011 at 09:13:05PM +0100, Rafael J. Wysocki wrote:
>  > From: Rafael J. Wysocki <rjw@sisk.pl>
>  > 
>  > None of the existing cpufreq drivers uses the second argument of
>  > its .suspend() callback (which isn't useful anyway), so remove it.
>  > 
>  > Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
>  > ---
>  > 
>  > Hi,
>  > 
>  > This patch is requisite for sysdevs rework discussed here:
>  > https://lkml.org/lkml/2011/3/9/439
>  > Please apply or let me know if I can take it to the suspend tree.
> 
> Looks ok to me.
> 
> applied and queued for .39

Thanks!

Rafael

