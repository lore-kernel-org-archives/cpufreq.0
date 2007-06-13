From: "Patel, Tushar" <tushar.patel@bofasecurities.com>
Subject: RE: Segmentation faults on AMD
Date: Wed, 13 Jun 2007 11:56:11 -0400
Message-ID: <863ADB2B1B757B45A27E4FCCD2DD370648C486@ex2k.bankofamerica.com>
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

# gdb cpufreq-infoGNU gdb Red Hat Linux (6.3.0.0-1.132.EL4rh)
Copyright 2004 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you
are
welcome to change it and/or distribute copies of it under certain
conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for
details.
This GDB was configured as "x86_64-redhat-linux-gnu"...
(no debugging symbols found)
Using host libthread_db library "/lib64/tls/libthread_db.so.1".

(gdb) r
Starting program: /var/tmp/tushar/cpufrequtils-002/cpufreq-info 
(no debugging symbols found)
(no debugging symbols found)
(no debugging symbols found)
(no debugging symbols found)
cpufrequtils 002: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:

Program received signal SIGSEGV, Segmentation fault.
0x0000002a957ac311 in ____strtoull_l_internal () from
/lib64/tls/libc.so.6
(gdb) bt
#0  0x0000002a957ac311 in ____strtoull_l_internal () from
/lib64/tls/libc.so.6
#1  0x0000002a9566e066 in sysfs_get_one_value () from
/usr/lib/libcpufreq.so.0
#2  0x0000002a9566d93a in cpufreq_get_freq_kernel ()
   from /usr/lib/libcpufreq.so.0
#3  0x000000000040127f in ?? ()
#4  0x0000000000401a4c in ?? ()
#5  0x0000002a957963fb in __libc_start_main () from /lib64/tls/libc.so.6
#6  0x0000000000400f8a in ?? ()
#7  0x0000007fbffff9b8 in ?? ()
#8  0x000000000000001c in ?? ()
#9  0x0000000000000001 in ?? ()
#10 0x0000007fbffffb99 in ?? ()
#11 0x0000000000000000 in ?? ()
(gdb) 

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
