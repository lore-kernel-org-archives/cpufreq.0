From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: found unsupported CPU with Enhanced SpeedStep
Date: Wed, 5 Jan 2005 18:24:15 +0100
Message-ID: <20050105172415.GH19199@poupinou.org>
References: <20041230014005.GA16358@bittwiddlers.com>
	<1104446294.24179.1.camel@localhost>
	<20050102120729.GB23300@dominikbrodowski.de>
	<20050105160622.GE19199@poupinou.org>
	<20050105162234.GA18703@bittwiddlers.com>
Reply-To: Bruno Ducrot <ducrot@poupinou.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="3siQDZowHQqNOShm"
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20050105162234.GA18703@bittwiddlers.com>
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
To: Matthew Harrell <mharrell-dated-1105374160.f5a808@bittwiddlers.com>
Cc: cpufreq list <cpufreq@www.linux.org.uk>


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 05, 2005 at 11:22:34AM -0500, Matthew Harrell wrote:
>   http://alecto.bittwiddlers.com/files/inspiron-5160/dmesg
>   http://alecto.bittwiddlers.com/files/inspiron-5160/dmesg-noht
>   http://alecto.bittwiddlers.com/files/inspiron-5160/dsdt.dat
>   http://alecto.bittwiddlers.com/files/inspiron-5160/dsdt.dsl
>   http://alecto.bittwiddlers.com/files/inspiron-5160/ssdt.dat
>   http://alecto.bittwiddlers.com/files/inspiron-5160/ssdt.dsl
> 

There is four Load statements in the ssdt.  I need to look what tables 
are loaded at run time.

Could you please send to me the result of the attached program
when HT mode?

CHeers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.

--3siQDZowHQqNOShm
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="retrive_cpus.c"

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>

#include <sys/types.h>
#include <sys/stat.h>


struct table {
	char * name;
	off_t address;
	ssize_t len;
};

static struct table tables[] = {
	{
		.name = "CPU0IST ",
		.address = 0x3FFEFBE7,
		.len = 0x00000277,
	},
	{
		.name = "CPU1IST ",
		.address = 0x3FFEFB60,
		.len = 0x00000087,
	},
	{
		.name = "CPU0CST ",
		.address = 0x3FFEF988,
		.len = 0x000001D8,
	},
	{
		.name = "CPU1CST ",
		.address = 0x0x3FFEF92C,
		.len = 0x0000005C
	},
	{
		.name = NULL,
		.address = 0,
		.len = -1
	},
};

static int fd;

static int init_sysmem(void)
{
	fd = open("/dev/mem", O_RDONLY);
	return (fd >= 0);
}

static int exit_sysmem(void)
{
	return (close(fd));
}

static int decode(struct table *t)
{
	char *p;
	int i;
	ssize_t count;

	if (fd < 0 || !t)
		return 1;

	printf("%s %lx %x\n", t->name, t->address, t->len);

	if (lseek(fd, t->address, SEEK_SET) != t->address)
		return 1;

	p = malloc(t->len);
	if (!p)
		return 1;
	
	count = read(fd, p, t->len);
	if (count != t->len) {
		free(p);
		return 1;
	}

	for (i = 0; i < t->len; i++) {
		if ((i % 16) == 0)
			printf("\n%p: ", p + i);
		printf("%.2x ", p[i] & 0xff);
	}
	printf("\n");
	
	free(p);
	return 0;
}


int main(void)
{
	struct table *t;

	fd = -1;
	if (!init_sysmem()) {
		fprintf(stderr, "Can't open /dev/mem for read.  Are you root?\n");
		exit(1);
	}

	for (t = &tables[0]; t->name; t++) {
		if (decode(t)) {
			printf("can't decode %s\n", t->name);
		}
	}
	exit_sysmem();

	return 0;
}

--3siQDZowHQqNOShm
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--3siQDZowHQqNOShm--

