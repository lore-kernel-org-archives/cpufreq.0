From: anders@latitude.mynet.no-ip.org
Subject: permissions on /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
Date: Wed, 18 Jan 2006 11:34:23 +0100
Message-ID: <20060118103423.C62755E401E@latitude.mynet.no-ip.org>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
To: cpufreq@lists.linux.org.uk


Hi,

I'd like for a selected group of users to be able to change the frequency.
However, /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed is:

-rw-r--r--  1 root root 4096 Jan 18 11:24 scaling_setspeed

What's the best way to change that to another group and g+w ? (and no, I don't
want to fiddle with sudo...)

/Anders
