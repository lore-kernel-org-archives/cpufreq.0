From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: oops on resume
Date: Mon, 9 Aug 2004 21:38:24 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040809193824.GA9020@dominikbrodowski.de>
References: <1091736171.10552.26.camel@pc> <20040805200857.GA28775@redhat.com>
	<1091737170.10552.32.camel@pc>
	<20040805210916.GB23087@dominikbrodowski.de>
	<1091814215.10552.133.camel@pc>
	<20040806175530.GA16167@dominikbrodowski.de>
	<20040807132449.GA9569@dominikbrodowski.de>
	<1091905423.29221.1.camel@pc>
	<20040808162408.GA7986@dominikbrodowski.de>
	<1092072470.14584.29.camel@pc>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <1092072470.14584.29.camel@pc>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Brian J. Murrell" <brian@interlinx.bc.ca>
Cc: Dave Jones <davej@redhat.com>, cpufreq@www.linux.org.uk

On Mon, Aug 09, 2004 at 01:27:50PM -0400, Brian J. Murrell wrote:
> So we do hit "time_cpufreq_notifier 6" now, but we also get some errors
> about spinlocks.
... which is not cpufreq-related, AFAICS.

> The screen is black
Have you tried the different acpi_sleep options? Also, check out the
comments in this bug: http://bugzilla.kernel.org/show_bug.cgi?id=1877

> and my ssh session is dead
'cause there seems to be some problem with the eth driver and/or hardware.
Try building it as a module, rmmod it before resume, modprobe it afterwards.

> that serial console.  Wait, I just logged in "blindly" on the console
> and did a shutdown, so it seems to have resumed ok, apart from the above
> issues.

Good luck in solving the other issues, I'll push the oops-avoiding patch
upstreams soon.

Thanks,
	Dominik
