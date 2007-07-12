From: "Lei Yang" <leiyang@google.com>
Subject: Problem with acpi-cpufreq on 8-core machines
Date: Wed, 11 Jul 2007 17:37:35 -0700
Message-ID: <c583a31b0707111737s237dcde8m211ac2c192668300@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk

Hi list,

I found that on my 8 cpu server, the acpi-cpufreq module doesn't work
properly. The CPU is Intel(R) Xeon(R) CPU (E5345  @ 2.33GHz). First of all,
except for /sys/devices/system/cpu/cpu0/cpufreq, for all other 7 cpus the
cpufreq dir is just a link to cpu0/cpufreq. When I use the userspace
governor and scale down the frequency by editing the scaling_setspeed file
in cpu0/cpufreq, only cpu0 and cpu4 have their frequencies changed. I
verified this with a simple loop test that would report different timing
number at different frequencies. Even though the /proc/cpuinfo shows that
all cpus are running at a lower frequency. Has anyone had the same problem
before? Is there a fix for this?

Thanks a lot!

Lei
