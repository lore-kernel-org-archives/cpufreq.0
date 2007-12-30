From: "Kevin Lam" <kevink.lam@utoronto.ca>
Subject: acpi_cpufreq and atiixp (ALSA) issues
Date: Sun, 30 Dec 2007 00:02:18 -0500
Message-ID: <308fc45a0712292102u43b5805fy989bd9c2c25177c1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
To: cpufreq@lists.linux.org.uk

Hi,
I've got a strange problem where stepping up my CPU frequency while using
the ALSA acpi_cpufreq driver causes all currently-playing sounds/music to
cut out, often stalling the applications involved. My soundcard is the ATI
IXP, which is supposed to be fully supported by ALSA.

A more complete documentation of the things I've tried to fix this can be
found in the following forum post:
http://www.linuxforums.org/forum/linux-laptops/63126-sound-problems-cpu-stepping.html

I started the thread in July 2006, and still haven't found a satisfactory
solution after trying various distributions and kernel versions from
2.6.16.17 to 2.6.22.xx. Note that p4_clockmod does not have this issue, only
acpi_cpufreq.

I've also posted to the ALSA mailing list, since I don't actually know where
the problem lies. It would be great if someone has a solution to this.

-Kevin
