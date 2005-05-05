From: Fredrik Eriksson <fredrik.eriksson@mudsphere.net>
Subject: CPU Frequency daemon: no cpufreq interface found.
Date: Fri, 6 May 2005 00:19:04 +0200
Message-ID: <200505060019.05011.fredrik.eriksson@mudsphere.net>
Reply-To: fredrik.eriksson@mudsphere.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

having problems with my Armada M700 pIII 800mhz laptop.
Ive tired pretty much everything... ive compiled every support for 
speedstepping into the kernel and it still doesnt show any interfaces. 
the sysfs doesnt show and devices in /sys/devices/system/cpu/cpu0/

and i cant see any evidence in my dmesg that CPU scaling is loaded

Anyone tried running speedstep on a Armada M700 that might be able to help?

here's a "dmesg > dmesg.txt" if that will help you find my problem
http://www.snuttefilt.org/~sajko/dmesg.txt
