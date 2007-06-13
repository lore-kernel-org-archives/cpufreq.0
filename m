From: "Patel, Tushar" <tushar.patel@bofasecurities.com>
Subject: RE: Segmentation faults on AMD
Date: Wed, 13 Jun 2007 13:14:10 -0400
Message-ID: <863ADB2B1B757B45A27E4FCCD2DD370648C489@ex2k.bankofamerica.com>
References: <863ADB2B1B757B45A27E4FCCD2DD370648C483@ex2k.bankofamerica.com>
	<29561.61.206.224.81.1181749420.squirrel@picard.linux.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-reply-to: <29561.61.206.224.81.1181749420.squirrel@picard.linux.it>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Mattia Dongili <malattia@linux.it>
Cc: cpufreq@lists.linux.org.uk

Following is what ltrace indicates:

sscanf(0x7fbffff890, 0x401d84, 0x7fbffff88c, 99, 1) = 0
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
strstr(" 0 0 0 0 ", "cpu ")                      = NULL
sscanf(0x7fbffff890, 0x401d84, 0x7fbffff88c, 99, 2) = 0
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
strstr("0 0 0 0 0", "cpu ")                      = NULL
sscanf(0x7fbffff890, 0x401d84, 0x7fbffff88c, 99, 3) = 0
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
strstr(" 0 0 0 0 ", "cpu ")                      = NULL
sscanf(0x7fbffff890, 0x401d84, 0x7fbffff88c, 99, 4) = 0
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
strstr("0 0 0 0 0", "cpu ")                      = NULL
sscanf(0x7fbffff890, 0x401d84, 0x7fbffff88c, 99, 5) = 0
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
strstr("ctxt 1217", "cpu ")                      = NULL
sscanf(0x7fbffff890, 0x401d84, 0x7fbffff88c, 99, 3) = 0
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
strstr("3620954\n", "cpu ")                      = NULL
sscanf(0x7fbffff890, 0x401d84, 0x7fbffff88c, 99, 4) = 0
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
strstr("btime 117", "cpu ")                      = NULL
sscanf(0x7fbffff890, 0x401d84, 0x7fbffff88c, 99, 4) = 0
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
strstr("8767050\n", "cpu ")                      = NULL
sscanf(0x7fbffff890, 0x401d84, 0x7fbffff88c, 99, 2) = 0
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
strstr("processes", "cpu ")                      = NULL
sscanf(0x7fbffff890, 0x401d84, 0x7fbffff88c, 99, 5) = 0
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
strstr(" 32186597", "cpu ")                      = NULL
sscanf(0x7fbffff890, 0x401d84, 0x7fbffff88c, 99, 6) = 0
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
strstr("procs_run", "cpu ")                      = NULL
sscanf(0x7fbffff890, 0x401d84, 0x7fbffff88c, 99, 0) = 0
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
strstr("procs_blo", "cpu ")                      = NULL
sscanf(0x7fbffff890, 0x401d84, 0x7fbffff88c, 99, 0) = 0
feof(0x505360)                                   = 0
fgets("", -1073743728, 0x505440)                 = 0x7fbffff890
feof(0x505360)                                   = 0
fgets("\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\
377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377"..., 0,
0x505440) = NULL
feof(0x505360)                                   = 1
fclose(0x505360)                                 = 0
cpufreq_cpu_exists(0, 0x524000, 126129, 0x505590, 125552) = 0
cpufreq_cpu_exists(0, 0x7fbffff700, 0, 0x2a95832d25, 1) = 0
dcgettext(0, 0x401dec, 5, 0x2a95832d25, 1)       = 0x401dec
printf("analyzing CPU %d:\n", 0analyzing CPU 0:
)                 = 17
cpufreq_get_freq_kernel(0, 1024, 0x2a959aa5f0, 0x401dfe, 1 <unfinished
...>
--- SIGSEGV (Segmentation fault) ---
+++ killed by SIGSEGV +++ 

-----Original Message-----
From: Mattia Dongili [mailto:malattia@linux.it] 
Sent: Wednesday, June 13, 2007 11:44 AM
To: Patel, Tushar
Cc: cpufreq@lists.linux.org.uk
Subject: Re: Segmentation faults on AMD
Importance: High

On Wed, June 13, 2007 4:55 pm, Patel, Tushar wrote:
> Hi,
>
> I have followed all instructions to install this tool on :
> 1.) AMD Opteron(tm) Processor 252
> 2.) AMD Opteron (tm) Processor 885
>
> I keep getting segmentation faults.
>
> Can you please help?
>
> nbk3fdu@scspgmldap01:/var/tmp/tushar/cpufrequtils-002>cpufreq-info -c 
> 0 cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006 
> Report errors and bugs to linux@brodo.de, please.
> analyzing CPU 0:
> Segmentation fault

wow, can you build with debugging symbols and get a backtrace with GDB?
build the utilities with
  make DEBUG=true
and run
  gdb ./cpufreq-info
at the gdb prompt type
  (gdb) r
wait for the program to segfault and type
  (gdb) bt

paste the resulting output.

Thanks
--
mattia
:wq!
