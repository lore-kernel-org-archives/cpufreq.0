From: venkatesh.pallipadi@intel.com
Subject: [patch 0/6] cpufreq: Use idle micro-accounting information in
	ondemand governor
Date: Thu, 17 Jul 2008 13:55:54 -0700
Message-ID: <20080717205554.214645000@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@www.linux.org.uk
Cc: davej@redhat.com

Currently, ondemand governor uses jiffy based idle statistics which is
very coarse grained. As a result, ondemand uses a big gaurd band around
CPU utilization while calculating the next freq.

This patchset lets ondemand use idle microaccounting when available
(when tickless feature is present) and switches to a smaller gaurd band.
This lets us do more aggressive power savings in partial idle workloads.

Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>


-- 
