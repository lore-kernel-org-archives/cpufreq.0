From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: CPUFREQ maintainence.
Date: Tue, 08 May 2012 15:16:27 +0900
Message-ID: <018601cd2ce2$19fdd8f0$4df98ad0$%kim@samsung.com>
References: <20120430140645.GB12583@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-reply-to: <20120430140645.GB12583@redhat.com>
Content-language: ko
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Dave Jones' <davej@redhat.com>, cpufreq@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, jc.lee@samsung.com, 'Russell King' <rmk+kernel@arm.linux.org.uk>

Dave Jones wrote:
> 
> This last few releases I've been more of a hindrance than help to getting
> some of the patches merged upstream, so due to my lack of time, I'm
> considering
> removing myself as maintainer, and having patches routed as such
instead...
> 
> ARM -> Russell/relevant ARM subtree maintainers
> x86 driver patches -> x86@vger.kernel.org
> (All the other archs currently supported already go through the arch trees
> mips/sparc etc)
> 
> The core doesn't see a huge amount of change these days, I figure patches
> for
> that can just go to lkml & Linus/Andrew like any other subsystem.
> 
> comments?
> 
The most EXYNOS SoCs' cpufreq drivers have been updated by Jaecheol Lee and
it is still needed to update/upgrade. I think, Mr. Lee can maintain
drivers/cpufreq/exynos* and he is a right person for it.

Russell, Dave, how do you think?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

