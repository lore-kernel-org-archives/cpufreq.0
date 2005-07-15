From: Vasanth Venkatachalam <vvenkata@es.nacs.uci.edu>
Subject: Re: CPUFreq Problems After Kernel Upgrade
Date: Fri, 15 Jul 2005 11:19:32 -0700 (PDT)
Message-ID: <Pine.GSO.4.30.0507151115040.10232-100000@rigel.oac.uci.edu>
References: <20050715164408.GB3240@isilmar.linta.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20050715164408.GB3240@isilmar.linta.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk

Hi,

Actually I just solved the problem. I noticed that when I unplugged the
computer, the /proc/cpuinfo display would freeze and when I plugged it
back in it would show the lowest frequency setting. This led me to suspect
that the ACPI daemon might be changing the clock frequency on its own. So
I disabled ACPI and recompiled the kernel. Sure enough, I'm now able to
change the clock frequency and see the changes in /proc/cpuinfo.

So it looks like some parts of ACPI actually interfere with the cpufreq
userspace governor.

Vasanth

*********

Vasanth Venkatachalam                        Office: CS/E 137
PhD Candidate				     Tel: None
School of Information and Computer Science   Email: vvenkata@uci.edu
University of California
Irvine, CA 92697-3425

On Fri, 15 Jul 2005, Dominik Brodowski wrote:

> Hi,
>
> Which cpufreq driver are you using?
>
> On Wed, Jul 13, 2005 at 03:37:22PM -0700, Vasanth Venkatachalam wrote:
> > Can someone help with this? I'm guessing that the OS is responsible for
> > this, but I am trying to find the piece of code that is the culprit.
>
> 	Dominik
>
