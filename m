From: Johan Bilien <jobi@via.ecp.fr>
Subject: cpufreq and P3 speedstep with 2.6.0-test3 kernel
Date: Wed, 13 Aug 2003 15:58:36 +0200
Sender: cpufreq-admin@www.linux.org.uk
Message-ID: <20030813135836.GA28615@via.ecp.fr>
Mime-Version: 1.0
Return-path: <cpufreq-admin@www.linux.org.uk>
Content-Disposition: inline
Errors-To: cpufreq-admin@www.linux.org.uk
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Id: <cpufreq.vger.kernel.org>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

Hi,

I'm trying to run cpufreq on my IBM laptop Thinkpad T22, with a Pentium
3 900 (with speedstep). I have a linux 2.6.0-test3 kernel, and have
speedstep-ich.ko and speedstep-lib.ko compiled as modules. When I insmod
speedstep-lib, nothing happens. When I insmod speedstep-ich, I get:

FATAL: Error inserting speedstep_ich
(/lib/modules/2.6.0-test3/kernel/arch/i386/kernel/cpu/cpufreq/\
speedstep-ich.ko): No such device

Speedstep is set in the BIOS.

I have nothing in /sys/devices/system/cpu/cpu0, and if I insmod the
/proc interface I only get the header in /proc/cpufreq.

Do you have any idea ? Have I misconfigured something ?

Thanks,
-- 
Jobi
