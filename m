From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: writing a cpufreq driver
Date: Sat, 23 Sep 2006 17:07:52 +0200
Message-ID: <20060923150751.GR4945@poupinou.org>
References: <20060921184833.GC1216@dbz.icequake.net>
	<20060922153948.GN4945@poupinou.org>
	<20060922160025.GA4459@dbz.icequake.net>
	<20060922160514.GQ4945@poupinou.org>
	<20060922161149.GC4459@dbz.icequake.net>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20060922161149.GC4459@dbz.icequake.net>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryan Underwood <nemesis@icequake.net>
Cc: Cpufreq@lists.linux.org.uk

On Fri, Sep 22, 2006 at 11:11:49AM -0500, Ryan Underwood wrote:
> 
> On Fri, Sep 22, 2006 at 06:05:14PM +0200, Bruno Ducrot wrote:
> > 
> > I'm now sure the southbridge is throttling the processor...
> 
> How would it usually do this, by repeated #SMI?

By repeated STPCLK# I guess.  IIRC i486 (and newer intel processors) had
that pin.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
