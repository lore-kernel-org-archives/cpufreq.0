From: Christian Flamm <alcc@gmx.de>
Subject: I haven't been able to set the chosen policy for CPU0
Date: Mon, 19 May 2008 18:42:21 +0200
Message-ID: <200805191842.22216.alcc@gmx.de>
Reply-To: alcc@gmx.de
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

I think I can now reproduce that misbehaviour. I happens when both of my cores 
are at 100%  - than min- *and* max-frequency fall down to minimum (1000000Hz)

$ cpufreq-info
	cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
	Report errors and bugs to linux@brodo.de, please.
	analyzing CPU 0:
	  driver: acpi-cpufreq
	  CPUs which need to switch frequency at the same time: 0 1
	  hardware limits: 1000 MHz - 1.67 GHz
	  available frequency steps: 1.67 GHz, 1.33 GHz, 1000 MHz
	  available cpufreq governors: conservative, ondemand, userspace, powersave, 
performance
	  current policy: frequency should be within 1000 MHz and 1000 MHz.
	                  The governor "performance" may decide which speed to use
	                  within this range.
	  current CPU frequency is 1000 MHz (asserted by call to hardware).
	analyzing CPU 1:
	  driver: acpi-cpufreq
	  CPUs which need to switch frequency at the same time: 0 1
	  hardware limits: 1000 MHz - 1.67 GHz
	  available frequency steps: 1.67 GHz, 1.33 GHz, 1000 MHz
	  available cpufreq governors: conservative, ondemand, userspace, powersave, 	
performance	
	  current policy: frequency should be within 1000 MHz and 1000 MHz.
                  	The governor "performance" may decide which speed to use
        	        within this range.
	  current CPU frequency is 1000 MHz (asserted by call to hardware).

If I then try to force another policy manually by

(just to show you) 
$ cpufreqd-get
	Name (#1):      Halbgas
	Governor:       ondemand
	Min freq:       1000000
	Max freq:       1667000
	
	Name (#2):      Vollgas
	Active on CPU#: 0, 1
	Governor:       performance
	Min freq:       1667000
	Max freq:       1667000

$ cpufreqd-set 2

the log says: 
	"cpufreqd_set_profile     : Couldn't set profile "Vollgas" set for cpu 
(1667000-1667000-performance)_"

or

$ cpufreqd-set 1

the log says: 
	"I haven't been able to set the chosen policy for CPU0._I set 
1667000-1000000-ondemand_System says 1000000-1000000-ondemand_"

After a certain while (10 minutes) the manual commands work and stay for about 
5 minutes if both of my cores are fully stressed and than the whole story 
starts all over.

Regards, Christian.
