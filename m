From: paul.devriendt@amd.com
Subject: RE: cpufreqd + acpi - error message
Date: Mon, 17 May 2004 18:55:52 -0500
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <99F2150714F93F448942F9A9F112634C1365B7FA@txexmtae.amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: mailonde@gmx.net, cpufreq@www.linux.org.uk
Cc: mark.langsdorf@amd.com, dongili@supereva.it

I ran into this. libsys_init() in libsys_acpi.c gets upset if
the number of batteries is less than 0. The number of batteries
being returned is -1. I got it working by just hardcoding the
number of batteries to 0 instead, and it seemed happy with that
(my machine does not even support batteries, it is a 4P server).

I have not reported it to the maintainers yet, as I am not
really sure which code is at fault. It is on my list to look
at further and try to decide what ought to be happening here.
The -1 return comes from a scandir() call.

Paul.

> -----Original Message-----
> From: mailnode [mailto:mailnode@gmx.net] 
> Sent: Monday, May 17, 2004 4:30 PM
> To: cpufreq@www.linux.org.uk
> Subject: cpufreqd + acpi - error message
> 
> hi 
> 
> I am trying to get cpufreq daemon running with acpi. It works 
> fine with apm, but not with acpi. I tried cpufreq 1.1.1 and 
> 1.1.2. tried it on kernels 2.4.26, 2.6.5, 2.6.6. If I try to 
> load cpufreq daemon with acpi, I get following output:
> 
> May 17 22:15:30 linux cpufreqd: parse_config(): Rule "lo_cpu" 
> has Profile "lo"
> May 17 22:15:30 linux cpufreqd: parse_config(): Rule "hi_cpu" 
> has Profile "hi"
> May 17 22:15:30 linux cpufreqd: Starting operations.
> May 17 22:15:30 linux cpufreqd: libsys_preinit(): 
> pre-initialization done.
> May 17 22:15:30 linux cpufreqd: libsys_init(): ACPICA version 
> 20040326 May 17 22:15:30 linux cpufreqd: libsys_init() - 
> scandir: No such file or directory May 17 22:15:30 linux 
> cpufreqd: libsys_init() - found -1 battery slots May 17 
> 22:15:30 linux cpufreqd: libsys_init() - scandir: No such 
> file or directory May 17 22:15:30 linux cpufreqd: 
> daemonize(): going background, bye.
> May 17 22:15:30 linux cpufreqd: pid: 1205 May 17 22:15:30 
> linux cpufreqd: main_loop(): Can't get system info. Exiting.
> May 17 22:15:30 linux cpufreqd: free_config(): freeing rule lo_cpu.
> May 17 22:15:30 linux cpufreqd: free_config(): freeing 
> battery interval 101--1.
> May 17 22:15:30 linux cpufreqd: free_config(): freeing cpu 
> interval 0-30.
> May 17 22:15:30 linux cpufreqd: free_config(): freeing program list.
> May 17 22:15:30 linux cpufreqd: free_config(): freeing rule hi_cpu.
> May 17 22:15:30 linux cpufreqd: free_config(): freeing 
> battery interval 101--1.
> May 17 22:15:30 linux cpufreqd: free_config(): freeing cpu 
> interval 30-100.
> May 17 22:15:30 linux cpufreqd: free_config(): freeing program list.
> May 17 22:15:30 linux cpufreqd: free_config(): freeing profile lo.
> May 17 22:15:30 linux cpufreqd: free_config(): freeing profile hi.
> 
> "Can't get system info. Exiting." Buggy acpi, Bug, or did I 
> misconfigure anything on my machine? I use Debian woody, and 
> have loaded the "processor" 
> and "powernow-k8" modules and can access 
> /proc/acpi/processor... and apci daemon is running.
> Where does cpufreqd look for the system info it needs? Whats 
> missing, wrong?
> 
> Thanks
> Roland
> 
> PS: I have an AMD64 with Asus k8v se deluxe. Bios v.1001
> 
> _______________________________________________
> Cpufreq mailing list
> Cpufreq@www.linux.org.uk
> http://www.linux.org.uk/mailman/listinfo/cpufreq
> 
