From: Thomas Renninger <trenn@suse.de>
Subject: Re: Pentium D 915 support
Date: Thu, 03 Aug 2006 18:37:23 +0200
Message-ID: <1154623044.4302.550.camel@queen.suse.de>
References: <1154265136.21063.10.camel@skylla.slagter.name>
	<44CCD154.3080606@linux.intel.com>
	<1154275129.21063.31.camel@skylla.slagter.name>
	<1154605493.4302.494.camel@queen.suse.de>
	<1154605725.14206.22.camel@localhost>
	<1154617009.4302.515.camel@queen.suse.de>
	<44D21666.5030304@linux.intel.com>
Reply-To: trenn@suse.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44D21666.5030304@linux.intel.com>
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
To: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Cc: cpufreq@lists.linux.org.uk

> Thomas Renninger wrote:
> > available frequency steps: 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80
> > GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.80 GHz, 2.40 GHz
> > 
> Algorithm does not care about same P-steps. It will get to 2.4 in one step.
> This is not BIOS bug, it is just a way to avoid dynamic memory allocation in BIOS.
> And it has nothing to do with performance losses due to note above.

That makes sense, thanks for pointing that out,

    Thomas
