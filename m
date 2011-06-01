From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] CPUFREQ/S5PV210,EXYNOS4: Add Kconfig options for S5PV210
 and EXYNOS4 CPUfreq drivers
Date: Wed, 1 Jun 2011 15:54:18 -0400
Message-ID: <20110601195418.GA30806@redhat.com>
References: <1306476428-24808-1-git-send-email-dg77.kim@samsung.com>
 <1306483489-10432-1-git-send-email-dg77.kim@samsung.com>
 <4DE6977E.5080107@samsung.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4DE6977E.5080107@samsung.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Donggeun Kim <dg77.kim@samsung.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, myungjoo.ham@samsung.com, Ben Dooks <ben-linux@fluff.org>

On Wed, Jun 01, 2011 at 12:48:14PM -0700, Kukjin Kim wrote:
 
 > Dave, could you please see below? If you're ok, will submit remained
 > others for Samsung cpufreq drivers.

I'm ok with the principle of the patch, though it doesn't seem to include
any driver movement, so just applying this will break the compile.
(If it happens in another patch, they should really go together to
 not break bisecting)

	Dave


