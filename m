From: Borislav Petkov <bp@amd64.org>
Subject: Re: [PATCH] powernow-k8: Fixup missing _PSS objects message
Date: Wed, 18 Jul 2012 23:05:49 +0200
Message-ID: <20120718210549.GA17504@aftab.osrc.amd.com>
References: <1342624043-29763-1-git-send-email-bp@amd64.org>
 <201207182150.51441.rjw@sisk.pl>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201207182150.51441.rjw@sisk.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Jul 18, 2012 at 09:50:51PM +0200, Rafael J. Wysocki wrote:
> On Wednesday, July 18, 2012, Borislav Petkov wrote:
> > From: Borislav Petkov <borislav.petkov@amd.com>
> > 
> > _PSS objects can also be missing if Cool'N'Quiet is disabled in the
> > BIOS. Add that to the FW_BUG message for the user to try before updating
> > her BIOS. Fix formatting while at it.
> > 
> > Acked-by: Mark Langsdorf <mark.langsdorf@amd.com>
> > Signed-off-by: Borislav Petkov <borislav.petkov@amd.com>
> 
> I will take this, but it's kind of too late for v3.6.

Yeah, sure, whenever. I found it buried in my mbox since 3.2ish. And
since it is not urgent, you don't have to rush it for 3.6 but send it
upstream whenever you like.

Thanks.

-- 
Regards/Gruss,
Boris.

Advanced Micro Devices GmbH
Einsteinring 24, 85609 Dornach
GM: Alberto Bozzo
Reg: Dornach, Landkreis Muenchen
HRB Nr. 43632 WEEE Registernr: 129 19551
