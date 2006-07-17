From: "Joachim Deguara" <joachim.deguara@amd.com>
Subject: Re: [discuss] Re: [PATCH] Allow all Opteron processors to
 change pstate at same time
Date: Mon, 17 Jul 2006 09:37:10 +0200
Message-ID: <1153121830.3917.2.camel@lapdog.site>
References: <B3870AD84389624BAF87A3C7B831499302935A76@SAUSEXMB2.amd.com>
 <20060713130604.GC8230@ucw.cz> <1152801132.4519.10.camel@lapdog.site>
 <20060716015636.GC21162@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932321AbWGQHlJ@vger.kernel.org>
In-Reply-To: <20060716015636.GC21162@atrey.karlin.mff.cuni.cz>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pavel Machek <pavel@suse.cz>
Cc: "shin, jacob" <jacob.shin@amd.com>, Andi Kleen <ak@suse.de>, "Langsdorf, Mark" <mark.langsdorf@amd.com>, discuss@x86-64.org, linux-kernel@vger.kernel.org, cpufreq@lists.linux.org.uk

On Sun, 2006-07-16 at 03:56 +0200, Pavel Machek wrote:
> > On Thu, 2006-07-13 at 13:06 +0000, Pavel Machek wrote:
> > > Can you run two such tests *in parallel*? That seemed to break it
> > > really quickly.
> > parallel sounds fun, but I don't get it.  Two machine or trying to
> go
> > online and offline at the same time?  Firestorming two busy parallel
> 
> Trying to online and offline at the same time.
> 
> > while loops, one turning the core offline and the other online, did
> not
> > bring an oops so I guess this kernel is in the clear in that regard.
> 
> Better run two tight loops, each doing online; offline. I got reports
> it crashed machines before, but maybe it is solved. 

yeah, that's what I did. Somethings are easier described in bash than in
english.  Nothing crashed or oopsed so the green light is there for
online and offline in 2.6.18-rc1 (with my setup).

-joachim


