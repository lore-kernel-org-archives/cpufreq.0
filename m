From: Vasanth Venkatachalam <vvenkata@es.nacs.uci.edu>
Subject: CPUFreq Problems After Kernel Upgrade
Date: Wed, 13 Jul 2005 15:37:22 -0700 (PDT)
Message-ID: <Pine.GSO.4.30.0507131516320.25319-100000@rigel.oac.uci.edu>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

Hi,

I recently upgraded to Fedora Linux 2.6.12 and have started having some
problems using the cpufreq driver to change the processor frequency.

To give you some background, I have written a system call that directly
calls the cpufreq_set function in cpufreq_userspace.c to change the
processor frequency.

Also, my AC adapter has been modified so that I can hook up my computer to
a power meter. However, this doesn't normally prevent me from being able to change the
clock frequency. When I boot up the computer, the OS automatically sets
the clock frequency to the lowest setting because of my modified adapter,
but I am able to change the setting using my system call and observe
programs run faster or slower.

However, my problem started soon after I upgraded from Linux 2.6.5 to
2.6.12. Now if I boot up on batteries (no AC power) and login to my
kernel, I am able to change the processor frequency and see it changing in
/proc/cpuinfo.  However, as soon as I plug the computer into AC power, the
processor frequency seems to stay the same whenever I try to change it;
there's no change in /proc/cpuinfo. Its almost as if the OS has done
something at that very moment to lock the current frequency into place.
The same effect happens if I start up the computer on AC power.

Can someone help with this? I'm guessing that the OS is responsible for
this, but I am trying to find the piece of code that is the culprit.

Vasanth

*********

Vasanth Venkatachalam                        Office: CS/E 137
PhD Candidate				     Tel: None
School of Information and Computer Science   Email: vvenkata@uci.edu
University of California
Irvine, CA 92697-3425
