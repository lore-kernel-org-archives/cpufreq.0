From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Can you please try this powernow-k8.c patch ?
Date: Wed, 17 Nov 2004 14:41:02 +0100
Message-ID: <20041117134102.GW31422@poupinou.org>
References: <84EA05E2CA77634C82730353CBE3A84301539DCB@SAUSEXMB1.amd.com>
	<20041116203853.GV31422@poupinou.org>
	<20041116210712.GA9343@dominikbrodowski.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="JWEK1jqKZ6MHAcjA"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041116210712.GA9343@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk


--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 16, 2004 at 10:07:12PM +0100, Dominik Brodowski wrote:
> > #include <stdio.h>
> > static int get_fidvid(unsigned int cpu, unsigned int *fid, unsigned int *vid)
> > {
> > 	int err = 1;
> > 	unsigned long long msr;
> just curious: is this correct on 32 and 64 bit build?

IIRC the 'only' difference is for 'long int' which will
be 64bits for amd64 and 32bits for i386, but it's certainly better
to use intN_t to be sure.

> > 	if (argc < 2) {
> > 		printf("usage %s cpu\n", argv[0]);
> > 		exit(1);
> please make it default to cpu0 if there is no cpu specified (unless you
> convince me otherwise)

Done.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

--JWEK1jqKZ6MHAcjA
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
#include <stdint.h>
#include <unistd.h>
#include <errno.h>
#include <fcntl.h>

#include <sys/types.h>
#include <sys/stat.h>

#define MCPU 32

#define MSR_FIDVID_STATUS	0xc0010042

#define MSR_S_HI_CURRENT_VID	0x0000001f
#define MSR_S_LO_CURRENT_FID	0x0000003f

static int get_fidvid(uint32_t cpu, uint32_t *fid, uint32_t *vid)
{
	int err = 1;
	uint64_t msr = 0;
	int fd;
	char file[20];

	if (cpu > MCPU)
		goto out;

	sprintf(file, "/dev/cpu/%d/msr", cpu);

	fd = open(file, O_RDONLY);
	if (fd < 0)
		goto out;
	lseek(fd, MSR_FIDVID_STATUS, SEEK_CUR);
	if (read(fd, &msr, 8) != 8)
		goto err1;

	*fid = ((uint32_t )(msr & 0xffffffffull)) & MSR_S_LO_CURRENT_FID;
	*vid = ((uint32_t )(msr>>32 & 0xffffffffull)) & MSR_S_HI_CURRENT_VID;
	err = 0;
err1:
	close(fd);
out:
	return err;
}


/* Return a frequency in MHz, given an input fid */
static uint32_t find_freq_from_fid(uint32_t fid)
{
	return 800 + (fid * 100);
}

/* Return a voltage in miliVolts, given an input vid */
static uint32_t find_millivolts_from_vid(uint32_t vid)
{
	return 1550-vid*25;
}

int main (int argc, char *argv[])
{
	int err;
	int cpu;
	uint32_t fid, vid;

	if (argc < 2)
		cpu = 0;
	else
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

--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--JWEK1jqKZ6MHAcjA--

