From: Andi Kleen <ak@suse.de>
Subject: Re: [PATCH] [1/2] cpufreq: Fix handling for CPU hotplug
Date: Tue, 28 Feb 2006 13:15:52 +0100
Message-ID: <200602281315.53204.ak@suse.de>
References: <B3870AD84389624BAF87A3C7B831499302935655@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <B3870AD84389624BAF87A3C7B831499302935655@SAUSEXMB2.amd.com>
Content-Disposition: inline
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
To: "shin, jacob" <jacob.shin@amd.com>
Cc: cpufreq@lists.linux.org.uk, davej@redhat.com, "Langsdorf,
	Mark" <mark.langsdorf@amd.com>

On Tuesday 28 February 2006 02:54, shin, jacob wrote:
> powernow-k8: Let cpufreq driver handle affected CPUs
> 
> Let the cpufreq driver manage AMD Dual-Core CPUs being tied together.
> 
> Since cpufreq driver's affected CPUs data, cpufreq_policy->cpus, already
> knows about which cores are tied together, powernow driver does not have
> keep its internal data for every core.  (even a pointer.. it will never
> be called on)  Telling cpufreq driver about cpu_core_map at init time is
> sufficient.

Nice - it even simplifies the code.  And makes sense.

How much regression testing did you do? Is it well tested enough for 2.6.16? 

-Andi
