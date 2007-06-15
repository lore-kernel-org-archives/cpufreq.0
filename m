From: Mattia Dongili <malattia@linux.it>
Subject: Re: Segmentation faults on AMD
Date: Fri, 15 Jun 2007 15:15:48 +0900
Message-ID: <20070615061548.GC9034@inferi.kami.home>
References: <863ADB2B1B757B45A27E4FCCD2DD370648C483@ex2k.bankofamerica.com>
	<29561.61.206.224.81.1181749420.squirrel@picard.linux.it>
	<863ADB2B1B757B45A27E4FCCD2DD370648C486@ex2k.bankofamerica.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <863ADB2B1B757B45A27E4FCCD2DD370648C486@ex2k.bankofamerica.com>
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
Content-Transfer-Encoding: 7bit
To: "Patel, Tushar" <tushar.patel@bofasecurities.com>
Cc: cpufreq@lists.linux.org.uk

On Wed, Jun 13, 2007 at 11:56:11AM -0400, Patel, Tushar wrote:
> # gdb cpufreq-infoGNU gdb Red Hat Linux (6.3.0.0-1.132.EL4rh)
...
> Program received signal SIGSEGV, Segmentation fault.
> 0x0000002a957ac311 in ____strtoull_l_internal () from
> /lib64/tls/libc.so.6
> (gdb) bt
> #0  0x0000002a957ac311 in ____strtoull_l_internal () from
> /lib64/tls/libc.so.6
> #1  0x0000002a9566e066 in sysfs_get_one_value () from
> /usr/lib/libcpufreq.so.0
> #2  0x0000002a9566d93a in cpufreq_get_freq_kernel ()
>    from /usr/lib/libcpufreq.so.0

hmmm, strtoul segfaults when the first argument is NULL, but given the
code in sysfs_get_one_value I'd say there's something strange going on:

        if ( sysfs_read_attribute(attr) || attr->value == NULL || attr->len == 0 )
        {
                sysfs_close_attribute(attr);
                return 0;
        }

        value = strtoul(attr->value, &endp, 0);

What does /sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq
contains on your system?

-- 
mattia
:wq!
