From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Can you please try this powernow-k8.c patch ?
Date: Tue, 16 Nov 2004 21:38:53 +0100
Message-ID: <20041116203853.GV31422@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A84301539DCB@SAUSEXMB1.amd.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="R3G7APHDIzY6R/pk"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <84EA05E2CA77634C82730353CBE3A84301539DCB@SAUSEXMB1.amd.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@www.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: "Devriendt, Paul" <paul.devriendt@amd.com>
Cc: cpufreq@www.linux.org.uk


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 16, 2004 at 12:32:05PM -0600, Devriendt, Paul wrote:
> > Well, it seems to have done the trick for the frequency,
> > Thanks very much, 
> > 
> > Also I can see in /sys/devices/system/cpu/cpu0/cpufreq a 
> > changed value of 
> > frequency, is it possible to see if voltage changes as well? 
> > Looking at the 
> > log provided, I see, that only frequency seems to be changing 
> > (although I 
> > finally seem to get cooler CPU, I can hear the fan reducing 
> > RPM, sometimes 
> > turning off at all :))
> 
> I'm glad it fixed the problem. The voltage is changing, you can
> see it from the debug log:
> 
> > powernow-k8: writing vid 0x18, lo 0x11800, hi 0x1
> > powernow-k8: ph3 complete, currfid 0x0, currvid 0x18
> > powernow-k8: transitioned (cpu0): new fid 0x0, vid 0x18
> 
> The voltage information is not available from the cpufreq
> files. The only way I know to see the voltage information is
> to either switch on debug in the driver or look at the values
> in the fid/vid status MSR, which is a register that can only
> be accessed from kernel space.

But MSR can be acceded in userspace via the msr driver.

Could you please test the attached little program?

This give me:

ducrot@poupoune:~/debug/cpufrequtils-0.1-pre2$ cpufreq-info     
cpufrequtils 0.1-pre2: cpufreq-info (C) Dominik Brodowski 2004
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  driver: powernow-k8
  hardware limits: 1000 MHz - 2.20 GHz
  available frequency steps: 2.20 GHz, 2.00 GHz, 1000 MHz
  available cpufreq governors: powersave, userspace, performance
  current policy: frequency should be within 1000 MHz and 2.20 GHz.
                  The governor "userspace" may decide which speed to use
                  within this range.
  current CPU frequency is 2.20 GHz.
analyzing CPU 1:
  driver: powernow-k8
  hardware limits: 1000 MHz - 2.20 GHz
  available frequency steps: 2.20 GHz, 2.00 GHz, 1000 MHz
  available cpufreq governors: powersave, userspace, performance
  current policy: frequency should be within 1000 MHz and 2.20 GHz.
                  The governor "userspace" may decide which speed to use
                  within this range.
  current CPU frequency is 1000 MHz.
ducrot@poupoune:~/debug/cpufrequtils-0.1-pre2$ sudo ./debug/x86_64/powernow-k8-decode 0
cpu 0 currently at 2200 MHz and 1500 mV
ducrot@poupoune:~/debug/cpufrequtils-0.1-pre2$ sudo ./debug/x86_64/powernow-k8-decode 1
cpu 1 currently at 1000 MHz and 1100 mV

Dominik, is it OK to put it in your cpufrequtils after review?

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

--R3G7APHDIzY6R/pk
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="powernow-k8-decode.c"

/*
 *  (C) 2004 Bruno Ducrot <ducrot@poupinou.org>
 *
 *  Licensed under the terms of the GNU GPL License version 2.
 *
 * Based on code found in
 * linux/arch/i386/kernel/cpu/cpufreq/powernow-k8.c
 * and originally developed by Paul Devriendt
 */

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>

#include <sys/types.h>
#include <sys/stat.h>

#define MSR_FIDVID_STATUS	0xc0010042

#define MSR_S_HI_CURRENT_VID	0x0000001f
#define MSR_S_LO_CURRENT_FID	0x0000003f

static int get_fidvid(unsigned int cpu, unsigned int *fid, unsigned int *vid)
{
	int err = 1;
	unsigned long long msr;
	int fd;
	char file[20];

	if (cpu > 32)
		goto out;

	sprintf(file, "/dev/cpu/%d/msr", cpu);

	fd = open(file, O_RDONLY);
	if (fd < 0)
		goto out;
	lseek(fd, MSR_FIDVID_STATUS, SEEK_CUR);
	if (read(fd, &msr, 8) != 8)
		goto err1;

	*fid = ((unsigned int)(msr & 0xffffffffull)) & MSR_S_LO_CURRENT_FID;
	*vid = ((unsigned int)(msr>>32 & 0xffffffffull)) & MSR_S_HI_CURRENT_VID;
	err = 0;
err1:
	close(fd);
out:
	return err;
}


/* Return a frequency in MHz, given an input fid */
static unsigned int find_freq_from_fid(unsigned int fid)
{
	        return 800 + (fid * 100);
}

/* Return a voltage in miliVolts, given an input vid */
static unsigned int find_millivolts_from_vid(unsigned int vid)
{
	        return 1550-vid*25;
}

int main (int argc, char **argv)
{
	int err;
	int cpu;
	unsigned int fid, vid;

	if (argc < 2) {
		printf("usage %s cpu\n", argv[0]);
		exit(1);
	}

	cpu = strtoul(argv[1], NULL, 0);
	err = get_fidvid(cpu, &fid, &vid);

	if (err) {
		printf("can't get fid, vid from MSR\n");
		printf("Possible trouble: you don't run a powernow-k8 capable cpu\n");
		printf("or you are not root, or the msr driver is not present\n");
		exit(1);
	}

	
	printf("cpu %d currently at %d MHz and %d mV\n",
			cpu,
			find_freq_from_fid(fid),
			find_millivolts_from_vid(vid));
	
	return 0;
}

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--R3G7APHDIzY6R/pk--

