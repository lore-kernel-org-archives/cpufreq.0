From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 1/3] cpufreq: kirkwood: Add a cpufreq driver for
 Marvell Kirkwood SoCs
Date: Fri, 1 Feb 2013 21:10:41 +0530
Message-ID: <CAKohponBrABri_8haNZXZY51caLnswAkGdzEyhb0UMCiDpJzVw@mail.gmail.com>
References: <1359729096-15371-1-git-send-email-andrew@lunn.ch>
	<1359729096-15371-2-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1359729096-15371-2-git-send-email-andrew@lunn.ch>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jason Cooper <jason@lakedaemon.net>, rjw@sisk.pl, linux ARM <linux-arm-kernel@lists.infradead.org>, cpufreq@vger.kernel.org

On 1 February 2013 20:01, Andrew Lunn <andrew@lunn.ch> wrote:
> The Marvell Kirkwood SoCs have simple cpufreq support in hardware. The
> CPU can either use the a high speed cpu clock, or the slower DDR
> clock. Add a driver to swap between these two clock sources.
>
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Acked-by: Jason Cooper <jason@lakedaemon.net>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
