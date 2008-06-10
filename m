From: "Beglin, Brad R" <brad.beglin@gatech.edu>
Subject: bug? acpi p-state + ondemand keeps dropping max freq
Date: Tue, 10 Jun 2008 17:45:16 -0400 (EDT)
Message-ID: <525679309.1481161213134316383.JavaMail.root@mail4.gatech.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: cpufreq@lists.linux.org.uk

I am also unable to change my max scaling frequency on my Thinkpad T61.  Interestingly enough, I can change the frequency as long as the new value is less than 1.2 GHz.  If I try to set the new max frequency higher than that, the max scaling frequency file reverts to 1.2GHz.  Here is in example:

# echo 2001000 > scaling_max_freq ; cat scaling_max_freq
1200000

# echo 1000000 > scaling_max_freq ; cat scaling_max_freq
1000000

# echo 1600000 > scaling_max_freq ; cat scaling_max_freq
1200000

# echo 2000000 > scaling_max_freq ; cat scaling_max_freq
1200000

I have also tried to make the change while using "echo -n" with no success.  I have also attempted to use a different governor, but that has no effect.

Here is my cpufreq-info output:

cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  driver: acpi-cpufreq
  CPUs which need to switch frequency at the same time: 0 1
  hardware limits: 800 MHz - 2.00 GHz
  available frequency steps: 2.00 GHz, 2.00 GHz, 1.60 GHz, 1.20 GHz, 800 MHz
  available cpufreq governors: conservative, userspace, ondemand, performance
  current policy: frequency should be within 800 MHz and 1.20 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).
analyzing CPU 1:
  driver: acpi-cpufreq
  CPUs which need to switch frequency at the same time: 0 1
  hardware limits: 800 MHz - 2.00 GHz
  available frequency steps: 2.00 GHz, 2.00 GHz, 1.60 GHz, 1.20 GHz, 800 MHz
  available cpufreq governors: conservative, userspace, ondemand, performance
  current policy: frequency should be within 800 MHz and 1.20 GHz.
                  The governor "ondemand" may decide which speed to use
                  within this range.
  current CPU frequency is 800 MHz (asserted by call to hardware).

Hope this helps. mp.

--
Brad R. Beglin
Computational Media Undergraduate
Georgia Institute of Technology
