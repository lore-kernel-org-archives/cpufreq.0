From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: powernow-k8: missing p-state
Date: Tue, 9 Aug 2005 10:26:39 +0200
Message-ID: <20050809082639.GF852@poupinou.org>
References: <3f72be670508071713510f5697@mail.gmail.com>
	<20050808071603.GB852@poupinou.org>
	<20050808150713.GA11015@localhost>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="+g7M9IMkV8truYOl"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050808150713.GA11015@localhost>
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
To: Brendt Wohlberg <bw4@wohlberg.net>
Cc: cpufreq@lists.linux.org.uk


--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 08, 2005 at 09:07:13AM -0600, Brendt Wohlberg wrote:
> Hi Bruno,
> 
> Thanks for your response to my question.
> 
> > > solutions to this problem? Given the apparent number of AMD 64 motherboards 
> > > with similar problems, surely it would be useful to be able to specify
> > > the p-state table as a configuration option for the powernow-k8 module?
> > 
> > I'm unaware of this problem I'm afraid.
> 
> This was an impression I gained from reading reports I found while searching
> the web for a solution; perhaps I've exaggerated the extent of the problem.
> 
> > Is this with or without ACPI?
> 
> The kernel was built with general ACPI support (CONFIG_ACPI=y), as well
> as with the ACPI option for powernow-k8 (CONFIG_X86_POWERNOW_K8_ACPI=y).
>  
> > Could you send me the output of acpidmp, please ?
> 
> With pleasure - it's attached.

As expected, there is only 3 p-states on that one, namely 2200, 2000
and 1800 kHz.

Maybe the legacy tables are not so broken.  Could you please try that
little tool I'm attaching (compile with -O at least)?

NB: it has been written for powernow-k7 originaly.  So it will certainly
give false values.  What I want to see in fact is the number of
frequencies available.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

--+g7M9IMkV8truYOl
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="dump_psb_amd64.c"

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include <sys/mman.h>

#define LEN (0x100000 - 0xc0000)
#define OFFSET (0xc0000)

#ifndef __packed
#define __packed __attribute((packed))
#endif

static const int fid_to_mult[32] = {
	110, 115, 120, 125, 50, 55, 60, 65,
	70, 75, 80, 85, 90, 95, 100, 105,
	30, 190, 40, 200, 130, 135, 140, 210,
	150, 225, 160, 165, 170, 180, -1, -1,
};

static const int vid_to_voltage[32] = {
	2000, 1950, 1900, 1850, 1800, 1750, 1700, 1650,
	1600, 1550, 1500, 1450, 1400, 1350, 1300, 0,
	1275, 1250, 1225, 1200, 1175, 1150, 1125, 1100,
	1075, 1050, 1024, 1000, 975, 950, 925, 0,
}; 

struct psb_header {
	char signature[10];
	u_char version;
	u_char flags;
	u_short settlingtime;
	u_char res1;
	u_char numpst;
} __packed;

struct pst_header {
	u_int32_t cpuid;
	u_char fsb;
	u_char maxfid;
	u_char startvid;
	u_char numpstates;
} __packed;

static u_int fsb;
static u_int sgtc;

static int
decode_pst(char *p, int npstates)
{
	int i;
	int freq, fid, vid;

	for (i = 0; i < npstates; ++i) {
		fid = *p++;
		vid = *p++;
		freq = 100 * fid_to_mult[fid] * fsb;

		printf("   %2d %8dkHz  FID %02x (%2d.%01d)  VID %02x (%4dmV)\n",
		       i,
		       freq,
		       fid, fid_to_mult[fid]/10, fid_to_mult[fid]%10,
		       vid, vid_to_voltage[vid]);
	}

	return 0;
}

static
void decode_psb(char *p, int numpst)
{
	int i;
	struct psb_header *psb;
	struct pst_header *pst;

	psb = (struct psb_header*) p;

	if (psb->version != 0x14)
		return;

	printf("PSB version: %hhx flags: %hhx settling time %hhuus res1 %hhx num pst %hhu\n",
			psb->version,
			psb->flags,
			psb->settlingtime,
			psb->res1,
			psb->numpst);
	sgtc = psb->settlingtime * 100;

	if (sgtc < 10000)
		sgtc = 10000;

	p = ((char *) psb) + sizeof(struct psb_header);

	if (numpst < 0)
		numpst = psb->numpst;
	else
		printf("Overriding number of pst :%d\n", numpst);

	for (i = 0; i < numpst; i++) {
		pst = (struct pst_header*) p;

		printf("  PST %d  cpuid %.3x fsb %hhu mfid %hhx svid %hhx numberstates %hhu\n",
				i+1,
				pst->cpuid,
				pst->fsb,
				pst->maxfid,
				pst->startvid,
				pst->numpstates);

		fsb = pst->fsb;
		decode_pst(p + sizeof(struct pst_header), pst->numpstates);
		p += sizeof(struct pst_header) + 2*pst->numpstates;
	}

}

int
main(int argc, char *argv[])
{
	int fd;
	int numpst;
	char *mem = NULL;
	char *p;

	if (argc < 2)
		numpst = -1;
	else
		numpst = strtoul(argv[1], NULL, 0);

	fd = open("/dev/mem", O_RDONLY);
	if (fd < 0) {
		exit(1);
	}

	mem = mmap(mem, 0x100000 - 0xc0000, PROT_READ, MAP_SHARED, fd, 0xc0000);
	close(fd);

	for (p = mem; p - mem < LEN; p+=16) {
		if (memcmp(p, "AMDK7PNOW!", 10) == 0) {
			decode_psb(p, numpst);
			break;
		}
	}

	munmap(mem, LEN);
	return 0;
}

--+g7M9IMkV8truYOl
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--+g7M9IMkV8truYOl--

