From: "Darrick J. Wong" <djwong@us.ibm.com>
Subject: [PATCH] cpufreq: Document the currently undocumented parts of the
	sysfs interface
Date: Fri, 21 Mar 2008 16:56:31 -0700
Message-ID: <20080321235631.GS5529@tree.beaverton.ibm.com>
References: <20080321004354.GQ5529@tree.beaverton.ibm.com> <20080321154124.668969a2.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756527AbYCUX4r@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080321154124.668969a2.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: cpufreq@lists.linux.org.uk, linux-kernel@vger.kernel.org, venkatesh.pallipadi@intel.com

On Fri, Mar 21, 2008 at 03:41:24PM -0700, Andrew Morton wrote:

> I was going to ding you for not updating the kernel->userspace API
> documentation.  But it seems that none of this interface is documented
> anyway :(

Actually, I deserve the ding, for there _is_ a description of some of
the sysfs files.  However, there are some that are not mentioned in the
documentation, so add them to the user's guide.

Signed-off-by: Darrick J. Wong <djwong@us.ibm.com>
---

 Documentation/cpu-freq/user-guide.txt |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/Documentation/cpu-freq/user-guide.txt b/Documentation/cpu-freq/user-guide.txt
index af3b925..6c442d8 100644
--- a/Documentation/cpu-freq/user-guide.txt
+++ b/Documentation/cpu-freq/user-guide.txt
@@ -154,6 +154,11 @@ scaling_governor,		and by "echoing" the name of another
 				that some governors won't load - they only
 				work on some specific architectures or
 				processors.
+
+cpuinfo_cur_freq :		Current speed of the CPU, in KHz.
+
+scaling_available_frequencies : List of available frequencies, in KHz.
+
 scaling_min_freq and
 scaling_max_freq		show the current "policy limits" (in
 				kHz). By echoing new values into these
@@ -162,6 +167,15 @@ scaling_max_freq		show the current "policy limits" (in
 				first set scaling_max_freq, then
 				scaling_min_freq.
 
+affected_cpus :			List of CPUs that require software coordination
+				of frequency.
+
+related_cpus :			List of CPUs that need some sort of frequency
+				coordination, whether software or hardware.
+
+scaling_driver :		Hardware driver for cpufreq.
+
+scaling_cur_freq :		Current frequency of the CPU, in KHz.
 
 If you have selected the "userspace" governor which allows you to
 set the CPU operating frequency to a specific value, you can read out
