From: Andi Kleen <ak@suse.de>
Subject: Re: [PATCH] [2/2] cpufreq: Fix handling for CPU hotplug
Date: Tue, 28 Feb 2006 13:17:18 +0100
Message-ID: <200602281317.18912.ak@suse.de>
References: <B3870AD84389624BAF87A3C7B831499302935656@SAUSEXMB2.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <B3870AD84389624BAF87A3C7B831499302935656@SAUSEXMB2.amd.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: "shin, jacob" <jacob.shin@amd.com>
Cc: cpufreq@lists.linux.org.uk, davej@redhat.com, "Langsdorf,
	Mark" <mark.langsdorf@amd.com>

On Tuesday 28 February 2006 02:54, shin, jacob wrote:
> cpufreq: Fix handling for CPU hotplug
> 
> This patch adds proper logic to cpufreq driver in order to handle
> CPU Hotplug.
> 
> When CPUs go on/offline, the affected CPUs data, cpufreq_policy->cpus,
> is not updated properly. This causes sysfs directories and symlinks to
> be in an incorrect state after few CPU on/offlines.

Looks good to me. I assume that's an 2.6.16 candidate too.

Dave, can you submit them?

-Andi
