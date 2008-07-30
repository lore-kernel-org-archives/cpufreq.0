From: Dave Jones <davej@codemonkey.org.uk>
Subject: Re: [patch 0/6] cpufreq: Use idle micro-accounting information in
	ondemand governor
Date: Wed, 30 Jul 2008 12:56:30 -0400
Message-ID: <20080730165630.GJ2361@codemonkey.org.uk>
References: <20080717205554.214645000@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20080717205554.214645000@intel.com>
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
To: venkatesh.pallipadi@intel.com
Cc: davej@redhat.com, cpufreq@www.linux.org.uk

On Thu, Jul 17, 2008 at 01:55:54PM -0700, Venki Pallipadi wrote:
 > Currently, ondemand governor uses jiffy based idle statistics which is
 > very coarse grained. As a result, ondemand uses a big gaurd band around
 > CPU utilization while calculating the next freq.
 > 
 > This patchset lets ondemand use idle microaccounting when available
 > (when tickless feature is present) and switches to a smaller gaurd band.
 > This lets us do more aggressive power savings in partial idle workloads.
 > 
 > Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>

I had problems applying these.

Applying [CPUFREQ][1/6] cpufreq: Add cpu number parameter to __cpufreq_driver_getavg()
Applying [CPUFREQ][2/6] cpufreq: Change load calculation in ondemand for software coordination
error: patch failed: drivers/cpufreq/cpufreq_ondemand.c:365

Can you rediff them on top of the next branch of git-cpufreq ?

thanks,

	Dave

-- 
http://www.codemonkey.org.uk
