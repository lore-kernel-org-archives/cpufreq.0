From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] [7/7] x86_64: Move ondemand timer into own work queue
Date: Fri, 5 May 2006 15:09:45 -0400
Message-ID: <20060505190945.GG9937@redhat.com>
References: <445B9A6A.mailIZ41BYSAC@suse.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <445B9A6A.mailIZ41BYSAC@suse.de>
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
To: Andi Kleen <ak@suse.de>
Cc: akpm@osdl.org, discuss@x86-64.org, torvalds@osdl.org, cpufreq@lists.linux.org.uk

On Fri, May 05, 2006 at 08:33:14PM +0200, Andi Kleen wrote:
 > 
 > Taking the cpu hotplug semaphore in a normal events workqueue
 > is unsafe because other tasks can wait for any workqueues with
 > it hold. This results in a deadlock.
 > 
 > Move the DBS timer into its own work queue which is not 
 > affected by other work queue flushes to avoid this.
 > 
 > Cc: venkatesh.pallipadi@intel.com
 > Cc: cpufreq@lists.linux.org.uk
 > 
 > Signed-off-by: Andi Kleen <ak@suse.de>

Signed-off-by: Dave Jones <davej@redhat.com>

(I'm up to my eyes in various real-world crisis right now, so git maintainence
 is slacking for a month)

		Dave

-- 
http://www.codemonkey.org.uk
