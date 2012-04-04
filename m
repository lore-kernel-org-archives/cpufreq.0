From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: Fix exposure of ARM_EXYNOS4210_CPUFREQ
Date: Wed, 4 Apr 2012 16:03:53 +0100
Message-ID: <20120404150353.GB24211@n2100.arm.linux.org.uk>
References: <20120213094940.GA15338@n2100.arm.linux.org.uk> <4F3CF3DA.7000806@samsung.com> <20120216160250.GP13673@n2100.arm.linux.org.uk> <00aa01ccf084$93c98a70$bb5c9f50$%kim@samsung.com> <20120327074931.GK5611@n2100.arm.linux.org.uk> <4F73B3E1.4080807@samsung.com> <20120404145204.GA24211@n2100.arm.linux.org.uk> <20120404145917.GB1929@redhat.com>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=arm.linux.org.uk; s=caramon;
	h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date; bh=JbkcHBp5MBY8ZwiUcAwajCTZwdeVM9aWQQH6YtdQG7w=;
	b=WcjH9NQ0XXwWiYdpcOYQMuqPot5IfwspAsSHdo6YEVMZSZyeoN16xNZPCqmdyJIkF18deZJjxTX3UNF0KTDwmOhxsT5IgeY0BkmU+ulGbz2fEBzyGw+qsDYliR3UodAjPRE6CNQLojHJr1RvwpSs7Ut/1VC52d+44hcafmM6bb8=;
Content-Disposition: inline
In-Reply-To: <20120404145917.GB1929@redhat.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dave Jones' <davej@redhat.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, cpufreq@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Wed, Apr 04, 2012 at 10:59:17AM -0400, 'Dave Jones' wrote:
> On Wed, Apr 04, 2012 at 03:52:04PM +0100, Russell King - ARM Linux wrote:
>  > On Wed, Mar 28, 2012 at 05:59:13PM -0700, Kukjin Kim wrote:
>  > > Russell King wrote:
>  > >> As predicted, this is breaking other ARM platforms.  Please fix this
>  > >> yourself before your crappy code gets pushed into mainline.  Thanks.
>  > >>
>  > > I fixed it.
>  > 
>  > When will we see patches or the fix in mainline?
> 
> Just send it to Linus directly.

'it'... well, that implies that someone already has a patch.  I've asked
Kukjin to fix the problem which he introduced because exynos is getting
rather complicated, and he'll know what the dependencies should be.  So
far I've yet to see any kind of patch fixing this stuff.

Meanwhile I'm seeing failing randconfig builds for non-exynos ARM for
about a week due to the lack of dependencies.
