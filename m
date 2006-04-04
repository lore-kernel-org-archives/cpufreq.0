From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 6331] cpu frequency gets lowered by kernel when cord is
	pulled(init=bin/sh)
Date: Tue, 4 Apr 2006 13:48:53 -0700
Message-ID: <200604042048.k34Kmrat016761@fire-2.osdl.org>
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=6331





------- Additional Comments From mike@palczewski.net  2006-04-04 13:48 -------
damn hardware!
well, if anyone else does a search on this issue, here's a cool workaround to
put in your scripts, 

 while [ `cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq` != \
            `cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq` ]
    do
        cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq > \
            /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
        sleep 1;
    done


------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
