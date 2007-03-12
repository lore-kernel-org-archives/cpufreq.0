From: Dave Jones <davej@redhat.com>
Subject: ondemand excessive wakeups.
Date: Mon, 12 Mar 2007 15:02:40 -0400
Message-ID: <20070312190240.GA19796@redhat.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk

A colleague noticed that his laptop in runlevel 3 was doing ~120 context
switches a second whilst completely idle.  Process of elimation worked out
that after disabling acpi-cpufreq & ondemand, the cs drop to around 4 per sec.

cpufreq.debug=7 yields ..

cpufreq-core: target for CPU 0: 1200000 kHz, relation 1
acpi-cpufreq: acpi_cpufreq_target 1200000 (0)
freq-table: request for target 1200000 kHz (relation: 1) for cpu 0
freq-table: target is 0 (1200000 kHz, 0)
acpi-cpufreq: get_cur_val = 100664839
cpufreq-core: notification 0 of frequency transition to 1200000 kHz
userspace: saving cpu_cur_freq of cpu 0 to be 1200000 kHz
cpufreq-core: notification 1 of frequency transition to 1200000 kHz
userspace: saving cpu_cur_freq of cpu 0 to be 1200000 kHz
cpufreq-core: target for CPU 0: 771428 kHz, relation 0
printk: 35 messages suppressed.
cpufreq-core: target for CPU 0: 1200000 kHz, relation 1
printk: 17 messages suppressed.
cpufreq-core: target for CPU 0: 1200000 kHz, relation 1
acpi-cpufreq: acpi_cpufreq_target 1200000 (0)
freq-table: request for target 1200000 kHz (relation: 1) for cpu 0
printk: 15 messages suppressed.
cpufreq-core: target for CPU 0: 1200000 kHz, relation 1
acpi-cpufreq: acpi_cpufreq_target 1200000 (0)
printk: 61 messages suppressed.
cpufreq-core: target for CPU 0: 1200000 kHz, relation 1
printk: 17 messages suppressed.
cpufreq-core: target for CPU 0: 1200000 kHz, relation 1
acpi-cpufreq: acpi_cpufreq_target 1200000 (0)

Any ideas?  With tickless now being default on i386, it's somewhat
nasty that a part of the system responsible for power saving is
causing us to waste power ;-)

	Dave

-- 
http://www.codemonkey.org.uk
