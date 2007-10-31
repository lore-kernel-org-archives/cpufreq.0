From: "Langsdorf, Mark" <mark.langsdorf@amd.com>
Subject: lock_cpu_hotplug() BUG in XEN dom0 linux-2.6.18.8
Date: Wed, 31 Oct 2007 16:49:55 -0500
Message-ID: <1449F58C868D8D4E9C72945771150BDF020770C8@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
To: cpufreq@lists.linux.org.uk

I'm working on getting the 3rd generation
Opteron PowerNow! driver to work with
Xen's linux-2.6.18.8 dom0 kernel.  Everything
seems to work fine on my side, but I keep
hitting a bug in cpufreq_ondemad.c:do_dbs_timer() 
on the  unlock_cpu_hotplug() call: 
current != recursive.

From the comments in unlock_cpu_hotplug, this
has something to do with cpufreq, and the 
do_dbs_timer code has evolved a great deal 
from 2.6.18 to 2.6.23.

Can anyone explain to me what this BUG is about,
why the cpufreq ondemand code changed, and what
is the simplest way to bring the Xen code up to
speed and get rid of the bug?  Thanks in advance
for any help or pointers.

-Mark Langsdorf
Operating System Research Center
AMD
