From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH 1/2] ondemand: updated tune for hardware coordination
Date: Mon, 31 Jul 2006 18:37:50 -0400
Message-ID: <20060731223750.GG31513@redhat.com>
References: <44CE4B10.6080506@linux.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <44CE4B10.6080506@linux.intel.com>
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
To: Alexey Starikovskiy <alexey_y_starikovskiy@linux.intel.com>
Cc: cpufreq@lists.linux.org.uk

On Mon, Jul 31, 2006 at 10:25:20PM +0400, Alexey Starikovskiy wrote:
 > 
 > cpufreq_ondemand.c |   13 ++++++++-----
 > 1 file changed, 8 insertions(+), 5 deletions(-)
 > 
 > Try to make dbs_check_cpu() call on all CPUs at the same jiffy.
 > This will help when multiple cores share P-states via Hardware Coordination.
 > 
 > Signed-off-by: Venkatesh Pallipadi <venkatesh.pallipadi at intel.com>
 > Signed-off-by: Alexey Starikovskiy <alexey.y.starikovskiy at intel.com>

Still doesn't apply..

error: patch failed: drivers/cpufreq/cpufreq_ondemand.c:303
error: drivers/cpufreq/cpufreq_ondemand.c: patch does not apply


 > Index: linux-2.6.15.1/drivers/cpufreq/cpufreq_ondemand.c
                ^^^^^^^^
Hmmm?

		Dave

-- 
http://www.codemonkey.org.uk
