From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: CPUFreq Problems After Kernel Upgrade
Date: Fri, 15 Jul 2005 20:21:27 +0200
Message-ID: <20050715182127.GA6536@isilmar.linta.de>
References: <20050715164408.GB3240@isilmar.linta.de>
	<Pine.GSO.4.30.0507151115040.10232-100000@rigel.oac.uci.edu>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.30.0507151115040.10232-100000@rigel.oac.uci.edu>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasanth Venkatachalam <vvenkata@es.nacs.uci.edu>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Fri, Jul 15, 2005 at 11:19:32AM -0700, Vasanth Venkatachalam wrote:
> Actually I just solved the problem. I noticed that when I unplugged the
> computer, the /proc/cpuinfo display would freeze and when I plugged it
> back in it would show the lowest frequency setting. This led me to suspect
> that the ACPI daemon might be changing the clock frequency on its own. So
> I disabled ACPI and recompiled the kernel. Sure enough, I'm now able to
> change the clock frequency and see the changes in /proc/cpuinfo.
> 
> So it looks like some parts of ACPI actually interfere with the cpufreq
> userspace governor.

I'd suspect it was an userspace tool, then. No need to disable ACPI in the
kernel, but only disable the userspace tool, I suspect.

Thanks,
	Dominik
