From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH] cpufreq, powernow-k8: Remove usage of smp_processor_id() in preemptible code
Date: Mon, 15 Oct 2012 07:50:13 +0200
Message-ID: <1395148.DypXQr3MdC@vostro.rjw.lan>
References: <20121009193844.GC7724@alberich> <20121012151841.GA4571@alberich> <27008283.MeT6T60WP8@vostro.rjw.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <27008283.MeT6T60WP8@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Borislav Petkov <bp@alien8.de>
Cc: Andreas Herrmann <andreas.herrmann3@amd.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Tejun Heo <tj@kernel.org>, linux-pm@vger.kernel.org

> On Sunday 14 of October 2012 10:27:22 Rafael J. Wysocki wrote:
> > Hi,
> > 
> > Thanks for the patch!  I'll queue it up for v3.7 when I get back home from
> > the current trip (around the -rc3 time frame I suppose).
> > 
> > In future please don't send patches directly to stable@vger.kernel.org.
> > That doesn't make -stable pick them up anyway and confuses things.
> 
> That happens anyway if you tag the patch for stable and use git
> send-email. Unless you go the extra mile and filter out the cc list,
> which is tedious.

Well, please don't tag patches for -stable, because -stable doesn't take
_patches_.  It takes commits from the Linus' tree and backports them and
that's maintainer's job to tag them for -stable, not yours.

You can give the maintainer a hint that you _think_ it's -stable material
(e.g. in the additional patch description that goes after the changelog),
but the maintainer may still disagree with you and may not tag the commit
for -stable after all.

> Besides, I'm pretty sure stable maintainers verify a patch is actually
> upstream before applying it anyway.

Yes, they do, but that means it doesn't make sense to send them stuff
before it's been merged, right?

Rafael


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
