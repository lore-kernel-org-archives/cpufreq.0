From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [PATCH] speedstep-centrino: Avoid returning zero freq on
	transient MSR values
Date: Fri, 10 Dec 2004 09:14:25 +0100
Message-ID: <20041210081425.GA8989@dominikbrodowski.de>
References: <20041209172436.A3337@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Cc: davej@redhat.com, cpufreq@www.linux.org.uk

On Thu, Dec 09, 2004 at 05:24:36PM -0800, Venkatesh Pallipadi wrote:
> 
> On some CPUs, we can see transient MSR values (which are not present in _PSS) in
> IA32_PERF_STATUS MSR, while CPU is doing some automatic P-state transition 
> (like TM2). 
> Current code will return frequency as 0 in such cases. Fix it by retrying the 
> get after a delay and use lowest possible frequency as the current frequency 
> in worst case.
> 
> Thanks to Matt Domsch for identifying and root-causing this failure.
> 
> Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Signed-off-by: Dominik Brodowski <linux@brodo.de>

Thanks,
	Dominik
