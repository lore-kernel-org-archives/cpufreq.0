From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Re: [PATCH] speedstep-centrino: Avoid returning zero freq on
	transient MSR values
Date: Fri, 10 Dec 2004 02:11:35 -0800
Message-ID: <1102673495.18051.9.camel@minilith.goop.org>
References: <20041209172436.A3337@unix-os.sc.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20041209172436.A3337@unix-os.sc.intel.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: davej@redhat.com, Dominik Brodowski <linux@dominikbrodowski.de>, cpufreq list <cpufreq@www.linux.org.uk>

On Thu, 2004-12-09 at 17:24 -0800, Venkatesh Pallipadi wrote:
> 
> 
> On some CPUs, we can see transient MSR values (which are not present in _PSS) in
> IA32_PERF_STATUS MSR, while CPU is doing some automatic P-state transition 
> (like TM2). 
> Current code will return frequency as 0 in such cases. Fix it by retrying the 
> get after a delay and use lowest possible frequency as the current frequency 
> in worst case.
> 
> Thanks to Matt Domsch for identifying and root-causing this failure.

Doesn't this suggest there's a more subtle problem?  If the CPU is
changing speeds autonomously, then it means the TSC calibration will be
broken.  Is there some way of finding out about these transitions?

Also, why not just report the actual MSR frequency, rather than looking
for a table/_PSS match?  Are the MSR values meaningfully encoded?

	J
