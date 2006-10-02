From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: writing a cpufreq driver
Date: Mon, 2 Oct 2006 04:19:47 +0200
Message-ID: <20061002021947.GE19253@isilmar.linta.de>
References: <20060922153948.GN4945@poupinou.org>
	<20060922160025.GA4459@dbz.icequake.net>
	<20060922160514.GQ4945@poupinou.org>
	<20060922161149.GC4459@dbz.icequake.net>
	<20060923150751.GR4945@poupinou.org>
	<20060923152144.GA15964@dbz.icequake.net>
	<20060923154442.GT4945@poupinou.org>
	<20060923160335.GB15964@dbz.icequake.net>
	<20060923161311.GV4945@poupinou.org>
	<20060925153914.GB1364@dbz.icequake.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060925153914.GB1364@dbz.icequake.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Underwood <nemesis@icequake.net>
Cc: Cpufreq@lists.linux.org.uk, Bruno Ducrot <ducrot@poupinou.org>

On Mon, Sep 25, 2006 at 10:39:14AM -0500, Ryan Underwood wrote:
> Interesting that if it were SMI throttling, they would refer to it as
> "stop clock".  I wonder if anyone can tell us whether STPCLK stops TSC
> or not.

As far as I know, the TSC is usually stopped when triggering STPCLK on an
"older" CPU. Does the battery run-time increase when you use your driver?
Then it's doing _something_ , even if we do not know what it does exactly :)

	Dominik
