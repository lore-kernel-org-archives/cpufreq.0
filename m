From: Dave Jones <davej@redhat.com>
Subject: Re: speedstep capability checks
Date: Tue, 16 Mar 2004 13:01:14 +0000
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040316130114.GA13713@redhat.com>
References: <20040314152016.0B04B3F04@latitude.mynet.no-ip.org>
	<20040315141517.GG8636@dominikbrodowski.de>
	<20040315210950.GC15243@redhat.com>
	<20040316073847.GA7597@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20040316073847.GA7597@dominikbrodowski.de>
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
To: aeriksson@fastmail.fm, Arjan van de Ven <arjanv@redhat.com>, cpufreq@www.linux.org.uk

On Tue, Mar 16, 2004 at 08:38:47AM +0100, Dominik Brodowski wrote:

 > So, Anders' CPU reports itself to be non-SpeedStep-capable. However,
 > SpeedStep runs fine on his CPU. We can't enable SpeedStep on all CPUs [even
 > of the same stepping (model/brand are the same anyway)] as we don't know if
 > all of them work fine if running SpeedStep on them -- or if it causes
 > (permanent) hardware failure! Some, who know it works from running a
 > different OS, and possibly a specific vendor-provided driver on their
 > notebook, might want to skip this test and try out their luck. But then they
 > know what they're doing, and that they're risking their own hardware.

We've already seen quite a few confused users who thought that throttling == speedstep.
This sounds like handing someone a gun and saying 'point it at your head,
pull the trigger, it might miss'.

 > A few SpeedStep-capable systems don't perform according to specification: the
 > CPUID and/or some MSRs don't tell us the CPU is SpeedStep capable even though
 > it definitely is.

Is there nothing in the errata documents about this ?

 > Allow a relaxed checking for one such issue by a module 
 > parameter only available if a config option is turned on. This is done to 
 > avoid the risk of doing invalid speedstep instructions on systems which do 
 > not support it, and which might even lead to (hardware) failure.

I'd merge this really as a last resort, and it's beginning to sound like
we don't really have any options (other than not support those broken boxes). Ugh.

		Dave
