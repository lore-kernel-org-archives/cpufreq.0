From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Potential cpufreq backports for v3.10 LTS
Date: Tue, 7 Oct 2014 09:46:43 -0700
Message-ID: <20141007164643.GA3748@kroah.com>
References: <20141007114844.GT4609@sirena.org.uk>
Mime-Version: 1.0
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141007114844.GT4609@sirena.org.uk>
Sender: linux-pm-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: Xiaoguang Chen <chenxg@marvell.com>, Stratos Karafotis <stratosk@semaphore.gr>, Andreas Schwab <schwab@linux-m68k.org>, Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Amit Kucheria <amit.kucheria@linaro.org>, stable@vger.kernel.org, cpufreq@vger.kernel.org, linux-pm@vger.kernel.org

On Tue, Oct 07, 2014 at 12:48:44PM +0100, Mark Brown wrote:
> Hi,
> 
> The power management team at Linaro has had a look at the cpufreq
> updates since the v3.10 LTS and identified a few patches that look
> like they should be in there.  The most recent of these is from v3.12 so
> they won't apply to any of the more recent stable kernels.
> 
>  - 59a6342203a7a cpufreq: Fix governor start/stop race condition
> 
>    This looks like a straight race condition fix.

That is not a commit id in Linus's tree :(

