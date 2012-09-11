From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] cpufreq: add helper function cpufreq_set_target()
Date: Tue, 11 Sep 2012 09:34:07 +0800
Message-ID: <20120911013405.GB13721@S2101-09.ap.freescale.net>
References: <1346981599-28081-1-git-send-email-shawn.guo@linaro.org>
 <201209072131.56593.rjw@sisk.pl>
 <20120910031341.GS26709@S2101-09.ap.freescale.net>
 <201209102222.45165.rjw@sisk.pl>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201209102222.45165.rjw@sisk.pl>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: cpufreq@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Santosh Shilimkar <santosh.shilimkar@ti.com>, Kevin Hilman <khilman@ti.com>

On Mon, Sep 10, 2012 at 10:22:44PM +0200, Rafael J. Wysocki wrote:
> Hmm.  Who's going to use the cpufreq-cpu0 driver, then?  Is OMAP going to be
> the only user?
> 
Any platform that supports device tree (DT) will be able to use the
driver.  Right now, I have seen imx6q, AM35xx and highbank start using
the driver.

> I'm concerned about the copy-pasting, but if that copy-pasting is going to
> go away when you move OMAP to the new driver, then I agree that adding more
> complexity just to avoid it is probably not a good idea.
> 
> What's the planned time frame for the OMAP conversion?
> 
That depends on when OMAP gets fully converted to DT.  OMAP is in the
middle of the DT transition right now.  There are in-tree users of
omap-cpufreq driver that does not support DT (board files).  Before
the DT conversion is fully done (all those non-DT board files gets
removed), the omap-cpufreq driver still needs to be for a while.

-- 
Regards,
Shawn
