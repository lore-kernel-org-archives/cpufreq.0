From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] cpufreq: Fix build of s3c64xx cpufreq driver for header
 change
Date: Fri, 29 Jul 2011 16:13:24 +0100
Message-ID: <20110729151324.GD19118@opensource.wolfsonmicro.com>
References: <1311949618-919-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <20110729144802.GB1422@redhat.com>
 <20110729150144.GC19118@opensource.wolfsonmicro.com>
 <20110729150851.GA9156@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110729150851.GA9156@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>, linux-kernel@vger.kernel.org, cpufreq@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

On Fri, Jul 29, 2011 at 11:08:51AM -0400, Dave Jones wrote:
> On Fri, Jul 29, 2011 at 04:01:44PM +0100, Mark Brown wrote:

>  > Possibly, but there were a bunch of other failures in the Samsung
>  > specific stuff not related to module.h which appeared today. I did run
>  > into another non-samsung module.h failure, though.  Mostly I was just
>  > surprised stuff like this was showing up so late in the merge window, I
>  > didn't spend a lot of time investigating what broke.

> wait, confused. Were you building Linus' tree, or -next ?

-next (given that the merge window is still open it should be emptying
out other than bug fixes...).
