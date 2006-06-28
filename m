From: Venkatesh Pallipadi <venkatesh.pallipadi@intel.com>
Subject: [PATCH 0/4] minor optimizations to ondemand governor
Date: Wed, 28 Jun 2006 13:48:27 -0700
Message-ID: <20060628134827.A12989@unix-os.sc.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Transfer-Encoding: 7bit
To: cpufreq <cpufreq@www.linux.org.uk>
Cc: alexey.y.starikovskiy@intel.com, Dave Jones <davej@redhat.com>, Len Brown <lenb@unix-os.sc.intel.com>


Patch series with optimizations to ondemand governor and some coding-style
cleanups.

[PATCH 1/4] minor optimizations to ondemand governor
ondemand_remove_slowdown_06.patch
Removes the slowdown option from ondemand governor. This simplifies code in
periodic sampling a lot and reduces the path length in dbs_check_cpu 
by half.

[PATCH 2/4] minor optimizations to ondemand governor
queue_delayed_work_on_02.patch
Add a new interface to workqueue to enable scheduling work on a particular CPU.

[PATCH 3/4] minor optimizations to ondemand governor
ondemand_percpu_06.patch
Use queue_delayed_work_on interface to make ondemand sampling percpu. This also
removes the mutex in sampling path.

[PATCH 4/4] minor optimizations to ondemand governor
ondemand_misc_cleanups_06.patch
Misc. cleanups to ondemand from coding-style perspective.

Thanks,
Venki
