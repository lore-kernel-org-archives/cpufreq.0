From: Jan De Luyck <lkml@kcore.org>
Subject: cpufreq on-demand governor up_treshold?
Date: Mon, 14 Mar 2005 08:29:04 +0100
Message-ID: <200503140829.04750.lkml@kcore.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: cpufreq@ZenII.linux.org.uk

Hello lists,

(please cc me from cpufreq list)

I've since yesterday started using the ondemand governor. Seems to work fine, 
tho I can't seem to find a reason why it keeps scaling my processor speed 
upwards tho the processor use never exceeds 30% (been watching top -d 1). 

I've been using the powernowd daemon and the userspace governor previously, 
which doesn't seem to have this problem, even if i set it at the same 
sampling rates as the ondemand governor.

The settings in /sys/.../ondemand are default.

Any hints?

Thanks.
-- 
Women aren't as mere as they used to be.
  -- Pogo
