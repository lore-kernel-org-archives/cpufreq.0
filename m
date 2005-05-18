From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH] [0/5] ondemand,conservative governor pending patches
Date: Wed, 18 May 2005 13:30:50 -0700
Message-ID: <20050518133049.A22282@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk, Alexander Clouter <alex-kernel@digriz.org.uk>, Eric Piel <Eric.Piel@tremplin-utc.net>, linux@dominikbrodowski.net, Rajesh Shah <rajesh.shah@intel.com>



Pending ondemand, conervative governor patches.

All the patches are to be applied, in order, against 2.6.12-rc4-mm2. These 
patches covers the stuff under cpufreq/pending-patches/needs-work.

The patchset contains:

[PATCH] [1/5] ondemand,conservative minor bug-fix and cleanup
Same as the patch that I sent out to this list two days back. Copying here 
again as the following patches depends on this one.

[PATCH] [2/5] ondemand,conservative governor store the idle ticks for all cpus
Originally from Eric. The rebased patch handles both ondemand and conservative
governors.

[PATCH] [3/5] ondemand,conservative governor idle_tick clean-up
Originally from Eric. The rebased patch handles both ondemand and conservative 
governors.

[PATCH] [4/5] ondemand governor automatic downscaling
The patch is rebased for the latest kernel.

[PATCH] [5/5] ondemand governor default sampling downfactor as 1


Please apply.

Thanks,
Venki
