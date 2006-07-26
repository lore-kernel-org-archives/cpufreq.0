From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 2/2 vs 2.6.18-rc1] ondemand: add powersave_bias tunable
Date: Tue, 25 Jul 2006 20:29:16 -0400
Message-ID: <20060726002916.GA29328@redhat.com>
References: <200607131621.31600.len.brown@intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200607131621.31600.len.brown@intel.com>
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
Content-Transfer-Encoding: 7bit
To: Len Brown <len.brown@intel.com>
Cc: cpufreq@lists.linux.org.uk

On Thu, Jul 13, 2006 at 04:21:31PM -0400, Len Brown wrote:

Hey Len & co.

 > From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
 > 
 > cpufreq_ondemand.c |  164 +++++++++++++++++++++++++++++++++++++++++++++++++----
 >  1 files changed, 153 insertions(+), 11 deletions(-)
 > 
 > ondemand selects the minimum frequency that can retire
 > a workload with negligible idle time -- ideally resulting in the highest
 > performance/power efficiency with negligible performance impact.

I had to drop this and the follow-on patches from the cpufreq.git tree
due to collisions with the stuff Linus did a few days ago.

Can you rediff this please when things settle down again ?
(Likely not to be until after the cpufreq vs hotplug cpu mess is sorted out).

(Also, the third set of patches had some problems:
- Please put one patch per mail, then I don't have to hand-hack mbox's
  for git-apply
- MIME is bad mmkay? Include the patches inline, and all will be happy.

Thanks,

		Dave

-- 
http://www.codemonkey.org.uk
