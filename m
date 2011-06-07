From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 1/5] CPUFREQ/S3C64xx: Move S3C64xx CPUfreq driver into
 drivers/cpufreq
Date: Mon, 6 Jun 2011 20:59:12 -0400
Message-ID: <20110607005912.GB20918@redhat.com>
References: <20110601094313.GA23122@opensource.wolfsonmicro.com>
 <1306921493-30911-1-git-send-email-broonie@opensource.wolfsonmicro.com>
 <BANLkTinR_WLjsgm5ogt_BbJwPFC0Kc1Dqg@mail.gmail.com>
 <20110601095811.GB13591@opensource.wolfsonmicro.com>
 <20110601164510.GA21467@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110601164510.GA21467@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kyungmin Park <kmpark@infradead.org>, cpufreq@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org

On Wed, Jun 01, 2011 at 12:45:10PM -0400, Dave Jones wrote:
 > On Wed, Jun 01, 2011 at 10:58:11AM +0100, Mark Brown wrote:
 >  > On Wed, Jun 01, 2011 at 06:55:05PM +0900, Kyungmin Park wrote:
 >  > 
 >  > > Instead of samsung tree, it should be handled at cpufreq tree.
 >  > > CCed the cpufreq maintainer.
 >  > 
 >  > Well, it's a something for both really as both trees are updated.  I
 >  > sent the orginal copy of this patch to both places but both sets of
 >  > maintainers just ignored it (I've never seen any response from the
 >  > cpufreq maintainers on this driver ever since I originally submitted
 >  > it).  
 > 
 > Sorry about that. It's actually in my 'to merge' mailbox, but I've been
 > laggy at dealing with it recently.  I'll try and clear the backlog in
 > the next day or two.

Ok, I finally got around to sorting this out. It needed some small changes
to fix up rejects in drivers/cpufreq/Makefile, but they looked trivial enough
that I'm sure they're ok. But look them over anyway ?

I also applied the S5PV210/EXYNOS4210 patch which also needed the same fixing.
Both pushed out to cpufreq.next

Let me know if there's anything I've missed

thanks,

	Dave
