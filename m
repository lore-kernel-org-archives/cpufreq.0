From: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 1/3] cpufreq: kirkwood: Add a cpufreq driver for
 Marvell Kirkwood SoCs
Date: Wed, 6 Feb 2013 07:22:37 +0100
Message-ID: <20130206062237.GE20212@lunn.ch>
References: <1360094115-14999-1-git-send-email-andrew@lunn.ch>
 <1360094115-14999-2-git-send-email-andrew@lunn.ch>
 <1592206.QUWhA9cOzT@vostro.rjw.lan>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1592206.QUWhA9cOzT@vostro.rjw.lan>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, linux ARM <linux-arm-kernel@lists.infradead.org>, cpufreq@vger.kernel.org, viresh.kumar@linaro.org

On Tue, Feb 05, 2013 at 10:45:38PM +0100, Rafael J. Wysocki wrote:
> On Tuesday, February 05, 2013 08:55:13 PM Andrew Lunn wrote:
> > The Marvell Kirkwood SoCs have simple cpufreq support in hardware. The
> > CPU can either use the a high speed cpu clock, or the slower DDR
> > clock. Add a driver to swap between these two clock sources.
> > 
> > Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> > Acked-by: Jason Cooper <jason@lakedaemon.net>
> 
> This has been ACKed by Viresh already IIRC, right?

Yes, it has. Also the ARM parts have been asked by Jason Cooper.

However, the changes to the clocks are not that small....

	 Andrew
